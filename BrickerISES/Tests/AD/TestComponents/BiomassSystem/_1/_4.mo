within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model _4
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
    annotation (Placement(transformation(extent={{-70,72},{-50,52}})));
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
    V_dot_max=0.0264514,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-112,-60},{-132,-40}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=3.74084e+06)
         annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={-128,36})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06014e+07,
    DELTAp_start=50000,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{4,-32},{-16,-12}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-62,16},{-42,36}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-24,64},{-4,84}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-78,-56},{-98,-36}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-114,50},{-94,70}})));
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
  connect(dP1.InFlow, teeJunctionIdeal2.port_2) annotation (Line(
      points={{3,-22},{6,-22},{6,-24},{26,-24},{26,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, teeJunctionIdeal4.port_1) annotation (Line(
      points={{-15,-22},{-30,-22},{-30,-18},{-46,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal3.port_3, sensMdot.InFlow) annotation (Line(
      points={{-60,52},{-60,40},{-70,40},{-70,22},{-56,22}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensMdot.OutFlow, teeJunctionIdeal4.port_3) annotation (Line(
      points={{-48,22},{-44,22},{-44,20},{-30,20},{-30,2},{-54,2},{-54,-8},{-56,
          -8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal3.port_2, sensMdot1.InFlow) annotation (Line(
      points={{-50,62},{-38,62},{-38,60},{-28,60},{-28,70},{-18,70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensMdot1.OutFlow, teeJunctionIdeal1.port_1) annotation (Line(
      points={{-10,70},{4,70},{4,74},{24,74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal4.port_2, sensTp.InFlow) annotation (Line(
      points={{-66,-18},{-74,-18},{-74,-50.8},{-81,-50.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, sensTp.OutFlow) annotation (Line(
      points={{-114.8,-49.5},{-95,-49.5},{-95,-50.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, flow1DimInc.InFlow) annotation (Line(
      points={{-127.6,-42.6},{-127.6,-30},{-128,-30},{-128,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-128,45},{-128,56},{-111,56},{-111,55.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, teeJunctionIdeal3.port_1) annotation (Line(
      points={{-97,55.2},{-82,55.2},{-82,62},{-70,62}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-180,
            -120},{180,120}})));
end _4;
