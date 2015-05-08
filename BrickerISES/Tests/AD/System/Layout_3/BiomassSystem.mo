within BrickerISES.Tests.AD.System.Layout_3;
model BiomassSystem
  Components.Biomass.SimpleBiomassSystemCombustionDynamic_AD
    simpleBiomassSystemCombustionDynamic_AD(
    redeclare model combustionDynamic =
        Bricker.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    Mdotnom_f=11,
    V_dot_max=0.0166,
    BoilerEfficiency=0.9,
    Qcombustion_Nominal=5e5,
    Qcombustion_Min=5e5,
    Qcombustion_start=5e5,
    pstart_f=150000,
    Tstart_inlet_f=461.15,
    Tstart_outlet_f=473.15)
    annotation (Placement(transformation(extent={{-36,-4},{18,62}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.15,
    p=150000,
    T_0=463.15)
    annotation (Placement(transformation(extent={{-82,-40},{-62,-20}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=610851,
    p0=150000)
    annotation (Placement(transformation(extent={{54,42},{74,62}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
equation
  connect(sourceMdot.flangeB, simpleBiomassSystemCombustionDynamic_AD.inlet)
    annotation (Line(
      points={{-63,-30},{50,-30},{50,6},{18,6},{18,5.9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassSystemCombustionDynamic_AD.CombustionPowerCommand)
    annotation (Line(
      points={{-59,70},{-24.12,70},{-24.12,60.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, simpleBiomassSystemCombustionDynamic_AD.PumpFlowfraction)
    annotation (Line(
      points={{-39,110},{-3.06,110},{-3.06,60.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystemCombustionDynamic_AD.outlet, sinkP.flangeB)
    annotation (Line(
      points={{19.08,50.78},{55.6,50.78},{55.6,52}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end BiomassSystem;
