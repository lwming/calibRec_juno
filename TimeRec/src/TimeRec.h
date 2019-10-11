#ifndef TimeRec_h
#define TimeRec_h

#include <boost/python.hpp>
#include "SniperKernel/AlgBase.h"
#include "BufferMemMgr/IDataMemMgr.h"
#include "ElecBufferMgrSvc/IElecBufferMgrSvc.h"
#include "GlobalTimeSvc/IGlobalTimeSvc.h"
#include "EvtNavigator/NavBuffer.h"
#include "TTree.h"
#include "TProfile.h"
#include "TH2.h"
class ElecFeeCrate;
class DataBufSvcV2;

namespace JM
{
    class ElecFeeCrate;
    class ElecFeeChannel;
}

class TimeRec: public AlgBase
{
    public:
        TimeRec(const std::string& name);
        ~TimeRec();

    public:
        bool initialize();
        bool execute();
        bool finalize();

    private:
        JM::NavBuffer* m_buf;
        JM::ElecFeeCrate* m_crate;
        
        std::vector<double> tOffset;

        double m_windowLength;
        std::string algOption;


    private:
        // user's definition
        
        TTree* m_calib;
        std::vector<float> m_charge;
        std::vector<float> m_time;
        std::vector<int> m_pmtId;
        float m_totalpe;

        TProfile *prof1;
        TH2D *h2;
        TH1D *h1;
        TH1D *time;
        TH1D* ref_time;


    private:
        // timeRec algorithm
         
        double getNPE(JM::ElecFeeChannel& channel, double baseline, double threshold);
        double getFHT_fixed(JM::ElecFeeChannel& channel, double baseline, double threshold);
        double getFHT_fitting1(JM::ElecFeeChannel& channel, double baseline, double threshold);


};

#endif
