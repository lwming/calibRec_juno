///////////////////////////////////////
/*
 * Package for time reconstruction for waveforms
 * Author: miaoyu@ihep.ac.cn
 * Oct, 2019
 */
///////////////////////////////////////
#ifndef TimeRec_cc
#define TimeRec_cc
#include "TimeRec.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperDataPtr.h"
#include "SniperKernel/SniperPtr.h"
#include "RootWriter/RootWriter.h"
#include "BufferMemMgr/IDataMemMgr.h"
#include "EvtNavigator/NavBuffer.h"
#include "Context/TimeStamp.h"
#include "TTimeStamp.h"
#include "DataRegistritionSvc/DataRegistritionSvc.h"
#include "Event/ElecHeader.h"
#include "Event/CalibHeader.h"
#include "Event/CalibEvent.h"
#include "Event/CalibPMTChannel.h"
#include "PMTCalibSvc/PMTCalibSvc.h"
#include "TMath.h"

using namespace std;

DECLARE_ALGORITHM(TimeRec);

TimeRec::TimeRec(const string& name): AlgBase(name)
        , m_windowLength(1250)
{
    declProp("WindowLength", m_windowLength) ; 
    declProp("AlgOption", algOption);
}

TimeRec::~TimeRec(){}

bool TimeRec::initialize(){

    //event navigator
    SniperDataPtr<JM::NavBuffer> navBuf(getParent(), "/Event");
    if(navBuf.invalid()){
        LogError << "cannot get the NavBuffer @ /Event " << std::endl;
        return false;
    }
    m_buf = navBuf.data();

    // user data definition
    SniperPtr<RootWriter> svc(*getRoot(), "RootWriter");
    if (svc.invalid()) {
        LogError << "Can't Locate RootWriter. If you want to use it, please "
            << "enable it in your job option file."
            << std::endl;
        return false;
    }


    //user defined histograms
    prof1 = new TProfile("rec_time","rec_time v.s. rec_charge",50,0,10);
    svc->attach("CALIBEVT",prof1);
    h2 = new TH2D("time2charge", "time2charge",500,0,10,10000,0,1300);
    svc->attach("CALIBEVT",h2);
    h1 = new TH1D("rec_charge","rec_charge",1000,0,20);
    svc->attach("CALIBEVT",h1);
    time = new TH1D("rectime","rectime",2400,0,1200);
    svc->attach("CALIBEVT",time);
    ref_time = new TH1D("reftime","trigger time and fht",100,0,100);
    svc->attach("CALIBEVT",ref_time);

    // reconstruct pmtcalib svc
    SniperPtr<PMTCalibSvc> calSvc(getParent(), "PMTCalibSvc");
    if(calSvc.invalid()) {
        LogError <<  "Failed to get PMTCalibSvc instance!" << std::endl;
        return false;
    }
    // initialize channel correction data
    tOffset = calSvc->getTimeOffset();

    m_calib = svc->bookTree("CALIBEVT","simple output of calibration data");
    m_calib -> Branch("Charge", &m_charge);
    m_calib -> Branch("Time", &m_time);
    m_calib -> Branch("PMTID", &m_pmtId);
    m_calib -> Branch("TotalPE", &m_totalpe, "TotalPE/F");


    LogInfo << "Initialize successfully! " << endl;
    return true;
}


bool TimeRec::execute(){

    LogDebug << "-----------------------------------" << std::endl;
    m_pmtId.clear();
    m_charge.clear();
    m_time.clear();
    m_totalpe = 0;

    JM::EvtNavigator* nav = m_buf->curEvt(); 
    if(!nav){
        LogWarn << "can't load event navigator. " << std::endl;
        return getRoot()->stop();
    
    }
    //TTimeStamp evtTime = nav->TimeStamp();
    //cout << "evt time stamp: " << evtTime.GetSec()*1e9 + evtTime.GetNanoSec() << endl;

    std::list<JM::CalibPMTChannel*> cpcl;//CalibPMTChannel list

    // read elec event
    JM::ElecHeader* eh = dynamic_cast<JM::ElecHeader*>(nav->getHeader("/Event/Elec"));
    //JM::ElecEvent *ee = dynamic_cast<JM::ElecEvent*>(eh->event());
    JM::ElecEvent *ee = dynamic_cast<JM::ElecEvent*>(eh->event("JM::ElecEvent"));
    const JM::ElecFeeCrate& efc = ee->elecFeeCrate();
    m_crate = const_cast<JM::ElecFeeCrate*>(&efc);

    TimeStamp triggerTime = m_crate->TriggerTime();
    TimeStamp evtTime     = m_crate->EvtTimeStamp();
    double delta_ref = ( triggerTime.GetNanoSec() - evtTime.GetNanoSec() );
    ref_time->Fill(delta_ref);
    //cout << "trigger time stamp: " << triggerTime.GetSec()*1e9 + triggerTime.GetNanoSec() << endl;

    map<int,JM::ElecFeeChannel> feeChannels = m_crate->channelData();
    map<int,JM::ElecFeeChannel>::iterator it;
    
    for(it=feeChannels.begin();it!=feeChannels.end();++it){
        JM::ElecFeeChannel& channel = (it->second);
        if(channel.adc().size() == 0){
            continue;
        }
        
        int pmtID = it->first;

        double baseline = 0;
        for( int i=0; i<50; i++) {  baseline+=(channel.adc())[i];  }
        baseline /= 50;
        double baseline_sigma = 0;
        for(int k=0;k<50;k++) baseline_sigma += (((channel.adc())[k] -baseline) * ((channel.adc())[k]-baseline)); 
        baseline_sigma /= 49.;    
        baseline_sigma = TMath::Sqrt(baseline_sigma);
        double threshold = 0;
        threshold =  5*baseline_sigma;   

        double npe = -1;
        npe = getNPE(channel, baseline, threshold);  
        double firstHitTime = -1;
        if(algOption == "fixed" ) firstHitTime = getFHT_fixed(channel,baseline, threshold);
        if(algOption == "fit1"  ) firstHitTime = getFHT_fitting1(channel, baseline, threshold); 

        // only record hit time in time window
        if(firstHitTime >= 0 && firstHitTime < m_windowLength && npe>=0){
         
        prof1->Fill(npe,firstHitTime); 
        h2->Fill(npe,firstHitTime);
        time->Fill(firstHitTime);
        if(firstHitTime < 150) { h1->Fill(npe); }

//        firstHitTime -= tOffset[pmtID];
        m_pmtId.push_back(pmtID);
        m_time.push_back(firstHitTime);

        JM::CalibPMTChannel* cpc = new JM::CalibPMTChannel;
        cpc->setNPE(npe);
//        cpc->setFirstHitTime(firstHitTime);
//        cpc->setPmtId(pmtID);
        cpcl.push_back(cpc);

        }
    }

    // user's data recording
    m_calib -> Fill();

    JM::CalibEvent* ce = new JM::CalibEvent;
    ce->setCalibPMTCol(cpcl);
    JM::CalibHeader* ch = new JM::CalibHeader;
    ch->setEvent(ce);

    nav->addHeader("/Event/Calib", ch);

    LogDebug << "End of the PMT channel correction" << std::endl;


    LogInfo << "Done to read CalibPMT " << std::endl;
    
    
    return true;
}

