////////////////////////////////
/*
Package for PMT time offset extraction, it reads trigger type to only use LED calibration data. A simple waveform integral algorithm is used as input of time-amplitude corrections while timing and also as input of event-level reconstruction for event selection(charge-center).
For each run, a set of corretion parameters will be extracted and repeat the whole process until the parameters fixed. Then a set of parameters will be saved into a user-root-file.
Final comparing and combination of all runs will be implemented on a independent C++ script in share folder.
Author: miaoyu@lxslc6.ihep.ac.cn
Sep, 2019
 */
////////////////////////////////

#ifndef TimeCorrAlg_cc
#define TimeCorrAlg_cc
#include "TimeCorrAlg.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperDataPtr.h"
#include "BufferMemMgr/IDataMemMgr.h"
#include "EvtNavigator/NavBuffer.h"
#include "DataRegistritionSvc/DataRegistritionSvc.h"
#include "Event/ElecHeader.h"
#include "Geometry/RecGeomSvc.h"
#include "Identifier/Identifier.h"
#include "Identifier/CdID.h"
#include "RootWriter/RootWriter.h"
#include "TROOT.h"
#include <TFile.h>
#include <TTree.h>
#include <vector>
#include "TMath.h"
#include "TGraph.h"
#include "TF1.h"
#include "Context/TimeStamp.h"
#include "PMTCalibSvc/PMTCalibSvc.h"

using namespace std;

DECLARE_ALGORITHM(TimeCorrAlg);

TimeCorrAlg::TimeCorrAlg(const string& name) : AlgBase(name)
            , m_totalPMT(17746)
            , m_length(1250)
            , Ball_R(19.316)
            , PMT_R(19.5)
            , ChaCenRec_ratio(1.2)
            //, option("cfd")                      
{
    declProp("TotalPMT", m_totalPMT);
    declProp("Length", m_length);
    declProp("Ball_R", Ball_R);
    declProp("PMT_R", PMT_R);
    declProp("option", option);
    peak_time = -1;
    m_evt = 0;
}




TimeCorrAlg::~TimeCorrAlg(){}



