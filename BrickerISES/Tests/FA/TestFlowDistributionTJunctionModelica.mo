within BrickerISES.Tests.FA;
model TestFlowDistributionTJunctionModelica
replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66;
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot2(
    redeclare package Medium = Medium,
    Mdot_0=1,
    T_0=573.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-114,-42})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = Medium,
    Mdot_0=0.5,
    T_0=373.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-84,52})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = Medium, h=4e5)
    annotation (Placement(transformation(extent={{86,-4},{106,16}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot(redeclare package
      Medium = Medium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={68,10})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot(redeclare package
      Medium = Medium) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={20,-32})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot1(redeclare
      package Medium = Medium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-16,60})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot1(redeclare package
      Medium = Medium) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-48,56})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_Tot2(redeclare
      package Medium = Medium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-48,-32})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_Tot2(redeclare package
      Medium = Medium) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-36})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal(redeclare package
      Medium = Medium)
    annotation (Placement(transformation(extent={{-34,-10},{0,22}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_TotInverted(redeclare
      package Medium = Medium) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={44,-32})));
equation
  connect(sinkP1.flangeB, sensM_Tot.InFlow) annotation (Line(
      points={{87.6,6},{72,6}},
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
      points={{-73,-40.8},{-58.5,-40.8},{-58.5,-36},{-52,-36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot2.OutFlow, sourceMdot2.flangeB) annotation (Line(
      points={{-87,-40.8},{-96.5,-40.8},{-96.5,-42},{-105,-42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(teeJunctionIdeal.port_3, sensM_Tot1.InFlow) annotation (Line(
      points={{-17,22},{-10,22},{-10,56},{-12,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensM_Tot2.InFlow, teeJunctionIdeal.port_1) annotation (Line(
      points={{-44,-36},{-36,-36},{-36,6},{-34,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot.InFlow, sensTp_TotInverted.InFlow) annotation (Line(
      points={{27,-36.8},{37,-36.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_TotInverted.OutFlow, sensM_Tot.OutFlow) annotation (Line(
      points={{51,-36.8},{57.5,-36.8},{57.5,6},{64,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_Tot.OutFlow, teeJunctionIdeal.port_2) annotation (Line(
      points={{13,-36.8},{6.5,-36.8},{6.5,6},{0,6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{8,-48},{60,-58}},
          lineColor={0,0,255},
          textString="Inverted Sensors")}));
end TestFlowDistributionTJunctionModelica;
