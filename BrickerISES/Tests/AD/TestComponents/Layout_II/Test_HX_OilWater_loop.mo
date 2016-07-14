within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_HX_OilWater_loop
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    redeclare package Medium1 = ThermoCycle.Media.Water,
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom_sf=3.93,
    N=10,
    V_sf=0.018,
    V_wf=0.018,
    A_sf=6.4,
    A_wf=6.4,
    M_wall=35,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_sf=3000,
    Mdotnom_wf=7.96,
    counterCurrent=true,
    Unom_l=1600,
    Unom_tp=1600,
    Unom_v=1600,
    pstart_sf=400000,
    pstart_wf=100000,
    Tstart_inlet_wf=340.15,
    Tstart_outlet_wf=343.15,
    Tstart_inlet_sf=350.15,
    Tstart_outlet_sf=345.15) annotation (Placement(transformation(
        extent={{-25,-26},{25,26}},
        rotation=90,
        origin={21,12})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-54})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={66,82})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    M_dot_start=3.93,
    hstart=140.2e3,
    X_pp0=1,
    V_dot_max=0.0047,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-16,-56},{-36,-36}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       400000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-92,-38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=0.25,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-86,80})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.5,
    Afull=0.0001555,
    Mdot_nom=3.68)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-54,26})));

equation
  connect(sourceMdot.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{60,-45},{60,-30},{31,-30},{31,-7.23077}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, hx1DInc.outlet_fl1) annotation (Line(
      points={{66,73.6},{66,58},{31,58},{31,31.2308}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl2, pump.InFlow) annotation (Line(
      points={{9.4,-6.84615},{9.4,-45.5},{-18.8,-45.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{-31.6,-38.6},{-78,-38.6},{-78,-38},{-83.6,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, sinkP1.flangeB) annotation (Line(
      points={{-54,17},{-54,-38},{-83.6,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, valve.OutFlow) annotation (Line(
      points={{-77,80},{-54,80},{-54,35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
      points={{-54,35},{-54,80},{9,80},{9,30.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Test_HX_OilWater_loop;
