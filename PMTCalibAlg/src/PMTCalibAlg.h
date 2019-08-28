#ifndef PMTCalibAlg_h
#define PMTCalibAlg_h

#include <boost/python.hpp>
#include <SniperKernel/AlgBase.h>
#include <BufferMemMgr/IDataMemMgr.h>
#include "TH1F.h"
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
    std::string m_CalibFile;

    // user's definition
    TH1F* chargeSpec[20000];
};
#endif
