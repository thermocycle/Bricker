within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_HX_OilWater_II

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
    X_pp0=0.5,
    V_dot_max=0.00909278,
    M_dot_start=3.9,
    hstart=145528,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-42,-10},{-62,10}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       350000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-92,-38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=0.1,
    p=350000,
    T_0=498.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-86,80})));

  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-38})));
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc1(
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
    annotation (Placement(transformation(extent={{-25,-26},{25,26}},
        rotation=90,
        origin={19,16})));
equation
  connect(sinkP1.flangeB, massFlowRate2.port_b) annotation (Line(
      points={{-83.6,-38},{-60,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc1.inlet_fl2) annotation (Line(
      points={{-77,80},{-56,80},{-56,78},{7,78},{7,34.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
      points={{7.4,-2.84615},{7.4,-38},{-40,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{-44.8,0.5},{-28,0.5},{-28,-38},{-40,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{-57.6,7.4},{-57.6,60},{-40,60},{-40,78},{7,78},{7,34.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
      points={{60,-45},{60,-26},{34,-26},{34,-3.23077},{29,-3.23077}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{29,35.2308},{29,52},{66,52},{66,73.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end Test_HX_OilWater_II;
