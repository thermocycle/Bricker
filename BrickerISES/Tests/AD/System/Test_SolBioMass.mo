within BrickerISES.Tests.AD.System;
model Test_SolBioMass

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=5,
    Unom=500,
    Mdotnom=2.2,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    Ns=10,
    Tstart_inlet=428.15,
    Tstart_outlet=518.15,
    pstart=150000) annotation (Placement(transformation(
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
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=428.15)
    annotation (Placement(transformation(extent={{-28,-72},{-48,-52}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-116,74},{-106,84}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-116,52},{-106,62}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25)
    annotation (Placement(transformation(extent={{-116,32},{-106,42}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-116,12},{-106,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-116,-10},{-106,0}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=2.5,
    V_tank=5,
    L_lstart=0.6,
    Mdotnom=2.2,
    p_ext=150000,
    Tstart=448.15,
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

  Modelica.Blocks.Sources.Constant const(k=400000)
    annotation (Placement(transformation(extent={{28,112},{40,124}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.2,
    pstart=150000)
    annotation (Placement(transformation(extent={{100,-4},{120,16}})));
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
  connect(pump1.InFlow, sourceP.flange) annotation (Line(
      points={{-56.8,-17.5},{-54,-17.5},{-54,-62},{-47.4,-62}},
      color={0,0,255},
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
  connect(simpleBiomassBoiler.outlet, sinkMdot.flangeB) annotation (Line(
      points={{76,82.32},{94,82.32},{94,6},{100.2,6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -120,-100},{140,140}}), graphics), Icon(coordinateSystem(extent={
            {-120,-100},{140,140}})));
end Test_SolBioMass;
