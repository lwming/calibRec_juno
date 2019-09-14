# calibRec_juno
calibration flow development

pmt calibration algorithm development

1. PMTCalibAlg: (Extracting and ) using channel calibration data...
    input: calib data model + PmtDataPtr.txt
    output: calib data model(correction)


2. PMTCalibSvc: service for getting channel calibration data...
    read PmtDataPtr.txt for channel correction


3. TimeCorrAlg: correct single-channel time offset..
