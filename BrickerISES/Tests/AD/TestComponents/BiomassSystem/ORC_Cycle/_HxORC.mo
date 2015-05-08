within BrickerISES.Tests.AD.TestComponents.BiomassSystem.ORC_Cycle;
model _HxORC

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
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=2.5,
    p=100000,
    T_0=333.15)
    annotation (Placement(transformation(extent={{-78,-24},{-58,-4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=2500000)
    annotation (Placement(transformation(extent={{-2,-92},{18,-72}})));
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
equation
  connect(sourceMdot.flangeB,hx1DInc. inlet_fl2) annotation (Line(
      points={{51,56},{60,56},{60,20.1538},{13.8462,20.1538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB,hx1DInc. inlet_fl1) annotation (Line(
      points={{-59,-14},{-52,-14},{-52,-12},{-40,-12},{-40,1.53846},{-24.2308,
          1.53846}},
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
  connect(hx1DInc.outlet_fl1, oRCunit.InFlowSf) annotation (Line(
      points={{14.2308,1.53846},{28,1.53846},{28,-63.6},{43.8,-63.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, oRCunit.OutFlowSf) annotation (Line(
      points={{-0.4,-82},{-12,-82},{-12,-64},{22,-64},{22,-82},{36,-82},{36,
          -69.6},{43.8,-69.6}},
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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end _HxORC;
