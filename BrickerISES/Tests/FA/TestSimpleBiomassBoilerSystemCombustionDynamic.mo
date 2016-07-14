within BrickerISES.Tests.FA;
model TestSimpleBiomassBoilerSystemCombustionDynamic

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Mdot_0=0.1,
    T_0=293.15)
    annotation (Placement(transformation(extent={{66,-28},{46,-8}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-36,60},{-16,80}})));
  Modelica.Blocks.Sources.Constant const2(k=1)
    annotation (Placement(transformation(extent={{-98,32},{-78,52}})));
  BrickerISES.Components.Biomass.SimpleBiomassSystemCombustionDynamic simpleBiomassSystem(
    OversizePump=1,
    redeclare model combustionDynamic =
        Bricker.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    A_f=50,
    A_b=50,
    V=4,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    pstart_f=200000,
    Tstart=323.15)
    annotation (Placement(transformation(extent={{-42,-42},{12,14}})));
equation
  connect(simpleBiomassSystem.inlet, sourceMdot.flangeB) annotation (Line(
      points={{12,-33.6},{20,-33.6},{20,-18},{47,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.PumpNominalFlowFraction, const.y) annotation (
      Line(
      points={{-9.06,12.6},{-9.06,40.3},{-15,40.3},{-15,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, simpleBiomassSystem.CombustionPowerCommand) annotation (
      Line(
      points={{-77,42},{-54,42},{-54,12.6},{-30.12,12.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoilerSystemCombustionDynamic;
