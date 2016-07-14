within BrickerISES.Tests.SA;
model Test_SF_simone_campo_Soltigua_valve_hysteresis_sin

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
    V_dot_max=15e-3)
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
  Modelica.Fluid.Sensors.Temperature temperature_IN(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-56,-64},{-36,-44}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=11,
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
        origin={18,40})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,58},{-84,74}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={28,-56})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium =
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
    Nt=3,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Mwall=55,
    Unom=700,
    Mdotnom=2.5,
    pstart=100000,
    Tstart_inlet=423.15,
    Tstart_outlet=423.15,
    Tstart_inlet_wall=423.15,
    Tstart_outlet_wall=423.15)
    annotation (Placement(transformation(extent={{-50,-18},{-14,26}})));

  Modelica.Fluid.Sensors.Temperature temperature_MIX(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{16,58},{30,70}})));
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
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,66})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=1000,
    freqHz=1e-5,
    offset=0,
    startTime=1000) "1e-5"
    annotation (Placement(transformation(extent={{-144,-64},{-124,-44}})));
  Modelica.Blocks.Math.Abs abs1
    annotation (Placement(transformation(extent={{-108,-64},{-88,-44}})));
equation

  connect(ValveSF.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{75,52},{82,52},{82,89}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, DpSF.OutFlow) annotation (Line(
      points={{57,52},{18,52},{18,45.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, pump.InFlow) annotation (Line(
      points={{23.8,-53.12},{23.9,-53.12},{23.9,-53.5},{9.2,-53.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{32.2,-53.12},{82,-53.12},{82,89}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.InFlow, pump.OutFlow) annotation (Line(
      points={{-28.4,-18.4},{-28.4,-46.6},{-3.6,-46.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_IN.port, pump.OutFlow) annotation (Line(
      points={{-46,-64},{-16,-64},{-16,-46.6},{-3.6,-46.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-26,25.6},{-26,40},{8,40},{8,34.6},{18,34.6}},
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
  connect(hysteresis.y, solarField_SoltiguaWall_Inc.Defocusing) annotation (
      Line(
      points={{-101.1,-87},{-72,-87},{-72,-12},{-60,-12},{-60,-11.6},{-48,
          -11.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT.T, hysteresis.u) annotation (Line(
      points={{-81.3,66},{-150,66},{-150,-82},{-138,-82},{-138,-87},{-121.8,
          -87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowRate.port_a, pump.InFlow) annotation (Line(
      points={{18,-6},{18,-53.5},{9.2,-53.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate.port_b, DpSF.InFlow) annotation (Line(
      points={{18,14},{18,34.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_OUT.port, DpSF.InFlow) annotation (Line(
      points={{-75,58},{-52,58},{-52,40},{8,40},{8,34.6},{18,34.6}},
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
  connect(sinkP.flangeB, massFlowRate1.port_b) annotation (Line(
      points={{-18,93.28},{-18,84},{-10,84},{-10,72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate1.port_a, DpSF.OutFlow) annotation (Line(
      points={{-10,60},{-10,52},{18,52},{18,45.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_MIX.port, DpSF.OutFlow) annotation (Line(
      points={{23,58},{22,58},{22,56},{10,56},{10,52},{18,52},{18,45.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sine.y, abs1.u) annotation (Line(
      points={{-123,-54},{-110,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(abs1.y, solarField_SoltiguaWall_Inc.DNI) annotation (Line(
      points={{-87,-54},{-78,-54},{-78,-6},{-48.2,-6},{-48.2,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF_simone_campo_Soltigua_valve_hysteresis_sin;