bool TimeRec::finalize(){
    LogInfo << "Finalize successfully! " << endl;
    return true;
}


/**********************************************************/

// get charge for first hit
double TimeRec::getNPE(JM::ElecFeeChannel& channel, double baseline, double threshold){
    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0 ) return -1;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }
    
    double spe = 1065;
/*
    int pass_time = -1;
    for(int i=0; i<m_length;i++){
        if(adc[i] > threshold) {pass_time = tdc[i]; break; } 
    }
    if(pass_time < 0) return -1;

    int start = -1; int end = -1;
    for(int k=0; k<pass_time; k++){
        if( adc[pass_time-k] <= 0 ) {start = pass_time-k; break;}
    }
    if(start < 0){ start = 0;}
    
    for(int k=pass_time; k<m_length; k++){
        if(adc[k] <= 0 ){end = k; break;}
    }
    if(end < 0) {end = m_length;}
*/
    double npe = -1.0;
    for(int m=/*start*/0; m<m_length-1; m++){
        npe +=  (adc[m]+adc[m+1])/2  ;
    }
//    if(npe/spe < 2) cout << start << " --- " << end << endl;
    return npe/spe;

}


/**********************************************************/

// fixed threshold for first hit time reconstruction
double TimeRec::getFHT_fixed(JM::ElecFeeChannel& channel, double baseline, double threshold){

    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0 ) return -1;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }

    int pass_time = -1;
    
    for(int i=0; i<m_length-1;i++){
        if( adc[i]<=threshold && adc[i+1]>=threshold ){
            pass_time = tdc[i]; break;
        }
    }
    
    return pass_time;
}

/**********************************************************/

// 2-points linear fitting leading egde

double TimeRec::getFHT_fitting1(JM::ElecFeeChannel& channel, double baseline, double threshold){

    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }

    int pass_time = -1;
    for(int i=0; i<m_length;i++){
        if( adc[i-1]<=threshold && adc[i]>=threshold ){
            pass_time = tdc[i]; break;
        }
    }
    if(pass_time < 0) return pass_time;  // no-passing threshold, return

    double max = -1;
    int peak_time = 0;
    for(int i=pass_time; i<m_length; i++){   
        bool firstpeak = true;
        if(pass_time > 10){
            for(int k=0;k<21;k++){
                if(adc[i] < adc[i-10+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i]; peak_time = tdc[i]; break;}  // only searching first hit peak
        
            }

        else{
            for(int k=0;k<pass_time*2+1;k++){
                if(adc[i]<adc[i-pass_time+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i];peak_time = tdc[i];  break;}  // only searching first hit peak
    
        }
    }
    if(max <= 0) return pass_time;  // negative peak value, return
    else{
        double threshold1 = 0.2*max;
        double threshold2 = 0.9*max;
        int t1=0; int t2=0;
    
        for(int j=1; j<peak_time; j++){
            if(adc[peak_time-j] <= threshold2 && adc[peak_time-j+1] > threshold2){
                t2 = tdc[peak_time-j]; break;
            }
        }               

        for(int m=1; m<peak_time;m++){   
            if(adc[peak_time-m] <= threshold1 && adc[peak_time-m+1]>threshold1){
                t1 = tdc[peak_time-m]; break;
            }
        }

        return ( (threshold1*t2 - threshold2*t1) / (threshold1 - threshold2) );

    }

}









#endif
