#include "PMTCalibAlg.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperPtr.h"
#include "RootWriter/RootWriter.h"
#include "DataRegistritionSvc/DataRegistritionSvc.h"
#include "BufferMemMgr/IDataMemMgr.h"
#include "EvtNavigator/NavBuffer.h"
#include "Event/CalibHeader.h"
#include "Event/CalibEvent.h"
#include "Event/CalibPMTChannel.h"
#include "Identifier/CdID.h"

#include "PMTCalibSvc/PMTCalibSvc.h"
using namespace std;

DECLARE_ALGORITHM(PMTCalibAlg);

PMTCalibAlg::PMTCalibAlg(const std::string& name)
    : AlgBase(name), m_totalPMT(17613), m_waveLength(1250)
{
  std::string base = getenv("JUNOTOP");
  // m_CalibFile =
  // "/junofs/users/zhangxt/20inch/rec/deconvolution/testSvcInput/PmtPrtData.txt";//FIXME
  // m_CalibFile =
  // "/junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/src/gain.txt";//FIXME
  m_CalibFile =
      "/junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/share/output.txt";  // FIXME
  declProp("TotalPMT", m_totalPMT);
  declProp("CalbFile", m_CalibFile);
  declProp("CalibMode", m_CalibMode);
  declProp("WaveLength", m_waveLength);
}

PMTCalibAlg::~PMTCalibAlg()
{
}

bool PMTCalibAlg::initialize()
{

  LogInfo << "Iinitializing..." << std::endl;

  SniperDataPtr<JM::NavBuffer> navBuf(getParent(), "/Event");
  // SniperDataPtr<JM::NavBuffer>  navBuf(getScope(), "/Event");//J17
  if (navBuf.invalid()) {
    LogError << "cannot get the NavBuffer @ /Event" << std::endl;
    return false;
  }
  m_buf = navBuf.data();

  // user data definitions
  SniperPtr<RootWriter> svc(*getRoot(), "RootWriter");
  if (svc.invalid()) {
    LogError << "Can't Locate RootWriter. If you want to use it, please "
             << "enalbe it in your job option file." << std::endl;
    return false;
  }
  LogInfo << "Calib Mode: " << m_CalibMode << endl;
  // LED & darkrate calib outputfile
  if (m_CalibMode == "calib") {
    for (int i = 0; i < m_totalPMT; i++) {
      TString chName = Form("ch%d_charge_spec", i);
      chargeSpec[i] = new TH1F(chName, chName, 1200, -2, 10);
      svc->attach("FILE2", chargeSpec[i]);
    }
    darkCount = new TH1F("darkCount", "darkCount", m_totalPMT, 0, m_totalPMT);
    totalWaveCount = new TH1F("totalWaveCount", "totalWaveCount", 1, 0, 1);
    svc->attach("FILE2", darkCount);
    svc->attach("FILE2", totalWaveCount);
  }
  // input gain
  std::ifstream gainFile(m_CalibFile);
  double tmp;
  double tmp1;
  int i;
  while (gainFile >> i >> tmp >> tmp1 >> tmp) {
    gainScale[i] = tmp1;
  }

  /*************** develop by miao***************/

  // reconstruct pmtcalib svc
  SniperPtr<PMTCalibSvc> calSvc(getParent(), "PMTCalibSvc");
  if (calSvc.invalid()) {
    LogError << "Failed to get PMTCalibSvc instance!" << std::endl;
    return false;
  }

  // save merged parameters
  if (m_CalibMode == "SavePar") {
    std::ifstream f(m_CalibFile);
    unsigned int i = 0;
    double tmp1 = 0;
    double tmp2 = 0;
    double tmp3 = 0;
    while (f >> i >> tmp1 >> tmp2 >> tmp3) {
      calSvc->setRelativeDE(i, tmp1);
      calSvc->setGain(i, tmp1);
      calSvc->setDarkRate(i, tmp1);
    }
    f.close();
  }

  // initialize channel correction data
  relaDE = calSvc->getRelativeDE();
  gain = calSvc->getGain();
  toffset = calSvc->getTimeOffset();
  darkrate = calSvc->getDarkRate();

  /***********************************************/

  m_calib = svc->bookTree("FILE1", "simple output of calibration data");
  m_calib->Branch("Charge", &m_charge);
  m_calib->Branch("Time", &m_time);
  m_calib->Branch("PMTID", &m_pmtId);
  m_calib->Branch("TotalPE", &m_totalpe, "TotalPE/F");

  return true;
}

