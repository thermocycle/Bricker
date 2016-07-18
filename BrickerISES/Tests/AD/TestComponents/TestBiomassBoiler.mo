within BrickerISES.Tests.AD.TestComponents;
model TestBiomassBoiler

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=498.15)
    annotation (Placement(transformation(extent={{-76,-94},{-56,-74}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000) annotation (Placement(transformation(extent={{12,48},{32,68}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Components.Biomass.Flow1DIncHeatInput_L BM(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=9.4,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    Unom=1000,
    QcombustionStart=150e3,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
    tStartup=20*60,
    M_wall=200,
    Vint=2,
    QcombustionMin=10e3,
    QcombustionNominal=500e3,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=498.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=503.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-5,2})));
equation
  connect(sourceMdot.flangeB, BM.inlet_fl2) annotation (Line(
      points={{-57,-84},{-32,-84},{-32,-86},{-9.34,-86},{-9.34,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(BM.outlet_fl2, sinkP.flangeB) annotation (Line(
      points={{-8.72,25.52},{-8.72,58},{13.6,58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, BM.u) annotation (Line(
      points={{-79,30},{-72,30},{-72,28},{-64,28},{-64,2},{-29.8,2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3600),
    __Dymola_experimentSetupOutput);
end TestBiomassBoiler;
