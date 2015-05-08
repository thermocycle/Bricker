within BrickerISES.Tests.FA;
model TestThermoCycleOnOffValve
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot2(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=2,
    T_0=373.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-52,12})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.Therminol66, h=3e5)
    annotation (Placement(transformation(extent={{72,-2},{92,18}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(redeclare package
      Medium = ThermoCycle.Media.Therminol66, use_rho_nom=false)
    annotation (Placement(transformation(extent={{-4,2},{16,22}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-46,52},{-26,72}})));
equation
  connect(const.y, valve.cmd) annotation (Line(
      points={{-25,62},{-10,62},{-10,20},{6,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot2.flangeB, valve.InFlow) annotation (Line(
      points={{-43,12},{-23,12},{-23,12},{-3,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{15,12},{44,12},{44,8},{73.6,8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestThermoCycleOnOffValve;
