within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_Chiller
  Components.Chiller.Chiller_v1 chiller_v1_1(redeclare package Medium =
        ThermoCycle.Media.Water, CpConst=false)
    annotation (Placement(transformation(extent={{-16,-8},{36,38}})));
  Modelica.Blocks.Sources.Constant const(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-88,44},{-68,64}})));
  Modelica.Blocks.Sources.Constant const1(k=7.96)
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Blocks.Sources.Constant const2(k=250000)
    annotation (Placement(transformation(extent={{54,52},{74,72}})));
equation
  connect(const.y, chiller_v1_1.Tsu) annotation (Line(
      points={{-67,54},{-52,54},{-52,33.4},{-17.56,33.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, chiller_v1_1.mdotsu) annotation (Line(
      points={{-65,18},{-48,18},{-48,20},{-38,20},{-38,21.44},{-17.56,21.44}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, chiller_v1_1.Q_td) annotation (Line(
      points={{75,62},{88,62},{88,23.74},{38.08,23.74}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Test_Chiller;
