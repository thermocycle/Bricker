within BrickerISES.Tests.AD.System.Layout_1;
model Test_BiomassSystem8New_1

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{90,78},{110,98}})));
  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.307,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,28})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{68,-34},{48,-14}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{40,80},{60,100}})));
 BrickerISES.Components.Valve_lin valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={10,30})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    QcombustionStart=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.SteadyState,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-97,20})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-154,14},{-140,28}})));
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
    annotation (Placement(transformation(extent={{-36,-34},{-56,-14}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0070114,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{140,-42},{120,-22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{182,-58},{162,-38}})));
equation
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{80,37},{80,88},{91.6,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, dP.InFlow) annotation (Line(
      points={{80,19},{80,-24},{67,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{59,90},{76,90},{76,88},{91.6,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, dP.OutFlow) annotation (Line(
      points={{10,21},{10,-24},{49,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-139.3,21},{-134,21},{-134,20},{-117.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP1.InFlow, valve1.InFlow) annotation (Line(
      points={{41,90},{10,90},{10,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, pump.InFlow) annotation (Line(
      points={{10,21},{10,-23.5},{-38.8,-23.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-100.64,-5},{-100.64,-16.6},{-51.6,-16.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, valve1.InFlow) annotation (Line(
      points={{-100.12,44.5},{-98,44.5},{-98,90},{10,90},{10,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.InFlow, pump1.OutFlow) annotation (Line(
      points={{67,-24},{104,-24},{104,-24.6},{124.4,-24.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, sourceP.flange) annotation (Line(
      points={{137.2,-31.5},{150,-31.5},{150,-48},{162.6,-48}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -160},{200,120}}), graphics), Icon(coordinateSystem(extent={{-160,
            -160},{200,120}})));
end Test_BiomassSystem8New_1;
