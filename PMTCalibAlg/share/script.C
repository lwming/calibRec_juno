void script(){
  TFile* inputfile=new TFile("output.root","read");//FIXME merged files 
  TH1F* th[17746];
  double mu[17764];
  double mumean=0;
  TF1* tf1=new TF1("tf1","gaus(0)+gaus(3)",0,10);
  double par[6]={1.e4,0.,0.05,1.e2,1,0.35};
  tf1->SetParameters(par);
  for(int i=0;i<17746;i++){
  //for(int i=0;i<177;i++){
    TString name=Form("ch%d_charge_spec",i);
    th[i]=(TH1F*)inputfile->Get(name);
    th[i]->Fit(tf1,"Q");
    //cout<<"PMTID: "<<i<<", "<<tf1->GetParameter(4)<<endl;
    //cout<<"PMTID: "<<i<<", "<<tf1->GetParameter(3)/tf1->GetParameter(0)*tf1->GetParameter(5)/tf1->GetParameter(2)<<endl;
    mu[i]=tf1->GetParameter(3)/tf1->GetParameter(0)*tf1->GetParameter(5)/tf1->GetParameter(2);
    mumean+=mu[i];
    if((i-46)%100==0)cout<<i<<" finished"<<endl;
  }
  mumean/=17746;
  //cout<<mumean<<endl;
  double relaDE[17746];
  for(int i=0;i<17746;i++){
    relaDE[i]=mu[i]/mumean;
  }

}