bool PMTCalibAlg::execute()
{

  LogDebug << "---------------------------------------" << std::endl;
  m_pmtId.clear();
  m_charge.clear();
  m_time.clear();
  m_totalpe = 0;

  JM::EvtNavigator* nav = m_buf->curEvt();

  std::list<JM::CalibPMTChannel*> cpcl;  // CalibPMTChannel list

  // read CalibHit data
  JM::CalibHeader* chcol = (JM::CalibHeader*)nav->getHeader("/Event/Calib");
  const std::list<JM::CalibPMTChannel*>& chhlist =
      chcol->event()->calibPMTCol();

  // LED source algorithm
  if (m_CalibMode == "Evt") {
    EventCalib(chhlist);
  }
  // total evt count
  if (m_CalibMode == "calib") {
    totalWaveCount->Fill(0.5);
  }

  int m_channel = 0;
  std::list<JM::CalibPMTChannel*>::const_iterator chit = chhlist.begin();
  while (chit != chhlist.end()) {

    const JM::CalibPMTChannel* calib = *chit++;
    unsigned int pmtId = calib->pmtId();
    Identifier id = Identifier(pmtId);

    unsigned int detID = CdID::id(static_cast<unsigned int>(pmtId));
    if (not CdID::is20inch(id)) {
      continue;
    }

    std::vector<double> time;
    std::vector<double> charge;

    time = calib->time();
    charge = calib->charge();

    double nPE = calib->nPE();
    double firstHitTime = calib->firstHitTime();

    // LED & darkrate calib, filling pe to get spe charge spectrum, get each
    // pmt's counts and total counts
    if (m_CalibMode == "calib") {
      chargeSpec[CdID::module(id)]->Fill(nPE);
      darkCount->SetBinContent(
          CdID::module(id) + 1,
          darkCount->GetBinContent(CdID::module(id) + 1) + nPE);
    }

    m_pmtId.push_back(detID);
    firstHitTime -= toffset[m_channel];
    m_time.push_back(firstHitTime);

    JM::CalibPMTChannel* cpc = new JM::CalibPMTChannel;
    cpc->setNPE(nPE);
    cpc->setFirstHitTime(firstHitTime);
    cpc->setPmtId(pmtId);
    cpc->setTime(time);
    cpc->setCharge(charge);
    cpcl.push_back(cpc);
  }

  m_calib->Fill();

  JM::CalibEvent* ce = new JM::CalibEvent;
  ce->setCalibPMTCol(cpcl);
  JM::CalibHeader* ch = new JM::CalibHeader;
  ch->setEvent(ce);

  nav->addHeader("/Event/Calib", ch);

  LogDebug << "End of the PMT channel correction" << std::endl;

  LogInfo << "Done to read CalibPMT " << std::endl;

  return true;
}

bool PMTCalibAlg::finalize()
{
  return true;
}

bool PMTCalibAlg::EventCalib(std::list<JM::CalibPMTChannel*> chhlist)
{
  std::list<JM::CalibPMTChannel*>::iterator chit = chhlist.begin();
  while (chit != chhlist.end()) {
    JM::CalibPMTChannel* calib = *chit++;
    unsigned int pmtId = calib->pmtId();
    Identifier id = Identifier(pmtId);
    if (not CdID::is20inch(id)) {
      continue;
    }
    calib->setNPE(calib->nPE() * gainScale[pmtId]);
  }
  return true;
}
