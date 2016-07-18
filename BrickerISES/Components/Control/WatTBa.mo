within BrickerISES.Components.Control;
model WatTBa

  Modelica.Blocks.Interfaces.RealInput Qbuilding
    annotation (Placement(transformation(extent={{-128,60},{-90,98}})));
  Modelica.Blocks.Interfaces.RealInput QORC
    annotation (Placement(transformation(extent={{-128,-20},{-88,20}})));
  Modelica.Blocks.Interfaces.RealInput Qhx
    annotation (Placement(transformation(extent={{-128,-96},{-88,-56}})));
  Modelica.Blocks.Interfaces.RealOutput Qres( start=0)
    annotation (Placement(transformation(extent={{94,4},{114,24}})));
  Modelica.Blocks.Interfaces.RealInput ControlSignal
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-18,96})));

equation
  Qres = (QORC + Qhx + Qbuilding) * ControlSignal;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end WatTBa;
