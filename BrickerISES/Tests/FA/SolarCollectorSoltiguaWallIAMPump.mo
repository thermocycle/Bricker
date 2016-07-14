within BrickerISES.Tests.FA;
model SolarCollectorSoltiguaWallIAMPump

  // the following error is given when the pump is used:

  // "The following error was detected at time: 0
  // The arguments x_min and x_max to OneNonLinearEquation.solve(..)
  // do not bracket the root of the single non-linear equation:
  //   x_min  = 273.15
  //   x_max  = 653.15
  //   y_zero = 976079
  //   fa = f(x_min) - y_zero = -976079
  //   fb = f(x_max) - y_zero = -158710
  // fa and fb must have opposite sign which is not the case
  // The stack of functions is:
  // Internal.solve_Unique12
  // ThermoCycle.Media.Therminol66.T_ph_Unique11(sourceP.p0, pump.h_su)
  // Non-linear solver will attempt to handle this problem."

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Therminol66, p0=400000)
    annotation (Placement(transformation(extent={{22,56},{42,76}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-100,34},{-80,54}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-100,64},{-80,84}})));

  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue=true, startTime=
        150)
    annotation (Placement(transformation(extent={{-98,-58},{-78,-38}})));
  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{-104,-24},{-84,-4}})));

  Components.SolarCollectorIncSoltiguaWallIAM solarCollectorIncSoltiguaWallIAM(
    Mdotnom=1,
    Unom=2000,
    N=5,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=500000)
    annotation (Placement(transformation(extent={{-28,-26},{-2,18}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    V_dot_max=1e-3)
    annotation (Placement(transformation(extent={{-30,-88},{-10,-68}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(redeclare package
      Medium = ThermoCycle.Media.Therminol66, T_0=573.15)
    annotation (Placement(transformation(extent={{-92,-92},{-72,-72}})));
  Modelica.Blocks.Sources.Constant FlowFraction(k=0.5)
    annotation (Placement(transformation(extent={{-56,-70},{-44,-60}})));
equation
  connect(solarCollectorIncSoltiguaWallIAM.v_wind, const3.y) annotation (Line(
      points={{-26.7,14.92},{-43.7,14.92},{-43.7,74},{-79,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Theta, Theta.y) annotation (Line(
      points={{-26.7,5.24},{-44.7,5.24},{-44.7,44},{-79,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Tamb, const.y) annotation (Line(
      points={{-26.2667,-4.88},{-44.6,-4.88},{-44.6,20},{-79,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.DNI, step.y) annotation (Line(
      points={{-26.2667,-14.56},{-46.6,-14.56},{-46.6,-14},{-83,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Defocusing, booleanStep.y)
    annotation (Line(
      points={{-33.6333,-18.08},{-33.6333,-48},{-77,-48}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.OutFlow, sinkP.flangeB) annotation (
      Line(
      points={{-15,18.44},{10,18.44},{10,66},{23.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, solarCollectorIncSoltiguaWallIAM.InFlow) annotation (
      Line(
      points={{-14.4,-70.6},{-14.4,-45.3},{-15,-45.3},{-15,-26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-72.6,-82},{-70,-82},{-70,-77.5},{-27.2,-77.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(FlowFraction.y, pump.flow_in) annotation (Line(
      points={{-43.4,-65},{-32.7,-65},{-32.7,-70},{-23.2,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end SolarCollectorSoltiguaWallIAMPump;
