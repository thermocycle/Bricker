within BrickerISES.Components;
model Source_Q "source of fixed Power Q [W]"
parameter Integer N=2 "Number of nodes";

//parameter Modelica.SIunits.Power  Q_tot = 1000;
parameter Modelica.SIunits.Area  A;
// Q_tot = A/N*sum(Cells.qdot)
Modelica.SIunits.HeatFlux phiCell "=Q_tot / (A*N)";

  ThermoCycle.Interfaces.HeatTransfer.ThermalPort thermalPort(N=N)
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
for i in 1:N loop
  thermalPort.phi[i] = phiCell;
end for;
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
end Source_Q;
