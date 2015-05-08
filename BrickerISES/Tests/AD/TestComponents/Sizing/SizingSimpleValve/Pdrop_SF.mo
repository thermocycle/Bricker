within BrickerISES.Tests.AD.TestComponents.Sizing.SizingSimpleValve;
model Pdrop_SF "Solar field pressure drop"
  parameter Real k(start = 0.02, fixed = false) = 0.021;

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        450000)
    annotation (Placement(transformation(extent={{68,-2},{88,18}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    k=k,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3)
         annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.5,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=550000,
    T_0=482.15)
    annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

initial equation
  dP.DELTAp = 1e5;

equation
  connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{11,8},{69.6,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
      points={{-51,8},{-7,8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Pdrop_SF;
