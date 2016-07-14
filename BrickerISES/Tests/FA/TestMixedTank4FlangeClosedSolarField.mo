within BrickerISES.Tests.FA;
model TestMixedTank4FlangeClosedSolarField

  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(Vtot=2,
      Tstart=373.15)
    annotation (Placement(transformation(extent={{-22,-22},{4,14}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{52,-52},{32,-32}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=0.5)
    annotation (Placement(transformation(extent={{28,-24},{38,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP Source(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p0=115794,
    T_0=573.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-90,-62})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{-62,-50},{-82,-30}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction1(k=1)
    annotation (Placement(transformation(extent={{-62,-20},{-72,-10}})));
  Components.SolarField solarField(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Ns=10,
    Np=2,
    Unom=1500,
    Mdotnom=1.5,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-82,-6},{-42,34}})));

  Modelica.Blocks.Sources.BooleanStep Defocusing(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-76,78},{-96,98}})));
  Modelica.Blocks.Sources.Step DNI(
    height=-1000,
    offset=1000,
    startTime=1000)
    annotation (Placement(transformation(extent={{-16,76},{-26,84}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-36,68},{-46,78}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-62,70},{-52,78}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-74,68},{-64,78}})));
equation
  connect(pumpFlowFraction.y, pump1.flow_in) annotation (Line(
      points={{38.5,-19},{38.5,-26.5},{45.2,-26.5},{45.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump1.OutFlow, mixedTank4FlangeComplete.InFlow2) annotation (Line(
      points={{36.4,-34.6},{10.2,-34.6},{10.2,-22},{-9,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, mixedTank4FlangeComplete.OutFlow2) annotation (Line(
      points={{49.2,-41.5},{49.2,14.36},{-9,14.36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pumpFlowFraction1.y, pump2.flow_in) annotation (Line(
      points={{-72.5,-15},{-72.5,-24.5},{-68.8,-24.5},{-68.8,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump2.InFlow, mixedTank4FlangeComplete.InFlow1) annotation (Line(
      points={{-64.8,-39.5},{-46.4,-39.5},{-46.4,-15.16},{-21.48,-15.16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Defocusing.y, solarField.Defocusing) annotation (Line(
      points={{-97,88},{-92,88},{-92,1},{-80,1}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, solarField.InFlow) annotation (Line(
      points={{-77.6,-32.6},{-96,-32.6},{-96,16.4},{-81.2,16.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField.OutFlow, mixedTank4FlangeComplete.OutFlow1) annotation (
      Line(
      points={{-43.2,16.4},{-35.6,16.4},{-35.6,8.96},{-21.48,8.96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Source.flange, solarField.InFlow) annotation (Line(
      points={{-90,-52.6},{-90,-32},{-96,-32},{-96,16.4},{-81.2,16.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarField.v_wind) annotation (Line(
      points={{-63.5,73},{-63.5,64.5},{-76.2,64.5},{-76.2,32.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField.Theta) annotation (Line(
      points={{-51.5,74},{-51.5,32.3},{-68.3,32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarField.Tamb) annotation (Line(
      points={{-46.5,73},{-46.5,65.5},{-61.5,65.5},{-61.5,32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.Tamb, solarField.Tamb) annotation (Line(
      points={{-23.82,-2.92},{-23.82,68},{-46,68},{-46,65.5},{-61.5,65.5},{-61.5,
          32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField.DNI) annotation (Line(
      points={{-26.5,80},{-34,80},{-34,32.4},{-54.4,32.4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3600, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestMixedTank4FlangeClosedSolarField;
