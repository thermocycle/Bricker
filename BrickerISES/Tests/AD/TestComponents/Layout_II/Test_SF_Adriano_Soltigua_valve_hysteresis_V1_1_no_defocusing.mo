within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing

  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-228,26},{-208,46}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-226,52},{-206,72}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-222,80},{-202,100}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    V_dot_max=0.0064588,
    M_dot_start=2.5,
    hstart=3.46e5,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-80,-14},{-100,6}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       450000)
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={108,82})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.075)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={16,50})));
  Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-162,-18},{-146,-4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=2.9,
    T_0=436.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={82,-6})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-204,120},{-222,136}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-58,52})));

  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-220,-54},{-202,-36}})));
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
        origin={-22,-4})));
  Modelica.Blocks.Sources.Constant Tamb1(k=670)
    annotation (Placement(transformation(extent={{-228,-4},{-208,16}})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{98,110},{80,126}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    N=5,
    Ns=3,
    Nt=4,
    Mdotnom=2.5,
    Unom=1000,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15,
    pstart=100000,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal)
    annotation (Placement(transformation(extent={{-180,18},{-138,88}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-22,94})));
equation

  connect(temperature_OUT_SF.T, hysteresis.u) annotation (Line(
      points={{-219.3,128},{-250,128},{-250,-40},{-238,-40},{-238,-45},{
          -221.8,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowRate1.port_a, pump.InFlow) annotation (Line(
      points={{-58,42},{-58,-3.5},{-82.8,-3.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_IN_SF.port, pump.OutFlow) annotation (Line(
      points={{-154,-18},{-154,-20},{-116,-20},{-116,3.4},{-95.6,3.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump.InFlow) annotation (Line(
      points={{-32,-4},{-26,-4},{-26,-3.5},{-82.8,-3.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{16,41},{16,-4},{-12,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_a, sourceMdot.flangeB) annotation (Line(
      points={{-12,-4},{48,-4},{48,-6},{73,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{16,59},{16,86},{27,86},{27,85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, sinkP.flangeB) annotation (Line(
      points={{41,85},{70.5,85},{70.5,82},{101.28,82}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(temperature_OUT.port, sinkP.flangeB) annotation (Line(
      points={{89,110},{88,110},{88,82},{101.28,82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump.OutFlow) annotation (Line(
      points={{-154.8,17.3636},{-154.8,3.4},{-95.6,3.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-201,90},{-190,90},{-190,82.2727},{-177.2,82.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-205,62},{-192,62},{-192,68.9091},{-177.667,68.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-207,36},{-198,36},{-198,54.9091},{-177.667,54.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-207,6},{-204,6},{-204,30},{-192,30},{-192,41.8636},{-177.9,
          41.8636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-201.1,-45},{-188,-45},{-188,28.1818},{-177.667,28.1818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, massFlowRate1.port_b) annotation (
      Line(
      points={{-152,87.3636},{-152,94},{-58,94},{-58,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.port, solarCollectorIncSchott.OutFlow)
    annotation (Line(
      points={{-213,120},{-214,120},{-214,116},{-152,116},{-152,87.3636}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, massFlowRate1.port_b) annotation (Line(
      points={{-27.4,94},{-58,94},{-58,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-16.6,94},{-4,94},{-4,86},{27,86},{27,85}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-240,-100},{120,160}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=2000, __Dymola_NumberOfIntervals=5000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-240,-100},{120,160}})));
end Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing;