bool TimeCorrAlg::initialize(){
    
    LogInfo << "initialized successfully ! " << std::endl;

    // event navigator
    SniperDataPtr<JM::NavBuffer> navBuf(getParent(), "/Event");
    if( navBuf.invalid()) {
        LogError << "cannot get the NavBuffer @ /Event " << std::endl;
        return false;
    }
    m_buf = navBuf.data();


    // user data definitions
    SniperPtr<RootWriter> m_rw(*getParent(), "RootWriter");
    if( ! m_rw.valid() ) {
        LogError << "Failed to get RootWriter instance!" 
                 << "If you want to use it, pelase enable it in your job option file. "
                 << std::endl;
        return false;   
    }

    if(m_totalPMT > 20000){
        LogError << "Only CD 20inch PMT could be processed. " << endl;
        return false;
    }

    // user defined histograms

    for(int i=0;i<20000;i++){
        TString chName1=Form("ch%d_deltaT",i);
        //TString chName2=Form("ch%d_waveform",i);
        //Q2deltaT[i]=new TProfile(chName1,chName1,100,0,20,0,1500);
        //m_rw->attach("RECEVT", Q2deltaT[i]);
        deltaT[i] = new TH1D(chName1,chName1,BIN_NUM, MIN_BIN, MAX_BIN/*200,-500,500-200,800*/);
        m_rw->attach("RECEVT",deltaT[i]);
    }
/*

    for(int i=0;i<10;i++){
        TString profName=Form("prof_Q%d",i);
        prof_Q[i] = new TProfile( profName, profName,100,0,5,-200,1250);
        m_rw->attach("RECEVT", prof_Q[i]);
    }
*/
    prof2 = new TProfile("prof2","Profile of recT vs amp",100,0,10,-200,1000);
//    firstPeak = new TH1I("firstPeak","fisrt peak position",100,0,1250);
//    firstPass = new TH1I("firstPass", "first pass position", 100,0,1250);
//    thre = new TH1D("threshold", "threshold for each channel",100,0,30);
    waveform = new TH2D("wf","waveform",100,0,1250,1000,0,8000);
    recTime = new TH1D("rectime","rectimr",125,0,1250);
    charge_FH = new TH1D("charge_FH","charge_FH",100,0,10);
    average_time = new TH1D("averageTime","averageTime",200,0,1000);
    deltaT_all = new TH1D("deltaT_all","deltaT_all",200,-200,200);
    rec_time = new TProfile("rec_time","rec_Time v.s. rec_charge",200,0,10);
    ref_delta1 = new TH1D("ref_delta1","average time 2 evt time",100,130,230);
    ref_delta2 = new TH1D("ref_delta2","trigger time 2 evt time",100,0,100);

    m_rw->attach("RECEVT",prof2);    
//    m_rw->attach("RECEVT",firstPeak);
//    m_rw->attach("RECEVT",firstPass);
//    m_rw->attach("RECEVT",thre);
    m_rw->attach("RECEVT",waveform);
    m_rw->attach("RECEVT",recTime);
    m_rw->attach("RECEVT",charge_FH);
    m_rw->attach("RECEVT",average_time);
    m_rw->attach("RECEVT",deltaT_all);
    m_rw->attach("RECEVT",rec_time);
    m_rw->attach("RECEVT",ref_delta1);
    m_rw->attach("RECEVT",ref_delta2);

    h2=new TH2D("h2","h2",100,0,10,200,-200,1000);
    m_rw->attach("RECEVT",h2);

    for(int i=0;i<m_totalPMT;i++) { m_time[i] = 0; m_count[i] = 0; }

    m_corr = m_rw->bookTree("RECEVT/TIMEREC", "time offset for each channel");
//    m_corr -> Branch("PMTID", &m_pmtId);
    m_corr -> Branch("TimeOffset", m_time, "TimeOffset[20000]/D");
    m_corr -> Branch("nPE",m_nPE, "nPE[20000]/D");
    m_corr -> Branch("nPEforFH",m_nPEforFH, "nPEforFH[20000]/D");

    // reconstruct pmtcalib svc
    SniperPtr<PMTCalibSvc> calSvc(getParent(), "PMTCalibSvc");
    if(calSvc.invalid()) {
        LogError <<  "Failed to get PMTCalibSvc instance!" << std::endl;
        return false;
    }


    // reconstruction geometry service
    SniperPtr<RecGeomSvc> rgSvc(getParent(), "RecGeomSvc");
    if ( rgSvc.invalid()) {
        LogError << "Failed to get RecGeomSvc instance!" << std::endl;
        return false;
    }
    m_cdGeom = rgSvc->getCdGeom(); 


    // Get the geometry service for all PMT;
    // num_PMT = m_cdGeom->findPmtNum();
    num_PMT = m_cdGeom->findPmt20inchNum(); 
    if(num_PMT == m_totalPMT) LogInfo << "Total PMT:" << num_PMT << std::endl;
    else
        LogError << "pmt number initialization is wrong! " << std::endl;
    for(int i=0;i<num_PMT; i++){
        unsigned int all_pmt_id = (unsigned int) i;
        Identifier all_id = Identifier(CdID::id(all_pmt_id,0));
        PmtGeom *all_pmt = m_cdGeom->getPmt(all_id);
        if( !all_pmt ){
            LogError << "Wrong Pmt Id " << i <<std::endl;
        }
        TVector3 all_pmtCenter = all_pmt->getCenter();
        ALL_PMT_pos.push_back(Ball_R/PMT_R*all_pmtCenter);

    }



    return true;
}

