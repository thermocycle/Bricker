within Bricker.Tests.FA;
model SolarCollectorSoltiguaWallIAM

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
  Modelica.Blocks.Sources.Constant Theta(k=30)
    annotation (Placement(transformation(extent={{-98,34},{-78,54}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-98,62},{-78,82}})));

  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-98,-58},{-78,-38}})));
  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{-102,-24},{-82,-4}})));

  Components.SolarCollectorIncSoltiguaWallIAM solarCollectorIncSoltiguaWallIAM(
    Unom=1000,
    Mdotnom=0.5,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-24,-26},{2,18}})));
equation
  connect(solarCollectorIncSoltiguaWallIAM.v_wind, const3.y) annotation (Line(
      points={{-22.7,14.92},{-43.7,14.92},{-43.7,72},{-77,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Theta, Theta.y) annotation (Line(
      points={{-22.7,5.24},{-44.7,5.24},{-44.7,44},{-77,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Tamb, const.y) annotation (Line(
      points={{-22.2667,-4.88},{-44.6,-4.88},{-44.6,20},{-77,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.DNI, step.y) annotation (Line(
      points={{-22.2667,-14.56},{-46.6,-14.56},{-46.6,-14},{-81,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.Defocusing, booleanStep.y)
    annotation (Line(
      points={{-29.6333,-18.08},{-29.6333,-48},{-77,-48}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, solarCollectorIncSoltiguaWallIAM.InFlow)
    annotation (Line(
      points={{-53,-84},{-30,-84},{-30,-26},{-11,-26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSoltiguaWallIAM.OutFlow, sinkP.flangeB) annotation (
      Line(
      points={{-11,18.44},{10,18.44},{10,66},{23.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics),
    experiment(StopTime=500, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end SolarCollectorSoltiguaWallIAM;
