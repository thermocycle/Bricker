within BrickerISES.Tests.SA;
model prova_sinusoide
  Modelica.Blocks.Sources.Sine sine(
    amplitude=1000,
    freqHz=1e-5,
    offset=0,
    startTime=1000) "1e-5"
    annotation (Placement(transformation(extent={{-42,2},{-22,22}})));
  Modelica.Blocks.Math.Abs abs1
    annotation (Placement(transformation(extent={{-6,2},{14,22}})));
equation
  connect(sine.y, abs1.u) annotation (Line(
      points={{-21,12},{-8,12}},
      color={0,0,127},
      smooth=Smooth.None));
end prova_sinusoide;
