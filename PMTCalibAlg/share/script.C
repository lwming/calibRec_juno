void script(){

  TFile* inputfile=new TFile("output.root","read");//FIXME merged files 
  TH1F* th[17746];
  TH1D* muth=new TH1D("muth","muth",17746,0,17746);
  TH1D* muth2=new TH1D("muth2","muth2",17746,0,17746);
  TH1D* gainth=new TH1D("gainth","gainth",17746,0,17746);
  TH1D* gainth2=new TH1D("gainth2","gainth2",17746,0,17746);
  double mu[17764];
  double mu2[17764];
  double relaDE[17746];
  double gain[17746];
  double gain2[17746];
  double darkrate[17746];
  double mumean=0;
  TF1* tf1=new TF1("tf1","gaus(0)+gaus(3)",0,10);
  double par[6]={1.e4,0.,0.05,1.e2,1,0.35};
  tf1->SetParameters(par);
  TH1F* darkCount=(TH1F*)inputfile->Get("darkCount");
  TH1F* totalWaveCount=(TH1F*)inputfile->Get("totalWaveCount");
  float totalWave=totalWaveCount->GetBinContent(1);
  darkCount->Scale(1./(totalWave*1000e-9));
  for(int i=0;i<17746;i++){
  //for(int i=0;i<177;i++){
    TString name=Form("ch%d_charge_spec",i);
    th[i]=(TH1F*)inputfile->Get(name);
    th[i]->Fit(tf1,"Q");
    //relaDE
    mu[i]=tf1->GetParameter(3)/tf1->GetParameter(0)*tf1->GetParameter(5)/tf1->GetParameter(2);
    mu2[i]=1.*th[i]->Integral(225,1200)/th[i]->Integral(0,225);
    muth->SetBinContent(i+1,mu[i]);
    muth2->SetBinContent(i+1,mu2[i]);
    mumean+=mu[i];
    //gain
    gain[i]=1.e7*tf1->GetParameter(4);
    gain2[i]=0;
    for(int j=225;j<1200;j++){
      gain2[i]+=th[i]->GetBinContent(j)*(0.01*(j-200)+0.005);
    }
    gain2[i]/=th[i]->Integral(225,1200);
    gainth->SetBinContent(i+1,gain[i]);
    gainth2->SetBinContent(i+1,gain2[i]);
    //dark rate
    darkrate[i]=darkCount->GetBinContent(i+1);
    //print log
    if((i-46)%100==0)cout<<i<<" finished"<<endl;
  }
  mumean/=17746;
  //cout<<mumean<<endl;
  for(int i=0;i<17746;i++){
    relaDE[i]=mu[i]/mumean;
  }
  TCanvas* c=new TCanvas("c","c",800,600);
  c->cd();
  muth->Divide(muth2);
  muth->Draw();
  TCanvas* c1=new TCanvas("c1","c1",800,600);
  c1->cd();
  gainth->Divide(gainth2);
  gainth2->Draw();
  TCanvas* c2=new TCanvas("c2","c2",800,600);
  c2->cd();
  darkCount->Draw();

  //output as a txt
  ofstream ofile("output.txt");
  for(int i=0;i<17746;i++){
  //for(int i=0;i<177;i++){
    ofile<<i<<"\t"<<relaDE[i]<<"\t"<<gain2[i]<<"\t"<<darkrate[i]<<endl;
  }

}
