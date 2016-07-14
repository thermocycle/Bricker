within BrickerISES.Components.Chiller;
model MassFlowSource_3Sept
  extends BrickerISES.Spline.OpticalPowerCurveGenerator(table=[
 0,0;
3600,0;
7200,0;
10800,0;
14400,0;
18000,0;
21600,0;
25200,0;
28800,16;
32400,11.6;
36000,14.3;
39600,17.2;
43200,20.9;
46800,23;
50400,24.5;
54000,15.3;
57600,12.4;
61200,10.8;
64800,6.78;
68400,0;
72000,0;
75600,0;
79200,0;
82800,0;
86400,0]);
equation

  annotation (experiment(
      StartTime=-500,
      StopTime=52000,
      NumberOfIntervals=5000), experimentSetupOutput);
end MassFlowSource_3Sept;
