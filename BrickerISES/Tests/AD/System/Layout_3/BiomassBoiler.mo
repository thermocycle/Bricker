within BrickerISES.Tests.AD.System.Layout_3;
model BiomassBoiler
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=11.66,
    p=150000,
    T_0=463.15)
    annotation (Placement(transformation(extent={{-82,-40},{-62,-20}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       150000)
    annotation (Placement(transformation(extent={{54,42},{74,62}})));
  Modelica.Blocks.Sources.Constant const(k=400000)
    annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Tstart_inlet_f=463.15,
    Tstart_outlet_f=533.15)
    annotation (Placement(transformation(extent={{-46,4},{-26,24}})));
equation
  connect(sourceMdot.flangeB, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-63,-30},{-36,-30},{-36,-28},{-4,-28},{-4,17.8},{-25.8,17.8}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(simpleBiomassBoiler.outlet, sinkP.flangeB) annotation (Line(
      points={{-46,17.2},{-54,17.2},{-54,20},{-58,20},{-58,52},{55.6,52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-75,82},{-58,82},{-58,74},{-41.2,74},{-41.2,21.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end BiomassBoiler;