bool TimeCorrAlg::execute(){

    LogDebug << "start PMT time offset extraction" << endl;
    tOffset.clear();
    
    JM::EvtNavigator* nav = m_buf->curEvt();
    if(!nav){
        LogWarn << "can't load event navigator. " << std::endl;
        return getRoot()->stop();
    
    }

    std::vector<double> ttime;
    std::vector<double> nnpe;
    std::vector<double> nnpeFH;
    std::vector<int> pmtid;

    JM::ElecHeader* eh = dynamic_cast<JM::ElecHeader*>(nav->getHeader("/Event/Elec"));
    if( !eh->hasEvent() ) return true;
    JM::ElecEvent *ee = dynamic_cast<JM::ElecEvent*>(eh->event());
    const JM::ElecFeeCrate& efc = ee->elecFeeCrate();
    //if(!efc) return true;
    m_crate = const_cast<JM::ElecFeeCrate*>(&efc);

    TimeStamp evtTime     = m_crate->EvtTimeStamp();
    TimeStamp triggerTime = m_crate->TriggerTime();
    ref_delta2->Fill(triggerTime.GetNanoSec() - evtTime.GetNanoSec());
    //TriggerTime = m_crate->TriggerTime();
//    LogInfo << "TriggerTime(ns): " << TriggerTime.GetSeconds()*1e9 << endl;

    map<int,JM::ElecFeeChannel> feeChannels = m_crate->channelData();
    map<int,JM::ElecFeeChannel>::iterator it;
    for(it=feeChannels.begin();it!=feeChannels.end();++it){
        JM::ElecFeeChannel& channel = (it->second);
        if(channel.adc().size() == 0){
            continue;
        }
        
        int pmtID = it->first;

        double baseline =0;
        for(int i=0;i<50;i++) baseline+=(channel.adc())[i]; 
        baseline /= 50.;  
        double baseline_sigma = 0;
        for(int k=0;k<50;k++) baseline_sigma += (((channel.adc())[k] -baseline) * ((channel.adc())[k]-baseline)); 
        baseline_sigma /= 49.;    
        baseline_sigma = TMath::Sqrt(baseline_sigma);
        threshold = 0;
        threshold = baseline + 5*baseline_sigma;   

        double nPE = getNPE(channel, baseline);
        double firstHitTime = 0;
        double nPE_FH = getNPE_FH(channel, threshold, baseline);
        // timing alg option
        if(option == "single_threshold"){
        firstHitTime = getFHT(channel,threshold);}

        if(option == "cfd"){
        firstHitTime = getFHT_CFD(channel,threshold, baseline);}

        if(option == "cfd_linear"){
        firstHitTime = getFHT_CFD_Linear(channel,threshold, baseline); }

        if(option == "cfd_linear2"){
        firstHitTime =getFHT_CFD_Linear2(channel, threshold, baseline); }

        if(option == "peak_fitting"){
        firstHitTime = getFHT_peakFitting(channel, threshold, baseline); }
        
        if(firstHitTime == 10000) continue;  // only save pass-threshold channels


//        m_count[pmtID] += 1;
//        m_time[pmtID] += firstHitTime;
        m_nPE[pmtID] = nPE;
        

        ttime.push_back(firstHitTime);
        nnpe.push_back(nPE);
        nnpeFH.push_back(nPE_FH);
        pmtid.push_back(pmtID);
        //Q2deltaT[pmtID] -> Fill(nPE,firstHitTime);
        //h2->Fill(nPE, firstHitTime);
        //prof1 -> Fill(nPE,firstHitTime);
        //prof2 -> Fill(nPE,firstHitTime);
        //Q2deltaT[pmtID] -> Fill(nPE,firstHitTime);
        //recTime->Fill(firstHitTime);
        //if(pmtID == 9999){  
        //for(int mm=0; mm<channel.adc().size();mm++){
        //waveform ->Fill( (channel.tdc())[mm], (channel.adc())[mm] );}//}
     
       //if(nPE_FH > 0.) {charge_FH->Fill(nPE_FH);}  // only record passed-threshold channel  
    }

//    TimeCorrAlg::ChargeCenterRec();
//    ChaCenRec_x *= ChaCenRec_ratio;
//    ChaCenRec_y *= ChaCenRec_ratio;
//    ChaCenRec_z *= ChaCenRec_ratio;

//    std::cout<<"ChaCenRec:("<<ChaCenRec_x<<","<<ChaCenRec_y<<","<<ChaCenRec_z<<")"<<std::endl;
//    if( TMath::Sqrt(ChaCenRec_x*ChaCenRec_x + ChaCenRec_y*ChaCenRec_y + ChaCenRec_z*ChaCenRec_z) > 2000.)  
//    {LogInfo << "Out of range, discard! " << endl; return true; }  // set 2.m cut for event selection


//    else{

// select mean of first 500~1000 hit time as reference time
    double ref_time;
/*
if(ttime.size() >= 1000){
    std::vector<double> ttime_copy;
    for(int i=0;i<ttime.size();i++){ ttime_copy.push_back(ttime[i]);  }
    double mean_of_first1000 = 0.;
    for(int k=0;k<ttime_copy.size();k++){
        for(int l=0; l<ttime_copy.size()-k-1;l++){
            double tmp1, tmp2;
            if(ttime_copy[l]>ttime_copy[l+1]){ tmp1 = ttime_copy[l];  ttime_copy[l] = ttime_copy[l+1]; ttime_copy[l+1]=tmp1; 
                tmp2 = nnpeFH[l]; nnpeFH[l] = nnpeFH[l+1]; nnpeFH[l+1]=tmp2;}

        }
    }
    for(int i=0;i<1000;i++){
        mean_of_first1000 += ttime_copy[i];
        rec_time -> Fill(nnpeFH[i], ttime_copy[i]);
    }
    ref_time = mean_of_first1000 / 1000.;
} 
else{*/

// calculate mean hit time for all pmt as ref time
    double mean_of_all = 0.;
    for(int k=0; k<ttime.size();k++){
        mean_of_all += ttime[k];
    }
        mean_of_all /= ttime.size();
        ref_time = mean_of_all;
//}

//        ref_time = 100 - ( triggerTime.GetNanoSec() - evtTime.GetNanoSec() );
//    cout << "refT:" << ref_time << endl;
        ref_delta1->Fill(ref_time+triggerTime.GetNanoSec()-100 - evtTime.GetNanoSec());
        average_time->Fill(ref_time);
//        cout << "mean of all: " << mean_of_all << "for " << ttime.size() << " pmt "<< endl;
    for(int k=0/*500*/; k<ttime.size();k++){
        //ttime[k] = ttime[k] + triggerTime.GetNanoSec()-100;  // absolute time stamp
        ttime[k] -= ref_time ; 
        int tmpid = pmtid[k];
        deltaT[tmpid]->Fill( ttime[k]);
        deltaT_all->Fill(ttime[k]);
        //h2->Fill(nnpe[k],ttime[k]);
//        prof1 -> Fill(nnpe[k],ttime[k]);
        //prof2 -> Fill(nnpe[k],ttime[k]);
/*        
        for(int kk=0; kk<10; kk++){
            if( nnpeFH[k]>kk*0.2 && nnpeFH[k] < ((kk+1)*0.2)  ){ prof_Q[kk]->Fill(nnpe[k],ttime[k]); break; }
        }    
*/    
    }
        //firstPeak->Fill(peak_time);
        //firstPass->Fill(pass_time);
        //thre->Fill(threshold-baseline);
    
            
    m_corr -> Fill();
//    for(int i=0;i<10;i++){
//        prof_Q[i] -> BuildOptions(-200,1250,"s");
//    }
    
    LogInfo << m_evt << "th" << " Good event! ===>  Done to read PMT waveforms " << std::endl;
    m_evt++;

    return true;
//    }
}

