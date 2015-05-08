within BrickerISES.Tests.AD.System;
model Test_SolBioMassEva

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=5,
    Ns=2,
    Unom=500,
    Mdotnom=2.2,
    Tstart_inlet=428.15,
    Tstart_outlet=518.15,
    pstart=150000,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry) annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-69,39})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    f_pp0=30,
    hstart=262,
    V_dot_max=0.00463)
    annotation (Placement(transformation(extent={{-54,-28},{-74,-8}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-116,74},{-106,84}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-116,52},{-106,62}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25)
    annotation (Placement(transformation(extent={{-116,32},{-106,42}})));
  Modelica.Blocks.Sources.Constant DNI(k=600)
    annotation (Placement(transformation(extent={{-116,12},{-106,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant
    annotation (Placement(transformation(extent={{-116,-10},{-106,0}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=2.5,
    V_tank=5,
    L_lstart=0.6,
    Mdotnom=2.2,
    p_ext=150000,
    Tstart=493.15,
    pstart=150000)
    annotation (Placement(transformation(extent={{-40,82},{-20,102}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    M_wall=10,
    pstart_f=150000,
    Tstart=495.15) annotation (Placement(transformation(
        extent={{29,-26},{-29,26}},
        rotation=0,
        origin={47,74})));

  Modelica.Blocks.Sources.Constant const(k=320000)
    annotation (Placement(transformation(extent={{28,112},{40,124}})));
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    steadystate_h_wf=true,
    N=10,
    Unom_sf=900,
    Mdotconst_wf=false,
    max_der_wf=false,
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package Medium1 = ThermoCycle.Media.R245fa_CP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_l=500,
    Unom_tp=500,
    Unom_v=500,
    Mdotnom_sf=2.2,
    Mdotnom_wf=1,
    A_sf=11.2,
    A_wf=11.2,
    pstart_sf=150000,
    pstart_wf=800000,
    Tstart_inlet_wf=303.15,
    Tstart_outlet_wf=473.15,
    Tstart_inlet_sf=520.15,
    Tstart_outlet_sf=428.15)
    annotation (Placement(transformation(extent={{40,-14},{102,48}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    h_0=84867,
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    UseT=true,
    Mdot_0=1,
    p=800000,
    T_0=303.15)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(
    h=254381,
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    p0=800000)
    annotation (Placement(transformation(extent={{146,-36},{166,-16}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp
    annotation (Placement(transformation(extent={{112,-10},{132,10}})));
equation
  connect(pump1.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
      points={{-69.6,-10.6},{-69.6,-4},{-69.42,-4},{-69.42,18.42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-105.5,17},{-82,17},{-82,24.72},{-88.32,24.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-105.5,-5},{-55.56,-5},{-55.56,20.94}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-105.5,37},{-102,37},{-102,34.17},{-88.53,34.17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-105.5,57},{-104,57},{-104,44.67},{-88.53,44.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-105.5,79},{-98,79},{-98,54.54},{-88.32,54.54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.OutFlow, openTank.InFlow) annotation (Line(
      points={{-69.42,59.58},{-69.42,83.6},{-39.8,83.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-20.2,83.6},{-2.1,83.6},{-2.1,83.88},{17.42,83.88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{40.6,118},{62.08,118},{62.08,93.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,hx1DInc. inlet_fl1) annotation (Line(
      points={{9,-30},{34,-30},{34,5.07692},{47.1538,5.07692}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl1,sensTp. InFlow) annotation (Line(
      points={{94.8462,5.07692},{112,5.07692},{112,-4.8},{115,-4.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow,sinkP. flangeB) annotation (Line(
      points={{129,-4.8},{132,-4.8},{132,-26},{147.6,-26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, hx1DInc.inlet_fl2) annotation (Line(
      points={{76,82.32},{90,82.32},{90,84},{118,84},{118,31.3077},{94.3692,
          31.3077}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl2, pump1.InFlow) annotation (Line(
      points={{47.6308,30.8308},{-32,30.8308},{-32,-17.5},{-56.8,-17.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{140,140}}),      graphics), Icon(coordinateSystem(extent={
            {-120,-100},{140,140}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_SolBioMassEva;
