within BrickerISES.Tests.AD.System;
model Size_EVA

  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    N=10,
    Mdotconst_wf=false,
    max_der_wf=false,
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package Medium1 = ThermoCycle.Media.R245fa_CP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    A_sf=16*kh,
    A_wf=16*kh,
    Mdotnom_sf=1.6,
    Mdotnom_wf=1.9,
    steadystate_h_wf=false,
    Unom_l=3000,
    Unom_tp=3000,
    Unom_v=3000,
    Unom_sf=2000,
    pstart_sf=150000,
    pstart_wf=3500000,
    Tstart_inlet_wf=408.15,
    Tstart_outlet_wf=523.15,
    Tstart_inlet_sf=538.15,
    Tstart_outlet_sf=438.15)
    annotation (Placement(transformation(extent={{-38,-26},{24,36}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    h_0=84867,
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    UseT=true,
    Mdot_0=1.9,
    p=3500000,
    T_0=408.15)
    annotation (Placement(transformation(extent={{-88,-28},{-68,-8}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    p0=3500000,
    h=642977)
    annotation (Placement(transformation(extent={{68,-48},{88,-28}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.65,
    p=150000,
    T_0=538.15)
    annotation (Placement(transformation(extent={{24,70},{44,90}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=150000,
    h=649018)
    annotation (Placement(transformation(extent={{-54,72},{-36,90}})));
parameter Real kh( start = 1, fixed = false) = 1;
Modelica.SIunits.Power PowerEva =  hx1DInc.Summary.Q_sf;

  ThermoCycle.Components.FluidFlow.Sensors.SensTp Outlet_Wf
    annotation (Placement(transformation(extent={{34,-22},{54,-2}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Outlet_Sf(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-60,24},{-80,44}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Inlet_Wf(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP)
    annotation (Placement(transformation(extent={{-64,-20},{-44,0}})));
initial equation
  PowerEva = 476335;

equation
  connect(sourceMdot1.flangeB, hx1DInc.inlet_fl2) annotation (Line(
      points={{43,80},{60,80},{60,19.3077},{16.3692,19.3077}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(hx1DInc.outlet_fl1, Outlet_Wf.InFlow)
                                             annotation (Line(
      points={{16.8462,-6.92308},{34,-6.92308},{34,-16.8},{37,-16.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Outlet_Wf.OutFlow, sinkP.flangeB)
                                         annotation (Line(
      points={{51,-16.8},{54,-16.8},{54,-38},{69.6,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Outlet_Sf.InFlow, hx1DInc.outlet_fl2)
                                              annotation (Line(
      points={{-63,29.2},{-52,29.2},{-52,18.8308},{-30.3692,18.8308}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Outlet_Sf.OutFlow, sinkP1.flangeB)
                                           annotation (Line(
      points={{-77,29.2},{-88,29.2},{-88,81},{-52.56,81}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Inlet_Wf.InFlow)
                                              annotation (Line(
      points={{-69,-18},{-66,-18},{-66,-14.8},{-61,-14.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Inlet_Wf.OutFlow, hx1DInc.inlet_fl1)
                                              annotation (Line(
      points={{-47,-14.8},{-44,-14.8},{-44,-6.92308},{-30.8462,-6.92308}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Size_EVA;
