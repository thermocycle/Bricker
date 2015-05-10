within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model _3
// V_dot_max	0.0216131	m3/s
// Slope	0
// Time	0	s

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000)
    annotation (Placement(transformation(extent={{78,64},{98,84}})));
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
    annotation (Placement(transformation(extent={{-66,72},{-46,52}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,-28},{-66,-8}})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-171,-17})));
  ThermoCycle.Components.HeatFlow.Sources.HeatSource heatSource(
    N=10,
    HeatFlow=true,
    A=50) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-154,4})));
  ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc flow1DimInc(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=10,
    V=0.04,
    Mdotnom=9.4,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model Flow1DimIncHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Unom=500,
    A=50,
    pstart=450000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15)
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-128,4})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.026732,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-118,-40},{-98,-20}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=3.74084e+06)
         annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={-128,36})));
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
  connect(teeJunctionIdeal3.port_2, teeJunctionIdeal1.port_1) annotation (Line(
      points={{-46,62},{-44,62},{-44,78},{24,78},{24,74}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal4.port_1, teeJunctionIdeal2.port_2) annotation (Line(
      points={{-46,-18},{-26,-18},{-26,-22},{26,-22}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const.y, heatSource.Phi) annotation (Line(
      points={{-171,-11.5},{-171,4},{-158,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatSource.thermalPort, flow1DimInc.Wall_int) annotation (Line(
      points={{-149.9,3.9},{-140.95,3.9},{-140.95,4},{-133,4}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(flow1DimInc.OutFlow, dP.InFlow) annotation (Line(
      points={{-128.1,14},{-128.1,18},{-128,18},{-128,27}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, teeJunctionIdeal3.port_1) annotation (Line(
      points={{-128,45},{-130,45},{-130,54},{-96,54},{-96,62},{-66,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, teeJunctionIdeal4.port_2) annotation (Line(
      points={{-115.2,-29.5},{-120,-29.5},{-120,-40},{-86,-40},{-86,-18},{-66,
          -18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, flow1DimInc.InFlow) annotation (Line(
      points={{-102.4,-22.6},{-96,-22.6},{-96,-2},{-114,-2},{-114,-10},{-128,
          -10},{-128,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal3.port_3, teeJunctionIdeal4.port_3) annotation (Line(
      points={{-56,52},{-56,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-180,
            -120},{180,120}})));
end _3;
