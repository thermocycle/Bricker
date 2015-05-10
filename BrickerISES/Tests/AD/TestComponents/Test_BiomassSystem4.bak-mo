within BrickerISES.Tests.AD.TestComponents;
model Test_BiomassSystem4

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=400000)
                annotation (Placement(transformation(extent={{94,44},{114,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{116,-62},{96,-42}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    Afull=0.000302563)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,0})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{-88,-62},{-108,
            -42}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07)
         annotation (Placement(transformation(extent={{18,-62},{-2,-42}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=9.4,
    p=450000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-92,44},{-72,64}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07)
         annotation (Placement(transformation(extent={{2,44},{22,64}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.8085,
    Afull=0.00112141)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,0})));
  ThermoCycle.Components.HeatFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-52,-58},{-72,-38}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{97,-52},{60,-52},{60,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{60,9},{60,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, dP.InFlow) annotation (Line(
      points={{60,-9},{60,-52},{17,-52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, dP1.InFlow) annotation (Line(
      points={{-73,54},{3,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{21,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, valve1.InFlow) annotation (Line(
      points={{-73,54},{-40,54},{-40,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-40,-9},{-40,-52.8},{-55,-52.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{-69,-52.8},{-76.5,-52.8},{-76.5,-52},{-89.6,-52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-1,-52},{-40,-52},{-40,-52.8},{-55,-52.8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,120}}), graphics), Icon(coordinateSystem(extent={{-120,-100},
            {120,120}})));
end Test_BiomassSystem4;
