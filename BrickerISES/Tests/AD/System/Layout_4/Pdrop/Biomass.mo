within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model Biomass
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Unom_f=2000,
    pstart_f=450000,
    Tstart_inlet_f=493.15,
    Tstart_outlet_f=523.15)
    annotation (Placement(transformation(extent={{10,-16},{-34,20}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=5.28,
    p=450000,
    T_0=489.15)
    annotation (Placement(transformation(extent={{-88,0},{-68,20}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=450000)
    annotation (Placement(transformation(extent={{62,-6},{82,14}})));
  Modelica.Blocks.Sources.Constant const(k=400000)
    annotation (Placement(transformation(extent={{-54,38},{-34,58}})));
equation
  connect(sourceMdot.flangeB, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-69,10},{-52,10},{-52,8.84},{-34.44,8.84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, sinkP.flangeB) annotation (Line(
      points={{10,7.76},{52,7.76},{52,4},{63.6,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-33,48},{-24,48},{-24,46},{-0.56,46},{-0.56,15.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end Biomass;
