within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model BiomassSimplifiedDP

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=9.4,
    p=100000,
    T_0=523.15)
    annotation (Placement(transformation(extent={{-80,32},{-60,52}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000)
    annotation (Placement(transformation(extent={{52,20},{72,40}})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-60,80},{-50,90}})));
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
    A=40,
    pstart=450000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15)
    annotation (Placement(transformation(extent={{-20,24},{4,48}})));

  ThermoCycle.Components.HeatFlow.Sources.HeatSource heatSource(
    N=10,
    HeatFlow=true,
    A=40) annotation (Placement(transformation(extent={{-20,54},{0,74}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=3.74084e+06)
         annotation (Placement(transformation(extent={{12,24},{32,44}})));
equation
  connect(sourceMdot1.flangeB, flow1DimInc.InFlow) annotation (Line(
      points={{-61,42},{-44,42},{-44,36},{-18,36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, heatSource.Phi) annotation (Line(
      points={{-49.5,85},{-10,85},{-10,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatSource.thermalPort, flow1DimInc.Wall_int) annotation (Line(
      points={{-10.1,59.9},{-10.1,52},{-8,52},{-8,41}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(flow1DimInc.OutFlow, dP.InFlow) annotation (Line(
      points={{2,36.1},{6,36.1},{6,34},{13,34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, sinkP.flangeB) annotation (Line(
      points={{31,34},{38,34},{38,30},{53.6,30}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end BiomassSimplifiedDP;
