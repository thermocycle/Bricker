within BrickerISES.Tests.SA;
model hysteresis
  Modelica.Blocks.Sources.Ramp ramp(
    offset=0,
    startTime=5,
    height=500,
    duration=150)
    annotation (Placement(transformation(extent={{-76,-22},{-56,-2}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=423, uHigh=433)
    annotation (Placement(transformation(extent={{-20,-18},{0,2}})));
equation
  connect(ramp.y, hysteresis.u) annotation (Line(
      points={{-55,-12},{-38,-12},{-38,-8},{-22,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end hysteresis;
