within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_II.SizingSimpleValve;
model Size_PdropBMin "Pressure drop in the pipes to the biomass boiler"
  parameter Real k(start = 0.02, fixed = false) = 0.021;

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=400000)
    annotation (Placement(transformation(extent={{68,-2},{88,18}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    k=k,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3)
         annotation (Placement(transformation(extent={{-8,-4},{12,16}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.77,
    p=450000,
    T_0=488.15)
    annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

initial equation
  dP.DELTAp = 0.5e5;

equation
  connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{11,6},{40,6},{40,8},{69.6,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
      points={{-51,8},{-30,8},{-30,6},{-7,6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Size_PdropBMin;
