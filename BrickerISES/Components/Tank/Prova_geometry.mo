within BrickerISES.Components.Tank;
model Prova_geometry
//( /*redeclare*/ replaceable /*parameter */ CollectorGeometry geometry)
 replaceable parameter
    ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Schott_SopoNova.BaseGeometry
                                                                                        CollectorGeometry
constrainedby
    ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Schott_SopoNova.BaseGeometry
                                                                                                        annotation (choicesAllMatching=true);

  ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.AbsSoltigua absSoltigua
    annotation (Placement(transformation(extent={{-40,-10},{4,36}})));
public
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-72,-76},{-64,-68}})));
  Modelica.Blocks.Math.BooleanToInteger booleanToInteger
    annotation (Placement(transformation(extent={{-50,-60},{-40,-50}})));
  Modelica.Blocks.Interfaces.RealInput v_wind
    annotation (Placement(transformation(extent={{-126,58},{-86,98}}),
        iconTransformation(extent={{-72,60},{-32,100}})));
  Modelica.Blocks.Interfaces.RealInput Theta
    annotation (Placement(transformation(extent={{-126,24},{-86,64}}),
        iconTransformation(extent={{-72,10},{-32,50}})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-126,-18},{-86,22}}),
        iconTransformation(extent={{-72,-38},{-32,2}})));
  Modelica.Blocks.Interfaces.RealInput DNI
    annotation (Placement(transformation(extent={{-126,-56},{-86,-16}}),
        iconTransformation(extent={{-72,-94},{-32,-54}})));
  Modelica.Blocks.Interfaces.BooleanInput Defocusing
    annotation (Placement(transformation(extent={{-128,-92},{-88,-52}}),
        iconTransformation(extent={{-106,-84},{-66,-44}})));
  Source_Q source_Q(A=10)
    annotation (Placement(transformation(extent={{62,24},{82,44}})));
  Modelica.Blocks.Sources.Constant const(k=10)
    annotation (Placement(transformation(extent={{28,66},{48,86}})));
equation
  connect(v_wind, absSoltigua.v_wind) annotation (Line(
      points={{-106,78},{-68,78},{-68,32.55},{-37.58,32.55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta, absSoltigua.Theta) annotation (Line(
      points={{-106,44},{-37.58,23.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb, absSoltigua.Tamb) annotation (Line(
      points={{-106,2},{-86,2},{-86,4},{-64,4},{-64,14.84},{-37.8,14.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI, absSoltigua.DNI) annotation (Line(
      points={{-106,-36},{-66,-36},{-66,-4},{-52,-4},{-52,5.87},{-37.14,5.87}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Defocusing,not1. u) annotation (Line(
      points={{-108,-72},{-72.8,-72}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y,booleanToInteger. u) annotation (Line(
      points={{-63.6,-72},{-58,-72},{-58,-55},{-51,-55}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanToInteger.y, absSoltigua.Focusing) annotation (Line(
      points={{-39.5,-55},{-30,-55},{-30,-26},{-50,-26},{-50,-6.78},{-40,-6.78}},
      color={255,127,0},
      smooth=Smooth.None));

  connect(source_Q.thermalPort, absSoltigua.wall_int) annotation (Line(
      points={{71.9,29.9},{71.9,13},{1.8,13}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(const.y, source_Q.Q_tot) annotation (Line(
      points={{49,76},{72,76},{72,38}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end Prova_geometry;
