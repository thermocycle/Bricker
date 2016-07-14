within BrickerISES.Tests.SA;
model Test_SF_Soltigua_valve_hysteresis_V1_0

  Modelica.Blocks.Sources.Constant Tamb(k=25)
    annotation (Placement(transformation(extent={{-122,-30},{-102,-10}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-122,4},{-102,24}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-122,38},{-102,58}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3.333e-3)
    annotation (Placement(transformation(extent={{12,-64},{-8,-44}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-18,100})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    CheckValve=true,
    Afull=4.5e-05) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={66,52})));
  Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-54,-48},{-38,-34}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=3,
    T_0=423.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={82,98})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={18,42})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,58},{-84,74}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,4})));
  BrickerISES.Components.SF.SolarField_SoltiguaWall_Inc solarField_SoltiguaWall_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=10,
    Ns=4,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Unom=700,
    Nt=3,
    Mwall=140,
    Mdotnom=0.8,
    pstart=100000,
    Tstart_inlet=423.15,
    Tstart_outlet=423.15,
    Tstart_inlet_wall=423.15,
    Tstart_outlet_wall=423.15)
    annotation (Placement(transformation(extent={{-50,-18},{-14,26}})));

  Modelica.Blocks.Sources.Pulse pulse(
    width=50,
    nperiod=1,
    startTime=200,
    period=1500,
    amplitude=1500)
    annotation (Placement(transformation(extent={{-140,-52},{-128,-40}})));
  Modelica.Fluid.Sensors.Temperature temperature_MIX(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{16,58},{30,70}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    width=50,
    nperiod=1,
    period=1500,
    startTime=400,
    amplitude=1200)
    annotation (Placement(transformation(extent={{-140,-76},{-128,-64}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-116,-64},{-102,-52}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=450, uLow=448)
    annotation (Placement(transformation(extent={{-120,-96},{-102,-78}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=-2,
    Ti=1) annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={55,72})));
  Modelica.Blocks.Sources.Constant const2(k=433)
    annotation (Placement(transformation(extent={{18,82},{28,92}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=90,
        origin={-10,65})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={82,6})));
equation

  connect(ValveSF.OutFlow, DpSF.OutFlow) annotation (Line(
      points={{57,52},{18,52},{18,47.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.InFlow, pump.OutFlow) annotation (Line(
      points={{-28.4,-18.4},{-28.4,-46.6},{-3.6,-46.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarField_SoltiguaWall_Inc.v_wind) annotation (Line(
      points={{-101,48},{-90,48},{-90,34},{-47.6,34},{-47.6,22.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_SoltiguaWall_Inc.Theta) annotation (Line(
      points={{-101,14},{-48,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_SoltiguaWall_Inc.Tamb) annotation (Line(
      points={{-101,-20},{-86,-20},{-86,6},{-48,6},{-48,5.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse1.y, add.u2) annotation (Line(
      points={{-127.4,-70},{-122,-70},{-122,-61.6},{-117.4,-61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, add.u1) annotation (Line(
      points={{-127.4,-46},{-117.4,-46},{-117.4,-54.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarField_SoltiguaWall_Inc.Defocusing) annotation (
      Line(
      points={{-101.1,-87},{-72,-87},{-72,-12},{-60,-12},{-60,-11.6},{-48,
          -11.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.T, hysteresis.u) annotation (Line(
      points={{-81.3,66},{-150,66},{-150,-82},{-138,-82},{-138,-87},{-121.8,
          -87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, solarField_SoltiguaWall_Inc.DNI) annotation (Line(
      points={{-101.3,-58},{-78,-58},{-78,-3},{-48.2,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowRate1.port_a, pump.InFlow) annotation (Line(
      points={{18,-6},{18,-53.5},{9.2,-53.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate1.port_b, DpSF.InFlow) annotation (Line(
      points={{18,14},{18,36.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{60.3,72},{66,72},{66,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature_MIX.T, pID.PV) annotation (Line(
      points={{27.9,64},{36,64},{36,69.6},{50,69.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, pID.SP) annotation (Line(
      points={{28.5,87},{38.25,87},{38.25,74.4},{50,74.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP.flangeB, massFlowRate3.port_b) annotation (Line(
      points={{-18,93.28},{-18,84},{-10,84},{-10,72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_a, DpSF.OutFlow) annotation (Line(
      points={{-10,58},{-10,52},{18,52},{18,47.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{75,52},{82,52},{82,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, massFlowRate2.port_a) annotation (Line(
      points={{82,89},{82,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_MIX.port, massFlowRate3.port_b) annotation (Line(
      points={{23,58},{6,58},{6,78},{-10,78},{-10,72}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_IN_SF.port, pump.OutFlow) annotation (Line(
      points={{-46,-48},{-46,-56},{-28,-56},{-28,-46.6},{-3.6,-46.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump.InFlow) annotation (Line(
      points={{82,-4},{82,-54},{18,-54},{18,-53.5},{9.2,-53.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-26,25.6},{-10,25.6},{-10,34},{18,34},{18,36.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.port, solarField_SoltiguaWall_Inc.OutFlow)
    annotation (Line(
      points={{-75,58},{-66,58},{-66,50},{-26,50},{-26,25.6}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF_Soltigua_valve_hysteresis_V1_0;
