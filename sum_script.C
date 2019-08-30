void sum_script(){
  TFile* fin=new TFile("output.root","read");
  TH1D* th[17746];
  for(int i=0;i<17746;i++){
    TString name=Form("ch%d_charge_spec",i);
    th[i]=(TH1D*)fin->Get(name);
    double mean=th[i]->GetMean();
    cout<<i<<"\t"<<mean<<endl;
  }
}
