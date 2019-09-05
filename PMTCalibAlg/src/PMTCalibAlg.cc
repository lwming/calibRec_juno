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


DECLARE_ALGORITHM(PMTCalibAlg);

PMTCalibAlg::PMTCalibAlg(const std::string& name)
  : AlgBase(name),
    m_totalPMT(17746),
    m_waveLength(1250)
{
    std::string base = getenv("JUNOTOP");
    m_CalibFile = "/junofs/users/zhangxt/20inch/rec/deconvolution/testSvcInput/PmtPrtData.txt";//FIXME
    m_GainFile = "/junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/src/gain.txt";//FIXME
    declProp("TotalPMT",m_totalPMT);
    declProp("CalbFile",m_CalibFile);
    declProp("CalibStyle",m_CalibStyle);
    declProp("WaveLength",m_waveLength);
}

PMTCalibAlg::~PMTCalibAlg(){}

bool PMTCalibAlg::initialize()
{

  LogInfo << "initialized successfully ! " << std::endl;

    SniperDataPtr<JM::NavBuffer>  navBuf(getParent(), "/Event");
    //SniperDataPtr<JM::NavBuffer>  navBuf(getScope(), "/Event");//J17
    if ( navBuf.invalid() ) {
        LogError << "cannot get the NavBuffer @ /Event" << std::endl;
        return false;
    }
    m_buf = navBuf.data();

    //user data definitions
    SniperPtr<RootWriter> svc(*getRoot(),"RootWriter");
    if (svc.invalid()) {
        LogError << "Can't Locate RootWriter. If you want to use it, please "
                 << "enalbe it in your job option file."
                 << std::endl;
        return false;
    }
  
    //LED calib outputfile
    if(m_CalibStyle=="LED"){
      for(int i=0;i<m_totalPMT;i++){
        TString chName=Form("ch%d_charge_spec",i);
        chargeSpec[i]=new TH1F(chName,chName,100,0,5);
        svc->attach("FILE1",chargeSpec[i]);
      }
    }
    //Dark Rate outputfile
    if(m_CalibStyle=="ForceTrigger"){
      darkCount=new TH1F("darkCount","darkCount",m_totalPMT,0,m_totalPMT);
      totalWaveCount=new TH1F("totalWaveCount","totalWaveCount",m_totalPMT,0,m_totalPMT);
      for(int i=0;i<m_totalPMT;i++){
        PECounter[i]=0;
      }
      EvtCounter=0;
      svc->attach("FILE1",darkCount);
      svc->attach("FILE1",totalWaveCount);
    }
    //input gain
    std::ifstream gainFile(m_GainFile);
    double tmp;
    int i;
    while(gainFile>>i>>tmp){
      gainScale[i]=tmp;
    }


    // develop by miao
    // reconstruct pmtcalib svc
    SniperPtr<PMTCalibSvc> calSvc(getParent(), "PMTCalibSvc");
    if(calSvc.invalid()) {
        LogError <<  "Failed to get PMTCalibSvc instance!" << std::endl;
        return false;
    }

    gain = calSvc->getGain();
    for(int i=0;i<10;i++){std::cout << gain[i] << std::endl;}



    return true;
}

bool PMTCalibAlg::execute()
{
    
  LogDebug << "---------------------------------------" << std::endl;
/*  JM::EvtNavigator* nav = m_buf->curEvt(); 

  // read CalibHit data
    JM::CalibHeader* chcol =(JM::CalibHeader*) nav->getHeader("/Event/Calib"); 
    const std::list<JM::CalibPMTChannel*>& chhlist = chcol->event()->calibPMTCol();

    //LED source algorithm 
    if(m_CalibStyle=="LED"){
      LEDCalib(chhlist);
    }
    if(m_CalibStyle=="Evt"){
      EventCalib(chhlist);
    }
    if(m_CalibStyle=="ForceTrigger"){
      EvtCounter++;
      ForceCalib(chhlist);
    }

    std::list<JM::CalibPMTChannel*>::const_iterator chit = chhlist.begin();
    while(chit != chhlist.end()){
    
        const JM::CalibPMTChannel *calib = *chit++;

        unsigned int pmtId = calib -> pmtId();
        Identifier id  = Identifier(pmtId);

        if(not CdID::is20inch(id)) {
            continue;
        }
        
        double nPE = calib->nPE();
        double firstHitTime = calib -> firstHitTime();


    }
    LogInfo << "Done to read CalibPMT " << std::endl;
*/
    return true;
}

bool PMTCalibAlg::finalize()
{
    /*
  for(int i=0;i<m_totalPMT;i++){
    darkCount->SetBinContent(i+1,PECounter[i]);
    totalWaveCount->SetBinContent(i+1,EvtCounter);
  }
*/
  return true;
}

bool PMTCalibAlg::LEDCalib(std::list<JM::CalibPMTChannel*> chhlist){
  std::list<JM::CalibPMTChannel*>::const_iterator chit = chhlist.begin();
  while(chit != chhlist.end()){
    const JM::CalibPMTChannel *calib = *chit++;
    unsigned int pmtId = calib -> pmtId();
    Identifier id = Identifier(pmtId);
    if(not CdID::is20inch(id)){
      continue;
    }
    double nPE=calib->nPE();
    chargeSpec[pmtId]->Fill(nPE);
  }
  return true;
}
bool PMTCalibAlg::EventCalib(std::list<JM::CalibPMTChannel*> chhlist){
  std::list<JM::CalibPMTChannel*>::iterator chit = chhlist.begin();
  while(chit != chhlist.end()){
    JM::CalibPMTChannel *calib = *chit++;
    unsigned int pmtId = calib -> pmtId();
    Identifier id = Identifier(pmtId);
    if(not CdID::is20inch(id)){
      continue;
    }
    calib->setNPE(calib->nPE()*gainScale[pmtId]);
  }
  return true;
}
bool PMTCalibAlg::ForceCalib(std::list<JM::CalibPMTChannel*> chhlist){
  std::list<JM::CalibPMTChannel*>::const_iterator chit = chhlist.begin();
  while(chit != chhlist.end()){
    const JM::CalibPMTChannel *calib = *chit++;
    unsigned int pmtId = calib -> pmtId();
    Identifier id = Identifier(pmtId);
    if(not CdID::is20inch(id)){
      continue;
    }
    PECounter[pmtId]+=calib->nPE();
  }
  return true;
}
bool PMTCalibAlg::RelDECalib(std::list<JM::CalibPMTChannel*> chhlist){
  std::list<JM::CalibPMTChannel*>::const_iterator chit = chhlist.begin();
  while(chit != chhlist.end()){
    const JM::CalibPMTChannel *calib = *chit++;
    unsigned int pmtId = calib -> pmtId();
    Identifier id = Identifier(pmtId);
    if(not CdID::is20inch(id)){
      continue;
    }
  }
  return true;
}
