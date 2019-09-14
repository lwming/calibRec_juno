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

using namespace std;

DECLARE_ALGORITHM(TimeCorrAlg);

TimeCorrAlg::TimeCorrAlg(const string& name) : AlgBase(name)
            , m_totalPMT(17739)
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

    if(m_totalPMT > 17739){
        LogError << "Only CD 20inch PMT could be processed. " << endl;
        return false;
    }

    // user defined histograms
/*
    for(int i=0;i<m_totalPMT;i++){
        TString chName=Form("ch%d_Q2deltaT",i);
        Q2deltaT[i]=new TH2D(chName,chName,50,0,3000,100,0,2000);
        m_rw->attach("RECEVT", Q2deltaT[i]);
    }
*/

    if(option == "single_threshold"){
    Q2deltaT=new TH2D("Q2deltaT","Q2deltaT",300,0,10,1000,0,1250);}
    if(option == "cfd"){
    Q2deltaT=new TH2D("Q2deltaT","Q2deltaT",300,0,10,1000,-2000,1500);}
    m_rw->attach("RECEVT",Q2deltaT);

    for(int i=0;i<m_totalPMT;i++) { m_time[i] = 0; m_count[i] = 0; }

    m_corr = m_rw->bookTree("RECEVT/TIMEREC", "time offset for each channel");
//    m_corr -> Branch("PMTID", &m_pmtId);
    m_corr -> Branch("TimeOffset", m_time, "TimeOffset[17739]/D");
    m_corr -> Branch("nPE",m_nPE, "nPE[17739]/D");

    // reconstruction geometry service
    SniperPtr<RecGeomSvc> rgSvc(getParent(), "RecGeomSvc");
    if ( rgSvc.invalid()) {
        LogError << "Failed to get RecGeomSvc instance!" << std::endl;
        return false;
    }
    m_cdGeom = rgSvc->getCdGeom(); 


    // Get the geometry service for all PMT;
    // Total_num_PMT = m_cdGeom->findPmtNum();
    int Total_num_PMT = m_cdGeom->findPmt20inchNum();
    if(Total_num_PMT == m_totalPMT) LogInfo << "Total PMT:" << Total_num_PMT << std::endl;
    else
        LogError << "pmt number initialization is wrong! " << std::endl;
    for(int i=0;i<Total_num_PMT; i++){
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

    JM::ElecHeader* eh = dynamic_cast<JM::ElecHeader*>(nav->getHeader("/Event/Elec"));
    JM::ElecEvent *ee = dynamic_cast<JM::ElecEvent*>(eh->event());
    const JM::ElecFeeCrate& efc = ee->elecFeeCrate();
    m_crate = const_cast<JM::ElecFeeCrate*>(&efc);
//    TriggerTime = m_crate->TriggerTime();
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
        for(int i=0;i<200;i++) baseline+=(channel.adc())[i]; 
        baseline /= 200.;  
        double baseline_sigma = 0;
        for(int k=0;k<200;k++) baseline_sigma += (((channel.adc())[k] -baseline) * ((channel.adc())[k]-baseline)); 
        baseline_sigma /= 199.;    
        double threshold = 0;
        threshold = baseline + 5*baseline_sigma;   

        double nPE = getNPE(channel, baseline);
        double firstHitTime = 0;
        // timing alg option
        if(option == "single_threshold"){
        firstHitTime = getFHT(channel,threshold);}

        if(option == "cfd"){
        firstHitTime = getFHT_CFD(channel,threshold, baseline);}
        
        if(firstHitTime == 10000) continue;
        //cout << "pmtID: " << pmtID << " firstHitTime: " << firstHitTime << endl;


        m_count[pmtID] += 1;
        m_time[pmtID] += firstHitTime;
        m_nPE[pmtID] = nPE;
        //Q2deltaT[pmtID] -> Fill(nPE,firstHitTime);
        Q2deltaT -> Fill(nPE,firstHitTime);
            
    }

    TimeCorrAlg::ChargeCenterRec();
    ChaCenRec_x *= ChaCenRec_ratio;
    ChaCenRec_y *= ChaCenRec_ratio;
    ChaCenRec_z *= ChaCenRec_ratio;

    std::cout<<"ChaCenRec:("<<ChaCenRec_x<<","<<ChaCenRec_y<<","<<ChaCenRec_z<<")"<<std::endl;
    if( TMath::Sqrt(ChaCenRec_x*ChaCenRec_x + ChaCenRec_y*ChaCenRec_y + ChaCenRec_z*ChaCenRec_z) > 1000)  
    {LogInfo << "Out of range, discard! " << endl; return true; }  // set 1.m cut for event selection


    
            
    else{
    m_corr -> Fill();
    
    LogInfo << " Good event! ===>  Done to read PMT waveforms " << std::endl;

    return true;
    }
}

