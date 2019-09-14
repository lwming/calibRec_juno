void gen(){
  gRandom->SetSeed(0);
  TH1D* th[17746];
  TH1F* darkCount=new TH1F("darkCount","darkCount",17746,0,17746);
  TH1F* totalWaveCount=new TH1F("totalWaveCount","totalWaveCount",1,0,1);
  for(int i=0;i<17746;i++){
    TString name=Form("ch%d_charge_spec",i);
    th[i]=new TH1D(name,name,1200,-2,10);
    int counter=0;
    for(int j=0;j<100000;j++){
      int inttmp=gRandom->Poisson(0.1);
      if(inttmp==0){
        double tmp=gRandom->Gaus(0,0.05);
        th[i]->Fill(tmp);
      }
      else{
        double tmp=-1.;
        while(tmp<0)tmp=gRandom->Gaus(1,0.35);
        th[i]->Fill(tmp);
      }
    }
    if((i-46)%100==0)cout<<i<<" finished!"<<endl;
  }
  for(int i=0;i<17746;i++){
    darkCount->SetBinContent(i+1,gRandom->Gaus(5000,500));
  }
  totalWaveCount->SetBinContent(1,100000);
  TFile* fout=new TFile("output.root","recreate");
  //for(int i=0;i<17;i++){
  for(int i=0;i<17746;i++){
    th[i]->Write();
  }
  darkCount->Write();
  totalWaveCount->Write();
}
