void script()
{
  double Pi = 3.1415926;
  const int Npmt = 17613;

  // FIXME merged files
  // TFile* inputfile = new TFile("toymc_calibCorr_user.root", "read");
  // TFile* inputfile = new TFile("sample_calibCorr_user.root", "read");
  TFile* inputfile = new TFile("sample_calibCorr_user_v19.root", "read");
  TH1F* th[Npmt];
  TH1D* muth = new TH1D("muth", "Relative DE", Npmt, 0, Npmt);
  TH1D* gainth = new TH1D("gainth", "Gain", Npmt, 0, Npmt);
  TH1D* gainth2 = new TH1D("gainth2", "Gain", Npmt, 0, Npmt);
  double mu[Npmt];
  double relaDE[Npmt];
  double gain[Npmt];
  double gain2[Npmt];
  double darkrate[Npmt];
  double mumean = 0;
  TF1* tf1 = new TF1("tf1", "gaus(0)", 0, 1.75);
  double par[3] = {1.e3, 1, 0.35};
  tf1->SetParameters(par);
  TH1F* darkCount = (TH1F*)inputfile->Get("darkCount");
  TH1F* totalWaveCount = (TH1F*)inputfile->Get("totalWaveCount");
  float totalWave = totalWaveCount->GetBinContent(1);
  darkCount->Scale(1. / (totalWave * 1000e-9));

  for (int i = 0; i < Npmt; i++) {
    // for(int i=0;i<177;i++){
    TString name = Form("ch%d_charge_spec", i);
    th[i] = (TH1F*)inputfile->Get(name);
    th[i]->Fit(tf1, "Q");
    // relaDE
    mu[i] = 1. * th[i]->Integral() / (totalWave - th[i]->Integral());
    mumean += mu[i];
    // gain
    gain[i] = tf1->GetParameter(1);
    gain2[i] = th[i]->GetMean();
    gainth->SetBinContent(i + 1, gain[i]);
    gainth2->SetBinContent(i + 1, gain2[i]);
    // dark rate
    darkrate[i] = darkCount->GetBinContent(i + 1);
    // print log
    if ((i - 46) % 1000 == 0) cout << i << " finished" << endl;
  }
  mumean /= Npmt;
  for (int i = 0; i < Npmt; i++) {
    relaDE[i] = mu[i] / mumean;
    muth->SetBinContent(i + 1, relaDE[i]);
  }

  // output as a txt
  ofstream ofile("CalibPars.txt");
  for (int i = 0; i < Npmt; i++) {
    // for(int i=0;i<177;i++){
    ofile << i << "\t" << relaDE[i] << "\t" << gain[i] << "\t" << darkrate[i]
          << endl;
  }
  ofile.close();

  // draw as a 2D pattern
  // TString filename = "PMTPos_Acrylic.csv";
  TString filename = "PMTPos_Acrylic_with_chimney.csv";
  ifstream sfile;
  sfile.open(filename, ios::in);
  int line = 0;
  vector<int> circle;
  vector<int> copyno;
  vector<double> theta, phi;
  TVector3 pmt_p;
  vector<TVector3> m_pmt_pos;
  m_pmt_pos.clear();
  double mag = 19500;
  int tmp_lineno = -1, tmp_copyno = 0;
  double tmp_theta, tmp_phi;
  double tmp;
  double tmp0 = 180;
  while (sfile >> tmp >> tmp >> tmp >> tmp_theta >> tmp_phi) {
    theta.push_back(tmp_theta);
    phi.push_back(tmp_phi);
    pmt_p.SetMagThetaPhi(mag, tmp_theta * Pi / 180, tmp_phi * Pi / 180);
    m_pmt_pos.push_back(pmt_p);

    if (tmp_phi < tmp0) {
      tmp_copyno = 0;
      tmp_lineno++;
    }
    copyno.push_back(tmp_copyno++);
    circle.push_back(tmp_lineno);
    tmp0 = tmp_phi;
  }
  sfile.close();

  double zmin_relaDE = 100;
  double zmax_relaDE = 0;
  double zmin_gain = 100;
  double zmax_gain = 0;
  double zmin_gain2 = 100;
  double zmax_gain2 = 0;
  double zmin_darkrate = 1e10;
  double zmax_darkrate = 0;
  int xmax = 0;
  int ymax = 0;
  for (int i = 0; i < Npmt; i++) {
    if (copyno[i] > xmax) xmax = copyno[i];
    if (circle[i] > ymax) ymax = circle[i];
    if (relaDE[i] > zmax_relaDE) zmax_relaDE = relaDE[i];
    if (relaDE[i] < zmin_relaDE) zmin_relaDE = relaDE[i];
    if (gain[i] > zmax_gain) zmax_gain = gain[i];
    if (gain[i] < zmin_gain) zmin_gain = gain[i];
    if (gain2[i] > zmax_gain2) zmax_gain2 = gain2[i];
    if (gain2[i] < zmin_gain2) zmin_gain2 = gain2[i];
    if (darkrate[i] > zmax_darkrate) zmax_darkrate = darkrate[i];
    if (darkrate[i] < zmin_darkrate) zmin_darkrate = darkrate[i];
  }
  TH2F* mu2dth = new TH2F("mu2dth", "Relative DE 2D", xmax + 1, 0, xmax + 1,
                          ymax + 1, 0, ymax + 1);
  TH2F* gain2dth = new TH2F("gain2dth", "Gain 2D", xmax + 1, 0, xmax + 1,
                            ymax + 1, 0, ymax + 1);
  TH2F* gain22dth = new TH2F("gain22dth", "Gain2 2D", xmax + 1, 0, xmax + 1,
                             ymax + 1, 0, ymax + 1);
  TH2F* darkrate2dth = new TH2F("darkrate2dth", "Dark Rate 2D", xmax + 1, 0,
                                xmax + 1, ymax + 1, 0, ymax + 1);
  for (int i = 0; i < Npmt; i++) {
    /*if (i < 8946) {
      mu2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, relaDE[i]);
      gain2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, gain[i]);
      gain22dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, gain2[i]);
      darkrate2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1,
    darkrate[i]);
    } else {
      mu2dth->SetBinContent(copyno[i] + 1, circle[i] - 55 + 1, relaDE[i]);
      gain2dth->SetBinContent(copyno[i] + 1, circle[i] - 55 + 1, gain[i]);
      gain22dth->SetBinContent(copyno[i] + 1, circle[i] - 55 + 1, gain2[i]);
      darkrate2dth->SetBinContent(copyno[i] + 1, circle[i] - 55 + 1,
    darkrate[i]);
    }*/
    mu2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, relaDE[i]);
    gain2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, gain[i]);
    gain22dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1, gain2[i]);
    darkrate2dth->SetBinContent(copyno[i] + 1, ymax - (circle[i]) + 1,
                                darkrate[i]);
  }

  TCanvas* c = new TCanvas("c", "c", 800, 600);
  c->cd();
  muth->Draw();
  TCanvas* c1 = new TCanvas("c1", "c1", 800, 600);
  c1->cd();
  gainth->Draw();
  gainth2->SetLineColor(2);
  gainth2->Draw("same");
  TCanvas* c2 = new TCanvas("c2", "c2", 800, 600);
  c2->cd();
  darkCount->Draw();
  TCanvas* c3 = new TCanvas("c3", "c3", 800, 600);
  c3->cd();
  mu2dth->GetZaxis()->SetRangeUser(zmin_relaDE, zmax_relaDE);
  mu2dth->Draw("colz");
  TCanvas* c4 = new TCanvas("c4", "c4", 800, 600);
  c4->cd();
  gain2dth->GetZaxis()->SetRangeUser(zmin_gain, zmax_gain);
  gain2dth->Draw("colz");
  TCanvas* c5 = new TCanvas("c5", "c5", 800, 600);
  c5->cd();
  gain22dth->GetZaxis()->SetRangeUser(zmin_gain2, zmax_gain2);
  gain22dth->Draw("colz");
  TCanvas* c6 = new TCanvas("c6", "c6", 800, 600);
  c6->cd();
  darkrate2dth->GetZaxis()->SetRangeUser(zmin_darkrate, zmax_darkrate);
  darkrate2dth->Draw("colz");
}
