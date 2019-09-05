#include "PMTCalibSvc/PMTCalibSvc.h"
#include "SniperKernel/SvcFactory.h"
#include "TH1.h"
#include "TFile.h"
#include <boost/filesystem.hpp>

#include <fstream>

DECLARE_SERVICE(PMTCalibSvc);

PMTCalibSvc::PMTCalibSvc(const std::string& name):SvcBase(name){
    hx_DirPath="/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc/share";
    hx_file=NULL;
    declProp("DirPath",hx_DirPath);
}

PMTCalibSvc::~PMTCalibSvc(){
    if (hx_file!=NULL) hx_file->Close();
}

bool PMTCalibSvc::initialize(){
    LogDebug<<"PMTCalibSvc is initializing!"<<std::endl;

    return true;
}

bool PMTCalibSvc::finalize(){
    LogDebug<<"PMTCalibSvc is finalizing!"<<std::endl;
    LogDebug<<"DE size is:"<<hx_RelativeDEV.size()<<std::endl;
    if (hx_RelativeDEV.size()!=0) {WriteTxt();}
    return true;
}

/*
void PMTCalibSvc::ReadTxt(){
    if (hx_RelativeDEMap.size()!=0) return;
    std::ifstream myinstream;
    myinstream.open((hx_DirPath+"/PmtPrtData.txt").c_str(),std::ifstream::in);
    if (myinstream.is_open()){
        std::string temps;
        for (int i=0;i<5;i++) myinstream>>temps;
        while (myinstream>>hx_id){
            myinstream>>hx_RelativeDE;
            myinstream>>hx_Gain;
            myinstream>>hx_TimeOffset;
            myinstream>>hx_DarkRate;
            hx_RelativeDEMap[hx_id]=hx_RelativeDE;
            hx_GainMap[hx_id]=hx_Gain;
            hx_TimeOffsetMap[hx_id]=hx_TimeOffset;
              hx_DarkRateMap[hx_id]=hx_DarkRate;
        }
        myinstream.close();
    }
    else LogError<<"read file fail!"<<std::endl;
}
*/
void PMTCalibSvc::ReadTxt(){
    if (hx_RelativeDEV.size()!=0) return;
    std::ifstream myinstream;
    myinstream.open((hx_DirPath+"/PmtPrtData.txt").c_str(),std::ifstream::in);
    if (myinstream.is_open()){
        std::string temps;
        for (int i=0;i<5;i++) myinstream>>temps;
        while (myinstream>>hx_id){
            myinstream>>hx_RelativeDE;
            myinstream>>hx_Gain;
            myinstream>>hx_TimeOffset;
            myinstream>>hx_DarkRate;
            hx_RelativeDEV.push_back(hx_RelativeDE);
            hx_GainV.push_back(hx_Gain);
            hx_TimeOffsetV.push_back(hx_TimeOffset);
            hx_DarkRateV.push_back(hx_DarkRate);
        }
        myinstream.close();
    }
    else LogError<<"read file fail!"<<std::endl;
}




/*
void PMTCalibSvc::WriteTxt(){
    LogDebug<<"writing text..."<<std::endl;
    std::ofstream myoutstream;
    myoutstream.open((hx_DirPath+"/PmtPrtData2.txt").c_str(),std::ofstream::out);
    std::map<unsigned int,double>::iterator it1=hx_RelativeDEMap.begin();
    std::map<unsigned int,double>::iterator it2=hx_GainMap.begin();
    std::map<unsigned int,double>::iterator it3=hx_TimeOffsetMap.begin();
    std::map<unsigned int,double>::iterator it4=hx_DarkRateMap.begin();

    for (;it1!=hx_RelativeDEMap.end();){
        myoutstream<<it1->first<<"    \t"<<it1->second<<"    \t"<<it2->second<<"    \t"<<it3->second<<"    \t"<<it4->second<<"    \t"<<std::endl;
        it1++;it2++;it3++;it4++;
    }
    myoutstream.close();
}
*/
void PMTCalibSvc::WriteTxt(){
    LogDebug<<"writing text..."<<std::endl;
    std::ofstream myoutstream;
    myoutstream.open((hx_DirPath+"/PmtPrtData2.txt").c_str(),std::ofstream::out);
    int vsize=hx_RelativeDEV.size();
    for (int i=0;i<vsize;i++){
        myoutstream<<i<<"    \t"<<hx_RelativeDEV.at(i)<<"    \t"<<hx_GainV.at(i)<<"    \t"<<hx_TimeOffsetV.at(i)<<"    \t"<<hx_DarkRateV.at(i)<<"    \t"<<std::endl;
    }
    myoutstream.close();
}


