within BrickerISES.Tests.AD.System.Layout_4;
model BiomassSystem
  Components.Biomass.SimpleBiomassSystemCombustionDynamic_AD
    simpleBiomassSystemCombustionDynamic_AD(
    redeclare model combustionDynamic =
        Bricker.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    Qcombustion_Min=5e5,
    BoilerEfficiency=0.85,
    V_dot_max=0.007183673,
    Qcombustion_Nominal=5e5,
    Qcombustion_start=5e5,
    pstart_f=150000,
    Tstart_inlet_f=488.15,
    Tstart_outlet_f=508.15)
    annotation (Placement(transformation(extent={{-72,-6},{-18,60}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    p=150000,
    T_0=489.53)
    annotation (Placement(transformation(extent={{-96,-70},{-76,-50}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-102,64},{-82,84}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Components.ORC_Unit oRC_Unit(p_start=150000)
    annotation (Placement(transformation(extent={{46,18},{80,62}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=150000)
    annotation (Placement(transformation(extent={{22,-46},{2,-26}})));
equation
  connect(sourceMdot.flangeB, simpleBiomassSystemCombustionDynamic_AD.inlet)
    annotation (Line(
      points={{-77,-60},{-36,-60},{-36,-8},{-18,-8},{-18,3.9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassSystemCombustionDynamic_AD.CombustionPowerCommand)
    annotation (Line(
      points={{-81,74},{-60.12,74},{-60.12,58.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, simpleBiomassSystemCombustionDynamic_AD.PumpFlowfraction)
    annotation (Line(
      points={{-39,110},{-39.06,110},{-39.06,58.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystemCombustionDynamic_AD.outlet, oRC_Unit.InFlow)
    annotation (Line(
      points={{-16.92,48.78},{20,48.78},{20,59.4922},{46.6182,59.4922}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRC_Unit.OutFlow, sinkP.flangeB) annotation (Line(
      points={{46.3091,22.5596},{38,22.5596},{38,-36},{20.4,-36}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end BiomassSystem;
