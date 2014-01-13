within Bricker.Tests.FA;
model TestSolarField
  Components.SolarField solarField(
    Mdotnom=1,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,

    Unom=1000,
    Ns=10,
    Np=2,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-30,-18},{10,22}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-88,-48},{-68,-28}})));
  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{6,72},{26,92}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-18,70},{2,90}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-88,72},{-68,92}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{46,24},{66,44}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(            redeclare
      package Medium =
        ThermoCycle.Media.Therminol66,
    Mdot_0=1,
    T_0=573.15)
    annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
equation
  connect(booleanStep.y, solarField.Defocusing) annotation (Line(
      points={{-67,-38},{-48,-38},{-48,-11},{-28,-11}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarField.v_wind, const3.y) annotation (Line(
      points={{-24.2,20.2},{-24.2,50.1},{-67,50.1},{-67,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField.Theta, Theta.y) annotation (Line(
      points={{-16.3,20.3},{-20.4,20.3},{-20.4,80},{-39,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarField.Tamb) annotation (Line(
      points={{3,80},{-4,80},{-4,20.3},{-9.5,20.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarField.DNI) annotation (Line(
      points={{27,82},{14,82},{14,20.4},{-2.4,20.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, solarField.InFlow) annotation (Line(
      points={{-57,4},{-44,4},{-44,4.4},{-29.2,4.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField.OutFlow, sinkP.flangeB) annotation (Line(
      points={{8.8,4.4},{27.4,4.4},{27.4,34},{47.6,34}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestSolarField;
