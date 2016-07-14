within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_HX_OilWater
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    redeclare package Medium1 = ThermoCycle.Media.Water,
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=10,
    V_sf=0.018,
    V_wf=0.018,
    A_sf=6.4,
    A_wf=6.4,
    M_wall=35,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_sf=3000,
    Unom_l=2500,
    Unom_tp=2500,
    Unom_v=2500,
    Mdotnom_sf=4.8,
    Mdotnom_wf=3.9,
    pstart_sf=400000,
    pstart_wf=100000,
    Tstart_inlet_wf=340.15,
    Tstart_outlet_wf=343.15,
    Tstart_inlet_sf=354.15,
    Tstart_outlet_sf=347.15)
    annotation (Placement(transformation(extent={{-26,-6},{24,46}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=4.8,
    p=100000,
    T_0=340.15)
    annotation (Placement(transformation(extent={{-76,-30},{-56,-10}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=3.9,
    p=400000,
    T_0=354.15)
    annotation (Placement(transformation(extent={{48,46},{68,66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{44,-26},{64,-6}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       400000)
    annotation (Placement(transformation(extent={{-52,46},{-32,66}})));
equation
  connect(sourceMdot.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{-57,-20},{-40,-20},{-40,10},{-20.2308,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{18.2308,10},{30,10},{30,-16},{45.6,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc.inlet_fl2) annotation (Line(
      points={{67,56},{70,56},{70,32},{17.8462,32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, hx1DInc.outlet_fl2) annotation (Line(
      points={{-50.4,56},{-66,56},{-66,31.6},{-19.8462,31.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Test_HX_OilWater;
