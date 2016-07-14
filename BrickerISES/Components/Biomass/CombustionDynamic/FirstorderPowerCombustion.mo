within BrickerISES.Components.Biomass.CombustionDynamic;
model FirstorderPowerCombustion
  extends PartialCombustionDynamic;

 final parameter Real  k=tStartup / 3;
  Modelica.Blocks.Continuous.FirstOrder firstOrderCombustionDynamic(
    T=k,
    initType=CombustionInitialization,
    k=QcombustionNominal,
    y_start=QcombustionStart)
         annotation (Placement(transformation(extent={{24,-32},{-40,30}})));
equation
  connect(firstOrderCombustionDynamic.y, Qcombustion) annotation (Line(
      points={{-43.2,-1},{-65.6,-1},{-65.6,-2},{-105,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Modulation, firstOrderCombustionDynamic.u) annotation (Line(
      points={{106,0},{86,0},{86,-2},{30.4,-2},{30.4,-1}},
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
          textString="First Order")}));
end FirstorderPowerCombustion;
