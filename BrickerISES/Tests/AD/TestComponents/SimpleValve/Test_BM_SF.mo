within BrickerISES.Tests.AD.TestComponents.SimpleValve;
model Test_BM_SF
  //Solar Field
// k
// Slope        0
// Time        0        s

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    h=551.7)    annotation (Placement(transformation(extent={{60,108},{80,128}})));
 BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    CheckValve=true,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={26,64})));

  ThermoCycle.Components.HeatFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-84,14},{-104,34}})));
Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=6.26675e-05)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-56,72})));

Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.1914,
    Afull=4.70219e-05)
                annotation (Placement(transformation(extent={{-30,92},{-10,112}})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    QcombustionStart=10e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-177,76})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-232,66},{-218,80}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0264686,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-134,10},{-154,30}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=9.4,
    V_tank=0.03,
    p_ext=600000,
    Tstart=533.15,
    pstart=600000,
    L_lstart=0.99)
    annotation (Placement(transformation(extent={{-134,118},{-114,138}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=19,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-164,-180},{-122,-110}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=25)
    annotation (Placement(transformation(extent={{-248,-158},{-228,-138}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-248,-126},{-228,-106}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-240,-80},{-220,-60}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=1000)
    annotation (Placement(transformation(extent={{-248,-192},{-228,-172}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-246,-230},{-226,-210}})));
 Components.Valve_lin             valve3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.5e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,-140})));
  Modelica.Blocks.Sources.Constant const4(k=0.04)
    annotation (Placement(transformation(extent={{-90,-144},{-80,-134}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,-66},{14,-46}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{58,-218},{38,-198}})));
equation
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{26,73},{26,118},{61.6,118}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, valve1.OutFlow) annotation (Line(
      points={{26,55},{26,12},{-56,12},{-56,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, valve1.OutFlow) annotation (Line(
      points={{-87,19.2},{-56,19.2},{-56,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.InFlow, valve2.InFlow) annotation (Line(
      points={{-56,81},{-56,102},{-29,102}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-11,102},{26,102},{26,118},{61.6,118}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y,flow1DIncHeatInput. u) annotation (Line(
      points={{-217.3,73},{-210,73},{-210,76},{-197.8,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
      points={{-180.64,51},{-180.64,27.4},{-149.6,27.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, sensTp.OutFlow) annotation (Line(
      points={{-136.8,20.5},{-106,20.5},{-106,19.2},{-101,19.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, openTank.InFlow) annotation (Line(
      points={{-180.12,100.5},{-180.12,119.6},{-133.8,119.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, valve2.InFlow) annotation (Line(
      points={{-114.2,119.6},{-96,119.6},{-96,120},{-56,120},{-56,102},{-29,102}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-227,-182},{-200,-182},{-200,-156.136},{-161.9,-156.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-225,-220},{-178,-220},{-178,-169.818},{-161.667,-169.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{39,-208},{-138.8,-208},{-138.8,-180.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{-46,-149},{-46,-208},{-138.8,-208},{-138.8,-180.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y, valve3.cmd) annotation (Line(
      points={{-79.5,-139},{-72,-139},{-72,-140},{-54,-140}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve3.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-46,-131},{-46,-62},{-3,-62},{-3,-60.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-227,-116},{-202,-116},{-202,-129.091},{-161.667,-129.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-227,-148},{-200,-148},{-200,-143.091},{-161.667,-143.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-136,-110.636},{-136,-62},{-3,-62},{-3,-60.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-219,-70},{-198,-70},{-198,-115.727},{-161.2,-115.727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, valve1.OutFlow) annotation (Line(
      points={{11,-60.8},{72,-60.8},{72,12},{-56,12},{-56,63}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -240},{220,140}}), graphics), Icon(coordinateSystem(extent={{-260,
            -240},{220,140}})));
end Test_BM_SF;
