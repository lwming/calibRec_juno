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
#include "TTree.h"
#include "TVector3.h"
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
        double getFHT(JM::ElecFeeChannel& channel, double threshold);
        double getFHT_CFD(JM::ElecFeeChannel& channel, double threshold, double baseline);
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
        TTree* m_corr;
        std::vector<int> m_pmtId;
        double m_time[17739];
        int m_count[17739];
        double m_nPE[17739];
        std::vector<int> triggerTime;

        double ChaCenRec_x;
        double ChaCenRec_y;
        double ChaCenRec_z;

    private:
        //user's definition
        //TH2D* Q2deltaT[17739];
        TH2D* Q2deltaT;




};

#endif