bool TimeCorrAlg::finalize(){
/*
    double tt=0.,  pe=0.;
    for(int i=0; i<m_totalPMT; i++){
        if(m_count[i] != 0)  { m_time[i] /= m_count[i]; m_nPE[i] /= m_count[i];}
        tt+=m_time[i]; 
//        std::cout << "pmtId: " << i << " time offset: " << m_time[i] << std::endl;
    }
    for(int j=0;j<m_totalPMT;j++){
        m_time[j] -= tt / m_totalPMT;    // ensure there are enough events , choose average time for all pmts as reference time.
    
    }

    m_corr -> Fill();
*/

    // single channel fitting
    for(int i=0; i<20000; i++){
        cout << "Processing channel " << i << endl;
        Int_t peak_pos = deltaT[i]->GetMaximumBin();
        double min_fit = (peak_pos - 5) *(MAX_BIN - MIN_BIN)/BIN_NUM + MIN_BIN;
        double max_fit = (peak_pos + 2) *(MAX_BIN - MIN_BIN)/BIN_NUM + MIN_BIN;
        TF1* fit_func = new TF1("gauss_fit", "[0]*TMath::Exp( -(x-[1])*(x-[1])/2/[2]/[2] )", min_fit, max_fit);    // new ref time(evt start time)
        fit_func -> SetParameter(0,deltaT[i]->GetMaximum());
        fit_func -> SetParameter(1,peak_pos*(MAX_BIN-MIN_BIN)/BIN_NUM+MIN_BIN);
        fit_func -> SetParameter(2,10);
        
        deltaT[i] -> Fit(fit_func, "RQ");
    }


    return true;
}



// simple integral charge w/o gain corrections
double TimeCorrAlg::getNPE(JM::ElecFeeChannel& channel, double baseline){
    
    double LSB = 1065.;

    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }

    double temp = 0.0;
    for(int i=0;i<m_length-1;i++){
        temp += (adc[i]+adc[i+1])/2;
    }
    return temp/LSB;
/*    
    double temp = 0.0;
    std::vector<unsigned int> ::iterator it;
    for(it=adc.begin();it!=adc.end()-1;it++){
        if((*it-baseline)>0) temp += ((*it+*(it+1))/2 - baseline);
    }
    return temp/1000;
*/
}
/***********************************************************/

