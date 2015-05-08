within BrickerISES.Components.Biomass.CombustionDynamic;
model LinearPowerCombustion
  extends PartialCombustionDynamic;

 final parameter Real k = QcombustionNominal / tStartup;
  Modelica.Blocks.Continuous.LimIntegrator LinearPowerCombustionModulation(
    outMin=0,
    k=k,
    limitsAtInit=false,
    initType=CombustionInitialization,
    outMax=QcombustionNominal,
    y_start=QcombustionStart)
              annotation (Placement(transformation(extent={{36,-42},{-46,40}})));
equation
  connect(LinearPowerCombustionModulation.y, Qcombustion) annotation (Line(
      points={{-50.1,-1},{-79.05,-1},{-79.05,-2},{-105,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Modulation, LinearPowerCombustionModulation.u) annotation (Line(
      points={{106,0},{74,0},{74,-1},{44.2,-1}},
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
end LinearPowerCombustion;
