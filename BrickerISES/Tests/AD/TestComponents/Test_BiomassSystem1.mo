within BrickerISES.Tests.AD.TestComponents;
model Test_BiomassSystem1

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=400000)
                annotation (Placement(transformation(extent={{72,44},{92,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{100,-62},{80,-42}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    Afull=0.000302563)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,6})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=450000)
                annotation (Placement(transformation(extent={{-64,-62},{-84,-42}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{81,-52},{-12,-52},{-12,-3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-12,15},{-12,54},{73.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, valve.InFlow) annotation (Line(
      points={{-65.6,-52},{-12,-52},{-12,-3}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,120}}), graphics), Icon(coordinateSystem(extent={{-120,-100},
            {120,120}})));
end Test_BiomassSystem1;
