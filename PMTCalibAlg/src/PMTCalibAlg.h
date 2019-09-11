#ifndef PMTCalibAlg_h
#define PMTCalibAlg_h

#include <boost/python.hpp>
#include <SniperKernel/AlgBase.h>
#include <BufferMemMgr/IDataMemMgr.h>
#include "TH1F.h"
#include "TTree.h"
#include <fstream>
#include <string>
#include "EvtNavigator/NavBuffer.h"


class DataBufSvcV2;

namespace JM
{
  class CalibHeader;
  class CalibEvent;
  class CalibPMTChannel;
}

class PMTCalibAlg: public AlgBase
{
  public:
    PMTCalibAlg(const std::string& name);
    ~PMTCalibAlg();

  public:
    bool initialize();
    bool execute();
    bool finalize();

  private:
    JM::NavBuffer* m_buf; 

    IDataMemMgr* m_memMgr;
    int m_totalPMT;
    double m_waveLength;
    std::string m_CalibFile;
    std::string m_CalibStyle;

    // user's definition
    double PECounter[20000];
    double gainScale[20000];
    TH1F* darkCount;
    TH1F* totalWaveCount;
    TH1F* chargeSpec[20000];
    bool LEDCalib(std::list<JM::CalibPMTChannel*> chhlist);
    bool EventCalib(std::list<JM::CalibPMTChannel*> chhlist);
    bool ForceCalib(std::list<JM::CalibPMTChannel*> chhlist);
    bool RelDECalib(std::list<JM::CalibPMTChannel*> chhlist);

    TTree* m_calib;
    std::vector<float> m_charge;
    std::vector<float> m_time;
    std::vector<int> m_pmtId;
    float m_totalpe;
    
  private:
    std::vector<int> pmtID;
    std::vector<double> relaDE;
    std::vector<double> gain;
    std::vector<double> toffset;
    std::vector<double> darkrate;

};
#endif

