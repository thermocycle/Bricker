within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model _1
// V_dot_max	0.0216131	m3/s
// Slope	0
// Time	0	s

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=400000)
    annotation (Placement(transformation(extent={{78,64},{98,84}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        450000)
    annotation (Placement(transformation(extent={{-124,-26},{-144,-6}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=9.4,
    p=100000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-140,54},{-120,74}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=100000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{92,-36},{72,-16}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{46,-32},{26,-12}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{24,84},{44,64}})));
Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.307,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={36,26})));

  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-80,70},{-60,50}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-58,-26},{-78,-6}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0216131,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-60,12},{-40,32}})));
equation
  connect(sourceMdot2.flangeB, teeJunctionIdeal2.port_1) annotation (Line(
      points={{73,-26},{68,-26},{68,-22},{46,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal1.port_2, sinkP.flangeB) annotation (Line(
      points={{44,74},{79.6,74}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valve2.InFlow, teeJunctionIdeal2.port_3) annotation (Line(
      points={{36,17},{36,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow, teeJunctionIdeal1.port_3) annotation (Line(
      points={{36,35},{36,50},{34,50},{34,64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, teeJunctionIdeal3.port_1) annotation (Line(
      points={{-121,64},{-104,64},{-104,60},{-80,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal3.port_2, teeJunctionIdeal1.port_1) annotation (Line(
      points={{-60,60},{-44,60},{-44,78},{24,78},{24,74}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal4.port_1, teeJunctionIdeal2.port_2) annotation (Line(
      points={{-58,-16},{-26,-16},{-26,-22},{26,-22}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal4.port_2, sinkP1.flangeB) annotation (Line(
      points={{-78,-16},{-125.6,-16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal3.port_3, pump.InFlow) annotation (Line(
      points={{-70,50},{-72,50},{-72,22.5},{-57.2,22.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, teeJunctionIdeal4.port_3) annotation (Line(
      points={{-44.4,29.4},{-24,29.4},{-24,0},{-68,0},{-68,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-160,-120},{180,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{
            -160,-120},{180,120}})));
end _1;
