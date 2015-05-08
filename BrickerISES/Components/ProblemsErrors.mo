within BrickerISES.Components;
model ProblemsErrors

  // Solar Collector with wall is not working with the IdealHeatTransfer

  // Some problems with pressure when Pump+Solar Collector

  // Initialization problems in biomass boiler

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Ellipse(
          extent={{-76,70},{82,-84}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid), Text(
          extent={{60,-100},{-58,90}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="!")}));
end ProblemsErrors;
