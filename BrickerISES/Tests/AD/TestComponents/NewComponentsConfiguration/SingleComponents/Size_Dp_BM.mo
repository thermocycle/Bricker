within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration.SingleComponents;
model Size_Dp_BM "Pressure drop in the pipes to the biomass boiler"
  parameter Real k(start = 0.02, fixed = false) = 0.021;

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=450000)
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
    Mdot_0=9.5,
    p=650000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-74,10},{-54,30}})));

initial equation
  dP.DELTAp = 1.5e5;

equation
  connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{11,6},{40,6},{40,8},{69.6,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
      points={{-55,20},{-30,20},{-30,6},{-7,6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Size_Dp_BM;
