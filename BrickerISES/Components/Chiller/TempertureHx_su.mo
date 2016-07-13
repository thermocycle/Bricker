within BrickerISES.Components.Chiller;
model TempertureHx_su
  extends BrickerISES.Spline.OpticalPowerCurveGenerator(table=[
  0,   8;
  2000,  11;
  3000,  11;
  4000,  11;
  5000,  15;
  6000,  15;
  7000,  15;
  8000,  15;
  9000,  15;
  10000,  15;
  11000,  15;
  12000,  15;
  13000,  15;
  14000,  15;
  15000,  15;
  16000,  15;
  17000,  15;
  18000,  15;
  19000,  15;
  20000,  15;
  259200, 15]);
equation

  annotation (experiment(
      StartTime=-500,
      StopTime=52000,
      NumberOfIntervals=5000), experimentSetupOutput);
end TempertureHx_su;
