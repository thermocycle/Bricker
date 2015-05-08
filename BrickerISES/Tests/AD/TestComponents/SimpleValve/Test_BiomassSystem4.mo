within BrickerISES.Tests.AD.TestComponents.SimpleValve;
model Test_BiomassSystem4
//Internal
// Time	k
// 0	6.26675e-05
// 10000	6.26675e-05

// Out
// k	6.26959e-05	
// Slope	0
// Time	0	s

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{94,44},{114,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{116,-62},{96,-42}})));
 BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.307,
    CheckValve=true,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,0})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        450000) annotation (Placement(transformation(extent={{-90,-66},{-110,
            -46}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=9.4,
    p=450000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-106,44},{-86,64}})));
  ThermoCycle.Components.HeatFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,-58},{-66,-38}})));
Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=6.26675e-05)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,8})));

Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.1914,
    Afull=4.70219e-05)
                annotation (Placement(transformation(extent={{6,40},{26,60}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{97,-52},{60,-52},{60,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{60,9},{60,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{-63,-52.8},{-76.5,-52.8},{-76.5,-56},{-91.6,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, valve1.InFlow) annotation (Line(
      points={{-87,54},{-22,54},{-22,17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, valve1.OutFlow) annotation (Line(
      points={{60,-9},{60,-52},{-22,-52},{-22,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, valve1.OutFlow) annotation (Line(
      points={{-49,-52.8},{-22,-52.8},{-22,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.InFlow, valve2.InFlow) annotation (Line(
      points={{-22,17},{-22,50},{7,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow, sinkP.flangeB) annotation (Line(
      points={{25,50},{60,50},{60,54},{95.6,54}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,120}}), graphics), Icon(coordinateSystem(extent={{-120,-100},
            {120,120}})));
end Test_BiomassSystem4;
