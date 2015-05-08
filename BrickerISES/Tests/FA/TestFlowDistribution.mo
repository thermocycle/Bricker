within BrickerISES.Tests.FA;
model TestFlowDistribution
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot2(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=0,
    T_0=573.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-88,-42})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=1,
    T_0=373.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-84,52})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.Therminol66, h=3e5)
    annotation (Placement(transformation(extent={{72,-2},{92,18}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot(redeclare package
      Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={38,12})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot(redeclare package
      Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={10,12})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot1(redeclare
      package Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-16,60})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot1(redeclare package
      Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-48,56})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot2(redeclare
      package Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-22,-32})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot2(redeclare package
      Medium = ThermoCycle.Media.Therminol66) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-54,-36})));
equation
  connect(sinkP1.flangeB, sensM_Tot.InFlow) annotation (Line(
      points={{73.6,8},{42,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot1.OutFlow, sourceMdot1.flangeB) annotation (Line(
      points={{-55,51.2},{-75,51.2},{-75,52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot1.InFlow, sensM_Tot1.OutFlow) annotation (Line(
      points={{-41,51.2},{-30.5,51.2},{-30.5,56},{-20,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot2.InFlow, sensM_Tot2.OutFlow) annotation (Line(
      points={{-47,-40.8},{-20.5,-40.8},{-20.5,-36},{-26,-36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot2.OutFlow, sourceMdot2.flangeB) annotation (Line(
      points={{-61,-40.8},{-70.5,-40.8},{-70.5,-42},{-79,-42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensM_Tot2.InFlow, sensM_Tot1.InFlow) annotation (Line(
      points={{-18,-36},{-16,-36},{-16,-38},{-6,-38},{-6,56},{-12,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot.OutFlow, sensM_Tot.OutFlow) annotation (Line(
      points={{17,7.2},{25.5,7.2},{25.5,8},{34,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot.InFlow, sensM_Tot1.InFlow) annotation (Line(
      points={{3,7.2},{-6,7.2},{-6,56},{-12,56}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestFlowDistribution;
