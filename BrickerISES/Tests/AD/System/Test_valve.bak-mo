within BrickerISES.Tests.AD.System;
model Test_valve

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkPFluid(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       150000)
    annotation (Placement(transformation(extent={{24,32},{44,52}})));
  Real y;
ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=1.65,
    UseNom=false,
    p_nom=150000,
    T_nom=438.15,
    DELTAp_nom=40000)
    annotation (Placement(transformation(extent={{-38,28},{-18,48}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkPFluid1(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=150000,
    h=349421)
    annotation (Placement(transformation(extent={{-66,30},{-86,50}})));
equation
  y = ThermoCycle.Functions.weightingfactor(
        t_init=2,
        length=5,
        t=time)
  annotation (Diagram(graphics), uses(Modelica(version="3.2")));
  connect(valve.OutFlow, sinkPFluid.flangeB) annotation (Line(
      points={{-19,38},{6,38},{6,42},{25.6,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkPFluid1.flangeB, valve.InFlow) annotation (Line(
      points={{-67.6,40},{-52,40},{-52,38},{-37,38}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics),
    experiment(StopTime=50),
    __Dymola_experimentSetupOutput);
end Test_valve;
