within BrickerISES.Tests.FA;
model TestMixedTank4FlangeClosed
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,54})));
  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(Vtot=2,
      Tstart=373.15)
    annotation (Placement(transformation(extent={{-28,-32},{8,18}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{52,-52},{32,-32}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=0.5)
    annotation (Placement(transformation(extent={{28,-24},{38,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP Source(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    p0=115794,
    T_0=573.15)
    annotation (Placement(transformation(extent={{-72,-78},{-92,-58}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{-62,-50},{-82,-30}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction1(k=1)
    annotation (Placement(transformation(extent={{-62,-22},{-72,-12}})));
equation
  connect(Tamb.y, mixedTank4FlangeComplete.Tamb) annotation (Line(
      points={{-55,54},{-46,54},{-46,-5.5},{-30.52,-5.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpFlowFraction.y, pump1.flow_in) annotation (Line(
      points={{38.5,-19},{38.5,-26.5},{45.2,-26.5},{45.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump1.OutFlow, mixedTank4FlangeComplete.InFlow2) annotation (Line(
      points={{36.4,-34.6},{10.2,-34.6},{10.2,-32},{-10,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, mixedTank4FlangeComplete.OutFlow2) annotation (Line(
      points={{49.2,-41.5},{49.2,18.5},{-10,18.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pumpFlowFraction1.y, pump2.flow_in) annotation (Line(
      points={{-72.5,-17},{-72.5,-24.5},{-68.8,-24.5},{-68.8,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump2.InFlow, mixedTank4FlangeComplete.InFlow1) annotation (Line(
      points={{-64.8,-39.5},{-46.4,-39.5},{-46.4,-22.5},{-27.28,-22.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, mixedTank4FlangeComplete.OutFlow1) annotation (Line(
      points={{-77.6,-32.6},{-94,-32.6},{-94,11},{-27.28,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Source.flange, mixedTank4FlangeComplete.OutFlow1) annotation (Line(
      points={{-91.4,-68},{-92,-68},{-92,-32},{-94,-32.6},{-94,11},{-27.28,11}},
      color={0,0,255},
      smooth=Smooth.None));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestMixedTank4FlangeClosed;
