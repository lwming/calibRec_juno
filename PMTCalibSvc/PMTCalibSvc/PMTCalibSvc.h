#ifndef PMTCALIBSVC_H
#define PMTCALIBSVC_H

#include "SniperKernel/SvcBase.h"

class TH1D;
class TFile;

class PMTCalibSvc:public SvcBase{
    public:
        PMTCalibSvc(const std::string& name);
        ~PMTCalibSvc();

        bool initialize();
        bool finalize();

        //get function
        /*
        std::map<unsigned int,double>& getRelativeDE();
        std::map<unsigned int,double>& getGain();
        std::map<unsigned int,double>& getTimeOffset();
        std::map<unsigned int,double>& getDarkRate();
        TH1D* getChargeSpec(unsigned int id);
        */
        std::vector<double>& getRelativeDE();
        std::vector<double>& getGain();
        std::vector<double>& getTimeOffset();
        std::vector<double>& getDarkRate();
        std::vector<TH1D*>&  getChargeSpec();




        //set function
        bool setRelativeDE(unsigned int id,double relativede);
        bool setGain(unsigned int id,double gain);
        bool setTimeOffset(unsigned int id,double offset);
        bool setDarkRate(unsigned int id,double darkrate);
        //bool setChargeSpec(unsigned int id);//get first
    private:
        std::string hx_DirPath;

        /*
        std::map<unsigned int,double> hx_RelativeDEMap;
        std::map<unsigned int,double> hx_GainMap;
        std::map<unsigned int,double> hx_TimeOffsetMap;
        std::map<unsigned int,double> hx_DarkRateMap;
        */
        std::vector<double> hx_RelativeDEV;
        std::vector<double> hx_GainV;
        std::vector<double> hx_TimeOffsetV;
        std::vector<double> hx_DarkRateV;
        std::vector<TH1D*>  hx_ChargeSpecV;


        
        TFile* hx_file;
        //TH1D* hx_ChargeSpec;

        unsigned int hx_id;
        double hx_RelativeDE;
        double hx_Gain;
        double hx_TimeOffset;
        double hx_DarkRate;

        //self defined function
        void ReadTxt();
        void ReadRoot();
        void WriteTxt();
};
#endif