// charge integral for first hit
double TimeCorrAlg::getNPE_FH(JM::ElecFeeChannel& channel, double threshold, double baseline){

    //double LSB = 0.06*5.6e-3;
    //double LSB = 260.;
    double LSB = 1065;

    std::vector<unsigned int>& adc = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc.size() == 0) return 0;

    int pass_time = -1;
    for(int i=0; i<adc.size(); ++i){
        if(adc[i] > threshold) {pass_time = tdc[i]; break; } 
    }

    int start= -1;
    int end= -1;
    for(int k=0; k<pass_time; k++){
        if( adc[pass_time-k] <= baseline ) {start = k; break;}
    }
    if(start < 0){ start = 0;}

    for(int k=pass_time; k<adc.size(); k++){
        if(adc[k] <= baseline ){end = k; break;}
    }

    if(end < 0) {end = adc.size();}
    
    double npe = -1.0;
    for(int m=start; m<end-1; m++){
        npe += ( (adc[m]+adc[m+1])/2-baseline ) ;
    }
    if(npe <= 0) return -1.0;
    return npe/LSB;
}

/*************************************************************/

// single fixed threshold timing w/o corrections
double TimeCorrAlg::getFHT(JM::ElecFeeChannel& channel, double threshold){
    std::vector<unsigned int>& adc = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc.size() == 0) return 0;
    
    int pass_time = -1;
    for(int i=0; i<adc.size(); ++i){
        if(adc[i] > threshold) {pass_time = tdc[i]; break; } 
    }

    if(pass_time < 0){return 10000.;}
    return pass_time;
}
/***********************************************************/



// constant fraction disctrimination, 2-points parabola fitting

