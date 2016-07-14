within BrickerISES.Tests.AD.TestComponents;
model Test_trap
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    amplitude=-970,
    rising=2,
    width=300,
    falling=2,
    offset=970,
    startTime=500,
    nperiod=1,
    period=400)
    annotation (Placement(transformation(extent={{-52,8},{-32,28}})));
end Test_trap;
