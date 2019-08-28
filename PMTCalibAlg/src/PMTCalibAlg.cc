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

DECLARE_ALGORITHM(PMTCalibAlg);

PMTCalibAlg::PMTCalibAlg(const std::string& name)
  : AlgBase(name),
    m_totalPMT(17746)
{
    std::string base = getenv("JUNOTOP");
    m_CalibFile = base+"/data/Reconstruction/Deconvolution/share/SPE.root";
    declProp("TotalPMT",m_totalPMT);
    declProp("CalbFile",m_CalibFile);
    declProp("LED",m_CalibStyle);
}

PMTCalibAlg::~PMTCalibAlg(){}

bool PMTCalibAlg::initialize()
{

  LogInfo << "initialized successfully ! " << std::endl;

    //SniperDataPtr<JM::NavBuffer>  navBuf(getParent(), "/Event");
    SniperDataPtr<JM::NavBuffer>  navBuf(getScope(), "/Event");//J17
    if ( navBuf.invalid() ) {
        LogError << "cannot get the NavBuffer @ /Event" << std::endl;
        return false;
    }
    m_buf = navBuf.data();

    //user data definitions
    SniperPtr<RootWriter> svc("RootWriter");
    if (svc.invalid()) {
        LogError << "Can't Locate RootWriter. If you want to use it, please "
                 << "enalbe it in your job option file."
                 << std::endl;
        return false;
    }
  
    //LED calib outputfile
    for(int i=0;i<m_totalPMT;i++){
      TString chName=Form("ch%d_charge_spec",i);
      chargeSpec[i]=new TH1F(chName,chName,100,0,5);
      svc->attach("FILE1",chargeSpec[i]);
    }

    return true;

}

bool PMTCalibAlg::execute()
{
    
  LogDebug << "---------------------------------------" << std::endl;
  JM::EvtNavigator* nav = m_buf->curEvt(); 

  // read CalibHit data
    JM::CalibHeader* chcol =(JM::CalibHeader*) nav->getHeader("/Event/Calib"); 
    const std::list<JM::CalibPMTChannel*>& chhlist = chcol->event()->calibPMTCol();

    //LED source algorithm 
    if(m_CalibStyle=="LED"){
      LEDCalib(chhlist);
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



    return true;
 
}

bool PMTCalibAlg::finalize()
{
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
