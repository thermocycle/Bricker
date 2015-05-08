within BrickerISES.Tests.AD.TestComponents.BiomassSystem.ORC_Cycle;
model _HxORCPumpTank
// V_dot_maxORC	0.00402091	m3/s
// Slope	0
// Time	0	s

 ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom_sf=2.6,
    Mdotnom_wf=2.5,
    N=15,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_sf=1000,
    Unom_l=1000,
    Unom_tp=8000,
    Unom_v=2000,
    A_sf=80,
    A_wf=80,
    pstart_sf=350000,
    pstart_wf=1800000,
    Tstart_inlet_wf=333.15,
    Tstart_outlet_wf=403.15,
    Tstart_inlet_sf=518.15,
    Tstart_outlet_sf=427.15,
    steadystate_T_wall=true)
    annotation (Placement(transformation(extent={{-30,-12},{20,32}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{32,46},{52,66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
    annotation (Placement(transformation(extent={{-54,56},{-34,76}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-42,14},{-62,34}})));
  Components.ORC.ORCunit oRCunit(redeclare package MediumSf =
        ThermoCycle.Media.R245fa_CP)
    annotation (Placement(transformation(extent={{44,-76},{58,-58}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_cf(redeclare package
      Medium = ExternalMedia.Examples.WaterCoolProp, p0=100000)
    annotation (Placement(transformation(extent={{80,-102},{100,-82}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_cf(
    Mdot_0=8.9,
    redeclare package Medium = ExternalMedia.Examples.WaterCoolProp,
    T_0=333.15)
    annotation (Placement(transformation(extent={{100,-42},{80,-22}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    V_dot_max=0.00402091,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-32,-64},{-12,-44}})));
equation
  connect(sourceMdot.flangeB,hx1DInc. inlet_fl2) annotation (Line(
      points={{51,56},{60,56},{60,20.1538},{13.8462,20.1538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow,hx1DInc. outlet_fl2) annotation (Line(
      points={{-45,19.2},{-38,19.2},{-38,19.8154},{-23.8462,19.8154}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow,sinkP. flangeB) annotation (Line(
      points={{-59,19.2},{-72,19.2},{-72,66},{-52.4,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP_cf.flangeB, oRCunit.OutFlowCf) annotation (Line(
      points={{81.6,-92},{66,-92},{66,-73.2},{58.2,-73.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunit.InFlowCf, source_cf.flangeB) annotation (Line(
      points={{58.2,-60},{70,-60},{70,-32},{81,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.InFlow, oRCunit.OutFlowSf) annotation (Line(
      points={{-29.2,-53.5},{-42,-53.5},{-42,-78},{32,-78},{32,-69.6},{43.8,
          -69.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, hx1DInc.inlet_fl1) annotation (Line(
      points={{-16.4,-46.6},{-6,-46.6},{-6,-20},{-48,-20},{-48,1.53846},{
          -24.2308,1.53846}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl1, oRCunit.InFlowSf) annotation (Line(
      points={{14.2308,1.53846},{36,1.53846},{36,-63.6},{43.8,-63.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end _HxORCPumpTank;
