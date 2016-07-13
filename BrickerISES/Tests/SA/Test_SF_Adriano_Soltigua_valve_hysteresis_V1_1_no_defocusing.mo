within BrickerISES.Tests.SA;
model Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing

  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-222,12},{-202,32}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-226,52},{-206,72}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-222,80},{-202,100}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=3.333e-3,
    X_pp0=1)
    annotation (Placement(transformation(extent={{-80,-14},{-100,6}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={108,82})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    CheckValve=true,
    Afull=4.5e-05) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={16,52})));
  Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-162,-18},{-146,-4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=2.8,
    T_0=443.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,-6})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-32,86})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-206,114},{-224,130}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-58,52})));
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
    Mdotnom=0.8,
    Mwall=60,
    pstart=100000,
    Tstart_inlet=443.15,
    Tstart_outlet=443.15,
    Tstart_inlet_wall=443.15,
    Tstart_outlet_wall=443.15)
    annotation (Placement(transformation(extent={{-166,34},{-130,78}})));

  Modelica.Fluid.Sensors.Temperature temperature_MIX(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{90,34},{76,46}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-220,-54},{-202,-36}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=-0.1) annotation (Placement(transformation(
        extent={{5,-6},{-5,6}},
        rotation=0,
        origin={51,54})));
  Modelica.Blocks.Sources.Constant const2(k=495)
    annotation (Placement(transformation(extent={{78,58},{68,68}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={34,85})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-4,-4})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 3600,300; 7200,900;
        30000,900; 80000,900])
    annotation (Placement(transformation(extent={{-222,-20},{-202,0}})));
equation

  connect(solarField_SoltiguaWall_Inc.InFlow, pump.OutFlow) annotation (Line(
      points={{-144.4,33.6},{-144.4,3.4},{-95.6,3.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarField_SoltiguaWall_Inc.v_wind) annotation (Line(
      points={{-201,90},{-190,90},{-190,76},{-163.6,76},{-163.6,74.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_SoltiguaWall_Inc.Theta) annotation (Line(
      points={{-205,62},{-194,62},{-194,66},{-164,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_SoltiguaWall_Inc.Tamb) annotation (Line(
      points={{-201,22},{-198,22},{-198,56},{-164,56},{-164,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarField_SoltiguaWall_Inc.Defocusing) annotation (
      Line(
      points={{-201.1,-45},{-172,-45},{-172,30},{-160,30},{-160,40.4},{-164,
          40.4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.T, hysteresis.u) annotation (Line(
      points={{-221.3,122},{-250,122},{-250,-40},{-238,-40},{-238,-45},{-221.8,
          -45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowRate1.port_a, pump.InFlow) annotation (Line(
      points={{-58,42},{-58,-3.5},{-82.8,-3.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate1.port_b, DpSF.InFlow) annotation (Line(
      points={{-58,62},{-58,86},{-37.4,86}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_IN_SF.port, pump.OutFlow) annotation (Line(
      points={{-154,-18},{-154,-20},{-116,-20},{-116,3.4},{-95.6,3.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump.InFlow) annotation (Line(
      points={{-14,-4},{-26,-4},{-26,-3.5},{-82.8,-3.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-142,77.6},{-128,77.6},{-128,86},{-37.4,86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.port, solarField_SoltiguaWall_Inc.OutFlow)
    annotation (Line(
      points={{-215,114},{-154,114},{-154,96},{-142,96},{-142,77.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable.y, solarField_SoltiguaWall_Inc.DNI) annotation (Line(
      points={{-201,-10},{-178,-10},{-178,49},{-164.2,49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{16,43},{16,-4},{6,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_a, sourceMdot.flangeB) annotation (Line(
      points={{6,-4},{48,-4},{48,-6},{71,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-26.6,86},{27,86},{27,85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{16,61},{16,86},{27,86},{27,85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, sinkP.flangeB) annotation (Line(
      points={{41,85},{70.5,85},{70.5,82},{101.28,82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.cmd, pID.CS) annotation (Line(
      points={{24,52},{36,52},{36,54},{45.7,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature_MIX.T, pID.PV) annotation (Line(
      points={{78.1,40},{60,40},{60,51.6},{56,51.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.SP, const2.y) annotation (Line(
      points={{56,56.4},{62,56.4},{62,63},{67.5,63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature_MIX.port, sinkP.flangeB) annotation (Line(
      points={{83,34},{83,30},{92,30},{92,82},{101.28,82}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-240,-100},{120,160}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=86000, __Dymola_NumberOfIntervals=5000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-240,-100},{120,160}})));
end Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing;
