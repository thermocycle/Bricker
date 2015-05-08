within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model Tank_V0
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=1,
    V_tank=1,
    Mdotnom=5.28,
    p_ext=450000,
    Tstart=523.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-314,192},{-290,216}})));
  Modelica.Blocks.Math.Gain Efficiency(k=0.85)
    annotation (Placement(transformation(extent={{-282,144},{-302,164}})));
  Modelica.Blocks.Sources.Constant const(k=300000)
    annotation (Placement(transformation(extent={{-242,144},{-262,164}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=5,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    pstart_f=150000,
    Tstart_inlet_f=503.15,
    Tstart_outlet_f=523.15) annotation (Placement(transformation(
        extent={{17,18},{-17,-18}},
        rotation=90,
        origin={-343,146})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    eta_em=1,
    eta_is=1,
    epsilon_v=1,
    M_dot_start=5,
    V_dot_max=0.0074,
    X_pp0=1,
    hstart=548005)
    annotation (Placement(transformation(extent={{-272,68},{-292,88}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SBM_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-228,200})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=1.974,
    rho_nom=5000,
    UseNom=false,
    h=0,
    A=5e3,
    k=2.69e7,
    DELTAp_0=20000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-270,184},{-250,204}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=250000) annotation (Placement(transformation(extent={{-202,186},
            {-182,206}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=150000,
    T_0=503.15)
    annotation (Placement(transformation(extent={{-234,96},{-214,116}})));

equation
  connect(const.y, Efficiency.u) annotation (Line(
      points={{-263,154},{-280,154}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Efficiency.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-303,154},{-304,154},{-304,154.84},{-329.5,154.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.inlet, pump.OutFlow) annotation (Line(
      points={{-336.16,128.66},{-336.16,85.4},{-287.6,85.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, openTank.InFlow) annotation (Line(
      points={{-337.24,163},{-337.24,180},{-338,180},{-338,193.92},{
          -313.76,193.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, dP.InFlow) annotation (Line(
      points={{-290.24,193.92},{-286,193.92},{-286,194},{-269,194}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Sens_SBM_SU.InFlow) annotation (Line(
      points={{-251,194},{-242,194},{-242,195.2},{-235,195.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SBM_SU.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-221,195.2},{-208.5,195.2},{-208.5,196},{-200.4,196}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-214.6,106},{-194,106},{-194,78.5},{-274.8,78.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
            -100},{100,220}}),      graphics), Icon(coordinateSystem(extent=
           {{-380,-100},{100,220}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Tank_V0;
