within BrickerISES.Tests.AD.TestComponents;
model Test_BiomassSystem6

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=400000)
                annotation (Placement(transformation(extent={{94,44},{114,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{116,-62},{96,-42}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    Afull=0.000302563)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,0})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{-110,30},{-130,50}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07)
         annotation (Placement(transformation(extent={{68,-62},{48,-42}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07)
         annotation (Placement(transformation(extent={{40,44},{60,64}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.8085,
    Afull=0.00112141)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={10,2})));
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
        origin={-97,-8})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-156,-14},{-142,0}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=450000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
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
    annotation (Placement(transformation(extent={{-36,-62},{-56,-42}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{97,-52},{80,-52},{80,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{80,9},{80,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, dP.InFlow) annotation (Line(
      points={{80,-9},{80,-52},{67,-52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{59,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, dP.OutFlow) annotation (Line(
      points={{10,-7},{10,-52},{49,-52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-141.3,-7},{-134,-7},{-134,-8},{-117.8,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-111.6,40},{-100.12,40},{-100.12,16.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, valve1.InFlow) annotation (Line(
      points={{-50.6,60},{10,60},{10,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.InFlow, valve1.InFlow) annotation (Line(
      points={{41,54},{28,54},{28,60},{10,60},{10,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, pump.InFlow) annotation (Line(
      points={{10,-7},{10,-51.5},{-38.8,-51.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-100.64,-33},{-100.64,-44.6},{-51.6,-44.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -140},{160,120}}), graphics), Icon(coordinateSystem(extent={{-160,-140},
            {160,120}})));
end Test_BiomassSystem6;