bool TimeCorrAlg::finalize(){

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

    return true;
}



// simple integral charge w/o gain corrections
double TimeCorrAlg::getNPE(JM::ElecFeeChannel& channel, double baseline){
        
    std::vector<unsigned int> & adc = channel.adc();
    if(adc.size() == 0) return 0;

    double temp = 0.0;
    std::vector<unsigned int> ::iterator it;
    for(it=adc.begin();it!=adc.end()-1;it++){
        if((*it-baseline)>0) temp += ((*it+*(it+1))/2 - baseline);
    }
    return temp/1000;

}
/***********************************************************/




// simple fixed threshold timing w/o corrections
double TimeCorrAlg::getFHT(JM::ElecFeeChannel& channel, double threshold){
    std::vector<unsigned int>& adc = channel.adc();
    std::vector<unsigned int>& tdc = channel.tdc();
    if(adc.size() == 0) return 0;
    
    for(int i=0; i<adc.size(); ++i){
        if(adc[i] > threshold) return tdc[i];  
    }
    return 10000.;
}
/***********************************************************/



// constant fraction disctrimination

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
    int startpoint = -1;
    for(int i=0; i<m_length; i++){
        if(adc[i] > threshold) {startpoint = tdc[i]; break;}   // pass-treshold point
    }
    if( startpoint < 0 ) return 10000;

    double max = -1;
    for(int i=startpoint; i<m_length; i++){   
        bool firstpeak = true;
        if(startpoint > 10){
            for(int k=0;k<21;k++){
                if(adc[i] < adc[i-10+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i];  break;}  // only searching first hit peak
        
            }

        else{
            for(int k=0;k<startpoint*2+1;k++){
                if(adc[i]<adc[i-startpoint+k]) firstpeak=false;
            }
            if(firstpeak) {max = adc[i];  break;}  // only searching first hit peak
    
        }
    }
    if(max <= 0 ) return 10000;
    else{
        double threshold1 = 0.4*max;   
        double threshold2 = 0.9*max;   
        double t1=0; double t2=0;
        for(int j=1; j<m_length; j++){
            if(adc[j-1] < threshold1 && adc[j] > threshold1){
                t1 = tdc[j]; break;
            }
        }               
    
        for(int j=1; j<m_length; j++){
            if(adc[j-1] < threshold2 && adc[j] > threshold2){
                t2 = tdc[j]; break;
            }
        }               
        //cout << t1 << " " << t2 << endl; 
        //cout << (sqrt(threshold2)*t1 - sqrt(threshold1)*t2) / (sqrt(threshold2)-sqrt(threshold1)) << endl;  //parabola fitting
        return (sqrt(threshold2)*t1 - sqrt(threshold1)*t2) / (sqrt(threshold2)-sqrt(threshold1));  //parabola fitting
        //return 0;
    }
}








// Charge Center Vertex Reconstruction
bool TimeCorrAlg::ChargeCenterRec()
{
   double x_sum = 0;
   double y_sum = 0;
   double z_sum = 0; 
   double PE_sum = 0;
    
   for(int i = 0; i< m_totalPMT; i++){  
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
