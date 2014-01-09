within Bricker.Tests.FA;
model SolarCollectorSoltiguaWall

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(Mdot_0=0.5, redeclare
      package Medium =
        ThermoCycle.Media.Therminol66,
    T_0=573.15)
    annotation (Placement(transformation(extent={{-72,-94},{-52,-74}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{22,56},{42,76}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-98,10},{-78,30}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-98,34},{-78,54}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-98,62},{-78,82}})));
  Components.SolarCollectorIncSoltiguaWall solarCollectorIncSoltiguaWall(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom=1000,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence,
    Mdotnom=0.5,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-28,-16},{4,38}})));

  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-98,-58},{-78,-38}})));
  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{-102,-24},{-82,-4}})));

equation
  connect(solarCollectorIncSoltiguaWall.v_wind, const3.y) annotation (Line(
      points={{-26.4,34.22},{-54.7,34.22},{-54.7,72},{-77,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSoltiguaWall.Theta) annotation (Line(
      points={{-77,44},{-56,44},{-56,22.34},{-26.4,22.34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSoltiguaWall.Tamb) annotation (Line(
      points={{-77,20},{-56,20},{-56,9.92},{-25.8667,9.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, solarCollectorIncSoltiguaWall.InFlow) annotation (
      Line(
      points={{-53,-84},{-30,-84},{-30,-16},{-12,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWall.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-12,38.54},{6,38.54},{6,66},{23.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanStep.y, solarCollectorIncSoltiguaWall.Defocusing) annotation (Line(
      points={{-77,-48},{-60,-48},{-60,-6.28},{-34.9333,-6.28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(step.y, solarCollectorIncSoltiguaWall.DNI) annotation (Line(
      points={{-81,-14},{-78,-14},{-78,-1.96},{-25.8667,-1.96}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics),
    experiment(StopTime=500, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end SolarCollectorSoltiguaWall;
