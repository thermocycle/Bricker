within BrickerISES.Tests.AD.TestComponents.SimpleValve;
model Test_BiomassSystem7
//Internal
// Time	k
// 0	6.26675e-05
// 10000	6.26675e-05

// Out
// k	6.26959e-05	
// Slope	0
// Time	0	s

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{94,44},{114,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{116,-62},{96,-42}})));
 BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    CheckValve=true,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,0})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=9.4,
    p=450000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-92,82},{-72,102}})));
  ThermoCycle.Components.HeatFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,-58},{-66,-38}})));
Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=6.26675e-05)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,8})));

Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.1914,
    Afull=4.70219e-05)
                annotation (Placement(transformation(extent={{6,40},{26,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP2(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        600000) annotation (Placement(transformation(extent={{-152,46},{-172,66}})));
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
        origin={-139,8})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-198,2},{-184,16}})));
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
    annotation (Placement(transformation(extent={{-78,-46},{-98,-26}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{97,-52},{60,-52},{60,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{60,9},{60,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, valve1.InFlow) annotation (Line(
      points={{-73,92},{-22,92},{-22,17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, valve1.OutFlow) annotation (Line(
      points={{60,-9},{60,-52},{-22,-52},{-22,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, valve1.OutFlow) annotation (Line(
      points={{-49,-52.8},{-22,-52.8},{-22,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.InFlow, valve2.InFlow) annotation (Line(
      points={{-22,17},{-22,50},{7,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow, sinkP.flangeB) annotation (Line(
      points={{25,50},{60,50},{60,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y,flow1DIncHeatInput. u) annotation (Line(
      points={{-183.3,9},{-176,9},{-176,8},{-159.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP2.flangeB,flow1DIncHeatInput. outlet_fl2) annotation (Line(
      points={{-153.6,56},{-142.12,56},{-142.12,32.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
      points={{-142.64,-17},{-142.64,-28.6},{-93.6,-28.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, sensTp.OutFlow) annotation (Line(
      points={{-80.8,-35.5},{-72,-35.5},{-72,-52.8},{-63,-52.8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,120}}), graphics), Icon(coordinateSystem(extent={{-120,-100},
            {120,120}})));
end Test_BiomassSystem7;
