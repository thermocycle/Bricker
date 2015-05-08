within BrickerISES.Tests.AD;
model TestMixedTank4FlangeClosedSolarField

  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(Vtot=2,
      Tstart=373.15)
    annotation (Placement(transformation(extent={{-22,-22},{4,14}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{52,-52},{32,-32}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=0.5)
    annotation (Placement(transformation(extent={{28,-24},{38,-14}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{-62,-50},{-82,-30}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction1(k=1)
    annotation (Placement(transformation(extent={{-62,-22},{-72,-12}})));
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
    annotation (Placement(transformation(extent={{-76,76},{-96,96}})));
  Modelica.Blocks.Sources.Step DNI(
    height=-1000,
    offset=1000,
    startTime=1000)
    annotation (Placement(transformation(extent={{-20,70},{-30,78}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-36,68},{-46,78}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-62,68},{-52,76}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-74,66},{-64,76}})));
  Components.Tank.Open_Tank open_Tank(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    H_D=1,
    V_tank=1,
    p_ext=410000,
    Tstart=323.15,
    pstart=410000,
    L_lstart=0.4,
    Mdotnom=0.1)
    annotation (Placement(transformation(extent={{-38,-52},{-18,-32}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium = ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{-10,-58},{10,-38}})));
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
      points={{-72.5,-17},{-72.5,-24.5},{-68.8,-24.5},{-68.8,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump2.InFlow, mixedTank4FlangeComplete.InFlow1) annotation (Line(
      points={{-64.8,-39.5},{-46.4,-39.5},{-46.4,-15.16},{-21.48,-15.16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Defocusing.y,solarField. Defocusing) annotation (Line(
      points={{-97,86},{-92,86},{-92,1},{-80,1}},
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
  connect(const3.y, solarField.v_wind) annotation (Line(
      points={{-63.5,71},{-63.5,64.5},{-76.2,64.5},{-76.2,32.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField.Theta) annotation (Line(
      points={{-51.5,72},{-52,72},{-52,32.3},{-68.3,32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarField.Tamb) annotation (Line(
      points={{-46.5,73},{-46.5,65.5},{-61.5,65.5},{-61.5,32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.Tamb, solarField.Tamb) annotation (Line(
      points={{-23.82,-2.92},{-23.82,68},{-46,68},{-46,65.5},{-61.5,65.5},{
          -61.5,32.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField.DNI) annotation (Line(
      points={{-30.5,74},{-34,74},{-34,32.4},{-54.4,32.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(open_Tank.InFlow, mixedTank4FlangeComplete.InFlow1) annotation (Line(
      points={{-38.2,-48.2},{-52,-48.2},{-52,-40},{-46.4,-39.5},{-46.4,-15.16},{
          -21.48,-15.16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, open_Tank.OutFlow) annotation (Line(
      points={{-9.8,-48},{-14,-48},{-14,-48.6},{-18.2,-48.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),     graphics),
    experiment(StopTime=3600, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestMixedTank4FlangeClosedSolarField;