double TimeCorrAlg::getFHT_CFD(JM::ElecFeeChannel& channel, double threshold, double baseline){
    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }
    
    threshold -= baseline;
    int pass_time = -1;
    for(int i=0; i<m_length; i++){
        if(adc[i] > threshold) { pass_time = tdc[i]; break;}   // pass-treshold point
    }
    if( pass_time< 0 ) return 10000;

    double max = -1; //int peak_time = -1;
    for(int i=pass_time; i<m_length; i++){   
        bool firstpeak = true;
        if(pass_time > 10){
            for(int k=0;k<21;k++){
                if(adc[i] < adc[i-10+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i]; peak_time = tdc[i];  break;}  // only searching first hit peak
        
            }

        else{
            for(int k=0;k<pass_time*2+1;k++){
                if(adc[i]<adc[i-pass_time+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i]; peak_time = tdc[i];  break;}  // only searching first hit peak
    
        }
    }
    if(max <= 0 ) return 10000;
    else{
        double threshold1 = 0.4*max;   
        double threshold2 = 0.9*max;   
        int t1=-1; int t2=-1;
//        for(int j=1; j<m_length; j++){
//            if(adc[j-1] < threshold1 && adc[j] > threshold1){
//                t1 = tdc[j]; break;
//            }
//        }               
    
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


        //if( (sqrt(threshold2)*t1 - sqrt(threshold1)*t2) / (sqrt(threshold2)-sqrt(threshold1))<100) cout<< "abnormal t1 " << threshold1 << " " << threshold2 << " " <<t1 << " " << t2 << " " << max << " " << peak_time<<  endl; 
        //cout << (sqrt(threshold2)*t1 - sqrt(threshold1)*t2) / (sqrt(threshold2)-sqrt(threshold1)) << endl;  //parabola fitting
        return (sqrt(threshold2)*t1 - sqrt(threshold1)*t2) / (sqrt(threshold2)-sqrt(threshold1));  //parabola fitting
        //return 0;
    }
}

/***************************************************************/

// constant fraction discriminator, linear fitting

double TimeCorrAlg::getFHT_CFD_Linear(JM::ElecFeeChannel& channel, double threshold, double baseline){
    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }
    
    threshold -= baseline;
//    threshold = 7;
    int pass_time = -1;
    for(int i=0; i<m_length; i++){
        if(adc[i] > threshold) {pass_time = tdc[i]; break;}   // pass-treshold point
    }
    if( pass_time < 0 ) return 10000;

    double max = -1;
    //int peak_time = -1;
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
    if(max <= 0 ) return 10000;
    else{
        double threshold1 = 0.2*max;   
        double threshold2 = 0.9*max;   
        int t1=0; int t2=0;
//        for(int j=1; j<m_length; j++){
//            if(adc[j-1] < threshold1 && adc[j] > threshold1){
//                t1 = tdc[j]; break;
//            }
//        }               
    
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


/*******************************************************************/


// constant fraction discriminator, linear fitting, continuous points

double TimeCorrAlg::getFHT_CFD_Linear2(JM::ElecFeeChannel& channel, double threshold, double baseline){
    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }
    
    threshold -= baseline;
//    threshold = 7;
    int pass_time = -1;
    for(int i=0; i<m_length; i++){
        if(adc[i] > threshold) {pass_time = tdc[i]; break;}   // pass-treshold point
    }
    if( pass_time < 0 ) return 10000;

    double max = -1;
    //int peak_time = -1;
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
    if(max <= 0 ) return 10000;
    else{
        double threshold1 = 0.4*max;   
        double threshold2 = 0.9*max;   
        int t1=0; int t2=0;
//        for(int j=1; j<m_length; j++){
//            if(adc[j-1] < threshold1 && adc[j] > threshold1){
//                t1 = tdc[j]; break;
//            }
//        }               
    
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
        
    // all points between two thresholds
        TGraph *g1 = new TGraph();
        int count = 0;  
        for(int n=t1; n<t2+1;n++){  
            g1->SetPoint(count, tdc[n], adc[n]);count++;}
        TF1* f1 = new TF1("f1","[0]+[1]*x",t1,t2);
        g1->Fit(f1,"RQ");

        double t0 = - f1->GetParameter(0)/f1->GetParameter(1);
        delete g1;
        delete f1;

        //cout << "estimate t0: " << t0 << endl;
        //return ( (threshold1*t2 - threshold2*t1) / (threshold1 - threshold2) );
        return t0;
    }

}


/*******************************************************************/

// peaking fitting alg
double TimeCorrAlg::getFHT_peakFitting(JM::ElecFeeChannel& channel, double threshold, double baseline){
    std::vector<unsigned int>& adc_origin = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc_origin.size() == 0) return 0;

    const int m_length = adc_origin.size();
    double adc[m_length];
    for(int i=0;i<m_length;i++){
        adc[i] = adc_origin[i];  
        adc[i] -= baseline; 
    }
    
    threshold -= baseline;

    int pass_time = -1;
    for(int i=0; i<m_length; i++){
        if(adc[i] > threshold) {pass_time = tdc[i]; break;}   // pass-threshold point
    }
    if( pass_time < 0 ) return 10000;
    
    double max = -1;
    //int peak_time = -1;
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

    // fitting peak position by 3 points
    double x1, x2, x3, y1, y2, y3; 
    x1 = tdc[peak_time -1]; x2 = peak_time; x3 = tdc[peak_time +1];
    y1 = adc[peak_time -1]; y2 = max; y3 = adc[peak_time +1];
    double a, b;  // parameters in parabolas
    a = ( (y2-y1)*(x3-x1) - (y3-y1)*(x2-x1) ) / ( (x2*x2 - x1*x1)*(x3-x1) - (x3*x3 -x1*x1)*(x2-x1) );
    b = ( (y2-y1)*(x3*x3-x1*x1) - (y3-y1)*(x2*x2-x1*x1) ) / ( (x2-x1)*(x3*x3-x1*x1) - (x3-x1)*(x2*x2-x1*x1) );
    return -b/2/a;

}


/*******************************************************************/


// Charge Center Vertex Reconstruction
bool TimeCorrAlg::ChargeCenterRec()
{
   double x_sum = 0;
   double y_sum = 0;
   double z_sum = 0; 
   double PE_sum = 0;
    
   for(int i = 0; i< num_PMT; i++){  
     x_sum = x_sum + ALL_PMT_pos.at(i).X()*m_nPE[i];
     y_sum = y_sum + ALL_PMT_pos.at(i).Y()*m_nPE[i];
     z_sum = z_sum + ALL_PMT_pos.at(i).Z()*m_nPE[i];
     PE_sum += m_nPE[i];  
   }

   if(PE_sum == 0) {
    ChaCenRec_x = 0; ChaCenRec_y = 0; ChaCenRec_z = 0;
   }
    else{
    ChaCenRec_x = x_sum/PE_sum;  
    ChaCenRec_y = y_sum/PE_sum;
    ChaCenRec_z = z_sum/PE_sum;
   }
   return true;
}

/**********************************************************/


#endif