/*
std::map<unsigned int,double>& PMTCalibSvc::getRelativeDE(){
    ReadTxt();
    return hx_RelativeDEMap;
}

std::map<unsigned int,double>& PMTCalibSvc::getGain(){
    ReadTxt();
    return hx_GainMap;
}

std::map<unsigned int,double>& PMTCalibSvc::getTimeOffset(){
    ReadTxt();
    return hx_TimeOffsetMap;
}

std::map<unsigned int,double>& PMTCalibSvc::getDarkRate(){
    ReadTxt();
    return hx_DarkRateMap;
}
*/
std::vector<double>& PMTCalibSvc::getRelativeDE(){
    ReadTxt();
    return hx_RelativeDEV;
}

std::vector<double>& PMTCalibSvc::getGain(){
    ReadTxt();
    return hx_GainV;
}

std::vector<double>& PMTCalibSvc::getTimeOffset(){
    ReadTxt();
    return hx_TimeOffsetV;
}

std::vector<double>& PMTCalibSvc::getDarkRate(){
    ReadTxt();
    return hx_DarkRateV;
}




/*
TH1D* PMTCalibSvc::getChargeSpec(unsigned int id){
    //boost::filesystem::path s(hx_DirPath);
    //TFile* myfile=new TFile(TString((s/"output.root").string()),"READ");
    if (hx_file==NULL){
        hx_file=new TFile("/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc/share/output.root","READ");
    }
    hx_ChargeSpec=(TH1D*)hx_file->Get(Form("ch%d_charge_spec",id));
    if (hx_ChargeSpec==NULL) LogDebug<<"get hist error"<<std::endl;
    return hx_ChargeSpec;
}*/
std::vector<TH1D*>& PMTCalibSvc::getChargeSpec(){
    ReadRoot();
    return hx_ChargeSpecV;
}

void PMTCalibSvc::ReadRoot(){
    if (hx_ChargeSpecV.size()!=0) return;
    if (hx_file==NULL){
        hx_file=new TFile("/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc/share/output.root","READ");
    }
    TH1D* hx_ChargeSpec;
    for (int i=0;i<17746/*hx_ChargeSpecV.size()*/;i++){
        hx_ChargeSpec=(TH1D*)hx_file->Get(Form("ch%d_charge_spec",i));
        hx_ChargeSpecV.push_back(hx_ChargeSpec);
    }
}







/*
bool PMTCalibSvc::setRelativeDE(unsigned int id,double relativede){
    hx_RelativeDEMap[id]=relativede;
    return true;
}

bool PMTCalibSvc::setGain(unsigned int id,double gain){
    hx_GainMap[id]=gain;
    return true;
}

bool PMTCalibSvc::setTimeOffset(unsigned int id,double offset){
    hx_TimeOffsetMap[id]=offset;
    return true;
}

bool PMTCalibSvc::setDarkRate(unsigned int id,double darkrate){
    hx_DarkRateMap[id]=darkrate;
    return true;
}
*/
bool PMTCalibSvc::setRelativeDE(unsigned int id,double relativede){
    hx_RelativeDEV.at(id)=relativede;
    return true;
}

bool PMTCalibSvc::setGain(unsigned int id,double gain){
    hx_GainV.at(id)=gain;
    return true;
}

bool PMTCalibSvc::setTimeOffset(unsigned int id,double offset){
    hx_TimeOffsetV.at(id)=offset;
    return true;
}

bool PMTCalibSvc::setDarkRate(unsigned int id,double darkrate){
    hx_DarkRateV.at(id)=darkrate;
    return true;
}




/*
bool PMTCalibSvc::setChargeSpec(unsigned int id){
    hx_file->ReOpen("UPDATE");
    hx_ChargeSpec=(TH1D*)hx_file->Get(Form("ch%d_charge_spec",id));
    hx_ChargeSpec->Write("",TObject::kOverwrite);
    hx_file->ReOpen("READ");
    return true;
}
*/
