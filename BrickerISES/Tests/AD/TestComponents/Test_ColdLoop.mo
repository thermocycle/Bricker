within BrickerISES.Tests.AD.TestComponents;
model Test_ColdLoop

  Components.WaterSide.WaterCircuit waterCircuit(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-34,-12},{16,44}})));
  Modelica.Blocks.Sources.Constant Q_HX(k=0)
    annotation (Placement(transformation(extent={{-88,32},{-74,46}})));
  Modelica.Blocks.Sources.Constant Q_heating(k=0)
    annotation (Placement(transformation(extent={{66,34},{52,48}})));
  Modelica.Blocks.Sources.Constant Q_ORC(k=387e3)
    annotation (Placement(transformation(extent={{-86,-10},{-72,4}})));
  Modelica.Blocks.Sources.Constant Q_cooling(k=373e3)
    annotation (Placement(transformation(extent={{70,-14},{56,0}})));
equation
  connect(Q_HX.y, waterCircuit.Q_HX) annotation (Line(
      points={{-73.3,39},{-58,39},{-58,32.24},{-36.5,32.24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_ORC.y, waterCircuit.Q_ORC) annotation (Line(
      points={{-71.3,-3},{-54.65,-3},{-54.65,-0.8},{-36.5,-0.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_heating.y, waterCircuit.Q_Heating) annotation (Line(
      points={{51.3,41},{34,41},{34,32.8},{18,32.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_cooling.y, waterCircuit.Q_Cooling) annotation (Line(
      points={{55.3,-7},{44,-7},{44,-6.4},{18.5,-6.4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Test_ColdLoop;
