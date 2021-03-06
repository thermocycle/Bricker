within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_II.SizingSimpleValve;
model EvaORC
parameter Real k(start = 0.00002, fixed = false) = 0.000021;
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom_sf=2.6,
    Mdotnom_wf=2.5,
    A_sf=16.18*k,
    A_wf=16.18*k,
    N=15,
    pstart_sf=350000,
    pstart_wf=1800000,
    Tstart_inlet_wf=333.15,
    Tstart_outlet_wf=403.15,
    Tstart_inlet_sf=518.15,
    Tstart_outlet_sf=427.15,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal)
    annotation (Placement(transformation(extent={{-40,-22},{10,22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{22,36},{42,56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
    annotation (Placement(transformation(extent={{-62,24},{-42,44}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=2.5,
    p=100000,
    T_0=333.15)
    annotation (Placement(transformation(extent={{-88,-34},{-68,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=1800000)
    annotation (Placement(transformation(extent={{42,-40},{62,-20}})));
Modelica.SIunits.Power PowerRec = hx1DInc.Summary.Q_sf;
initial equation
   PowerRec = 563e3;

equation
  connect(sourceMdot.flangeB, hx1DInc.inlet_fl2) annotation (Line(
      points={{41,46},{50,46},{50,10.1538},{3.84615,10.1538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, hx1DInc.outlet_fl2) annotation (Line(
      points={{-60.4,34},{-78,34},{-78,9.81538},{-33.8462,9.81538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{-69,-24},{-62,-24},{-62,-22},{-50,-22},{-50,-8.46154},{
          -34.2308,-8.46154}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(hx1DInc.outlet_fl1, sinkP1.flangeB) annotation (Line(
      points={{4.23077,-8.46154},{14,-8.46154},{14,-28},{43.6,-28},{43.6,
          -30}},
      color={0,0,255},
      smooth=Smooth.None));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end EvaORC;
