within BrickerISES.Components.Biomass.CombustionDynamic;
model CostantPowerCombustion
  extends PartialCombustionDynamic;

  Modelica.Blocks.Math.Gain gain(k=QcombustionNominal)
    annotation (Placement(transformation(extent={{26,-26},{-34,30}})));
equation
  connect(Modulation, gain.u) annotation (Line(
      points={{106,0},{73,0},{73,2},{32,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, Qcombustion) annotation (Line(
      points={{-37,2},{-72,2},{-72,-2},{-105,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Text(
          extent={{-62,-90},{60,-106}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Forward,
          textString="Linear")}));
end CostantPowerCombustion;
