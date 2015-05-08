within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model Tank_V0_03
  Modelica.Blocks.Math.Gain Efficiency(k=0.7)
    annotation (Placement(transformation(extent={{-282,144},{-302,164}})));
  Modelica.Blocks.Sources.Constant const(k=200000)
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
        extent={{-15,-15},{15,15}},
        rotation=0,
        origin={-139,207})));
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
    annotation (Placement(transformation(extent={{-284,190},{-264,210}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-206,72},{-226,92}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-232,210},{-212,190}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.5857,
    UseNom=false,
    Afull=0.0003,
    DELTAp_0=150000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-218,120},{-198,140}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    p=150000,
    T_0=489.15)
    annotation (Placement(transformation(extent={{-134,70},{-154,90}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=1,
    V_tank=1,
    Mdotnom=5.28,
    p_ext=450000,
    Tstart=489.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-330,198},{-306,222}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    h_0=556000,
    pstart=150000)
    annotation (Placement(transformation(extent={{-90,180},{-44,226}})));

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
  connect(TJ1.port_3, valve.InFlow) annotation (Line(
      points={{-222,190},{-222,166},{-230,166},{-230,130},{-217,130}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, TJ2.port_3) annotation (Line(
      points={{-199,130},{-194,130},{-194,110},{-216,110},{-216,92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_2, pump.InFlow) annotation (Line(
      points={{-226,82},{-236,82},{-236,84},{-266,84},{-266,78.5},{-274.8,
          78.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, TJ1.port_1) annotation (Line(
      points={{-265,200},{-232,200}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ1.port_2, Sens_SBM_SU.InFlow) annotation (Line(
      points={{-212,200},{-178,200},{-178,199.8},{-149.5,199.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ2.port_1, sourceMdot.flangeB) annotation (Line(
      points={{-206,82},{-192,82},{-192,80},{-153,80}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, openTank.InFlow) annotation (Line(
      points={{-337.24,163},{-337.24,199.92},{-329.76,199.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, dP.InFlow) annotation (Line(
      points={{-306.24,199.92},{-295.12,199.92},{-295.12,200},{-283,200}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Sens_SBM_SU.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{-128.5,199.8},{-111.5,199.8},{-111.5,203},{-89.54,203}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
            -100},{100,220}}),      graphics), Icon(coordinateSystem(extent=
           {{-380,-100},{100,220}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Tank_V0_03;
