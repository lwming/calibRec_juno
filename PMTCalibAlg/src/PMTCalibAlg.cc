#include "PMTCaliAlg.h"
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

DECLARE_ALGORITHM(PMTCaliAlg);

PMTCaliAlg::PMTCaliAlg(const std::string& name)
  : AlBase(name),
    m_totalPMT(17746)
{
    std::string base = getenv("JUNOTOP");
    m_CalibFile = base+"/data/Reconstruction/Deconvolution/share/SPE.root";
    declProp("TotalPMT",m_totalPMT);
    declProp("CalbFile",m_CalibFile);
}

PMTCaliAlg::~PMTCaliAlg(){}

bool PMTCaliAlg::initialize()
{
  for(int i=0;i<m_totalPMT;i++){
    TString chName=Form("ch%d_charge_spec",i);
    chargeSpec[i]=TH1F(chName,chName,100,0,10);
}

bool PMTCaliAlg::execute()
{
  SniperDataPtr<JM::NavBuffer> navBuf(getScope(),"/Event");
  JM::EvtNavigator* nav=navBuf->curEvt();
  JM::CalibHeader* calibH=dynamic_cast<JM::CalibHeader>(nav->getHeader("Event/CalibEvent"));
  JM::CalibEvent* calibE=dynamic_cast<JM::CalibEvent*>(calibH->event());
  JM::CalibPMTChannel* calibC;
  for(unsigned int pmtid=0;pmtid<m_totalPMT;pmtid++){
    calibC=calibE->getCalibPmtChannel(pmtid);
    double npe=calib->nPE();
    chargeSpec
  }
}

bool PMTCaliAlg::finalize()
{
}
