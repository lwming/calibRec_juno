#ifndef TimeCorrAlg_h
#define TimeCorrAlg_h

#include <boost/python.hpp>
#include "SniperKernel/AlgBase.h"
#include "BufferMemMgr/IDataMemMgr.h"
#include "ElecBufferMgrSvc/IElecBufferMgrSvc.h"
#include "GlobalTimeSvc/IGlobalTimeSvc.h"
#include "Geometry/RecGeomSvc.h"
#include "Identifier/Identifier.h"
#include "TH2D.h"
#include "TProfile.h"
#include "TTree.h"
#include "TVector3.h"
#include "TGraph.h"
#include <vector>
#include <fstream>
#include <string>
#include "EvtNavigator/NavBuffer.h"
#include "Context/TimeStamp.h"
class ElecFeeCrate;
class DataBufSvcV2;
using  std::string;
class RecGeomSvc;
class CdGeom;

namespace JM
{
    class ElecFeeCrate;
    class ElecFeeChannel;
}

class TimeCorrAlg: public AlgBase
{
    public:
        TimeCorrAlg(const std::string& name);
        ~TimeCorrAlg();

    public:
        bool initialize();
        bool execute();
        bool finalize();

    private:
        double getNPE(JM::ElecFeeChannel& channel, double baseline);
        double getNPE_FH(JM::ElecFeeChannel& channel,double threshold, double baseline);
        double getFHT(JM::ElecFeeChannel& channel, double threshold);
        double getFHT_CFD(JM::ElecFeeChannel& channel, double threshold, double baseline);
        double getFHT_CFD_Linear(JM::ElecFeeChannel& channel, double threshold, double baseline);
        double getFHT_CFD_Linear2(JM::ElecFeeChannel& channel, double threshold, double baseline);
        double getFHT_peakFitting(JM::ElecFeeChannel& channel, double threshold, double baseline);
        bool   ChargeCenterRec();

    private:

        JM::NavBuffer* m_buf; 
        JM::ElecFeeCrate* m_crate;
        IElecBufferMgrSvc* BufferSvc;
        IGlobalTimeSvc* TimeSvc;

        TimeStamp TriggerTime;

        std::vector<double> tOffset;
        int m_totalPMT;
        double m_length;
        double Ball_R;
        double PMT_R;
        double ChaCenRec_ratio;
        string option;

        //center detector geometry
        CdGeom*  m_cdGeom;

        std::vector<TVector3> ALL_PMT_pos;

    private:
        int m_evt;
        TTree* m_corr;
        std::vector<int> m_pmtId;
        double m_time[20000];
        int m_count[20000];
        double m_nPE[20000];
        double m_nPEforFH[20000];
        std::vector<int> triggerTime;

        int num_PMT;
        double ChaCenRec_x;
        double ChaCenRec_y;
        double ChaCenRec_z;

    private:
        //user's definition
        //TH2D* Q2deltaT[20000];
        TH2D* h2;
        TProfile* Q2deltaT[20000];
        TProfile* prof_Q[10];
        TH1D* deltaT[20000];
        TH1D* deltaT_all;

        TProfile* prof2;

        TH1I* firstPeak;
        int peak_time;

        TH1I* firstPass;
        int pass_time;

        TH1D* thre;
        double threshold;

        TH1D* average_time;
        double avgTime;
    
        TProfile* rec_time; // time-walk effect check

        TH1D* ref_delta1;
        TH1D* ref_delta2;

    private:
        TH2D* waveform;
        TH1D* recTime;
        TH1D* charge_FH;

    private:
        // for single channel fitting
        double MIN_BIN = -500;
        double MAX_BIN = 500;
        int BIN_NUM = 1000;
};

#endif
