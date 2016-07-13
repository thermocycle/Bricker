within BrickerISES.Components;
model Source_Q_L "source of fixed Power Q [W]"

parameter Modelica.SIunits.Area  A;
Modelica.SIunits.HeatFlux phiCell;

  ThermoCycle.Interfaces.HeatTransfer.ThermalPortL thermalPort
    annotation (Placement(transformation(extent={{-10,-52},{10,-32}}),
        iconTransformation(extent={{-42,-52},{40,-30}})));
  Modelica.Blocks.Interfaces.RealInput Q_tot annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={-44,46}), iconTransformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,40})));
equation

 phiCell * A  = - Q_tot; //cambio sengo, per Q_tot > 0 ho potenza entrante
 //nel caso di usarla come variabile

  thermalPort.phi = phiCell;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                   graphics={Rectangle(
          extent={{-80,20},{80,-30}},
          lineColor={175,175,175},
          fillPattern=FillPattern.Forward,
          fillColor={135,135,135}), Text(
          extent={{-58,96},{76,60}},
          lineColor={0,0,255},
          textString="Q [W]")}),      Diagram(graphics));
end Source_Q_L;
