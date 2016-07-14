within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_HX_OilWater_IIChiller

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={46,-54})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,82})));
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
        origin={-98,-56})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=0.1,
    p=350000,
    T_0=498.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,74})));

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
        origin={5,16})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={38,59})));
  Components.Chiller.Chiller_v2 chiller_v1_1(T_start_su=343.15, m_start=8)
    annotation (Placement(transformation(extent={{126,12},{184,66}})));
  Modelica.Blocks.Sources.Constant const(k=250000)
    annotation (Placement(transformation(extent={{162,100},{182,120}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{6,52},{26,72}})));
equation
  connect(sinkP1.flangeB, massFlowRate2.port_b) annotation (Line(
      points={{-89.6,-56},{-70,-56},{-70,-38},{-60,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc1.inlet_fl2) annotation (Line(
      points={{-87,74},{-70,74},{-70,78},{-7,78},{-7,34.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
      points={{-6.6,-2.84615},{-6.6,-38},{-40,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{-44.8,0.5},{-28,0.5},{-28,-38},{-40,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{-57.6,7.4},{-57.6,60},{-54,60},{-54,78},{-7,78},{-7,34.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
      points={{46,-45},{46,-26},{20,-26},{20,-3.23077},{15,-3.23077}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate1.port_b, sinkP.flangeB) annotation (Line(
      points={{45,59},{52,59},{52,73.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate1.m_flow, chiller_v1_1.mdotsu) annotation (Line(
      points={{38,65.6},{38,68},{78,68},{78,46.56},{124.26,46.56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, chiller_v1_1.Q_td) annotation (Line(
      points={{183,110},{220,110},{220,52},{186.32,52},{186.32,49.26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, sensTp.InFlow) annotation (Line(
      points={{15,35.2308},{15,46},{2,46},{2,57.2},{9,57.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, massFlowRate1.port_a) annotation (Line(
      points={{23,57.2},{28,57.2},{28,59},{31,59}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.T, chiller_v1_1.Tsu) annotation (Line(
      points={{24,68},{28,68},{28,106},{86,106},{86,60.6},{124.26,60.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{240,180}}),      graphics), Icon(coordinateSystem(extent={{-100,
            -100},{240,180}})));
end Test_HX_OilWater_IIChiller;
