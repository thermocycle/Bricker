within BrickerISES.Tests.AD.TestComponents.Layout_I;
model Test_SF

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=19,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-34,-28},{8,42}})));

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.5,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=423.85)
    annotation (Placement(transformation(extent={{-38,-74},{-18,-54}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000)
    annotation (Placement(transformation(extent={{18,70},{38,90}})));
  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-120,54},{-100,74}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=970)
    annotation (Placement(transformation(extent={{-120,-42},{-100,-22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,60},{-26,80}})));
equation
  connect(sourceMdot.flangeB, solarCollectorIncSchott.InFlow) annotation (
      Line(
      points={{-19,-64},{-8.8,-64},{-8.8,-28.6364}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-99,64},{-56,64},{-56,34},{-31.2,34},{-31.2,36.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-99,30},{-64,30},{-64,22.9091},{-31.6667,22.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-99,2},{-68,2},{-68,8.90909},{-31.6667,8.90909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-99,-32},{-56,-32},{-56,-4.13636},{-31.9,-4.13636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-97,-70},{-68,-70},{-68,-17.8182},{-31.6667,-17.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-9,65.2},{4,65.2},{4,50},{-6,50},{-6,41.3636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-23,65.2},{-32,65.2},{-32,88},{6,88},{6,80},{19.6,80}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF;
