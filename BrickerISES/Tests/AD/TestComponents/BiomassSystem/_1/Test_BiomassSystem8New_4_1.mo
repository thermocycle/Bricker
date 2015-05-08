within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model Test_BiomassSystem8New_4_1

  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.307,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,54})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{70,-8},{50,12}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{42,106},{62,126}})));
 BrickerISES.Components.Valve_lin valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={12,56})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    QcombustionStart=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.SteadyState,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-95,46})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-152,40},{-138,54}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0264686,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-34,-8},{-54,12}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.00679956,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{156,-130},{136,-110}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    Ns=19,
    N=2,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=450000,
    steadystate_T_fl=true)
    annotation (Placement(transformation(extent={{-98,-108},{-56,-38}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-180,4},{-160,24}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-180,-38},{-160,-18}})));
  Modelica.Blocks.Sources.Constant const2(
                                         k=25)
    annotation (Placement(transformation(extent={{-180,-70},{-160,-50}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=730)
    annotation (Placement(transformation(extent={{-180,-104},{-160,-84}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-178,-142},{-158,-122}})));
  Components.ORC.ORCunit ORC(redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumCf = ExternalMedia.Examples.WaterCoolProp,
    Set_pSf=false,
    pConstSf=400000)
    annotation (Placement(transformation(extent={{192,28},{248,90}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_cf(
    Mdot_0=8.9,
    redeclare package Medium = ExternalMedia.Examples.WaterCoolProp,
    T_0=333.15)
    annotation (Placement(transformation(extent={{274,86},{254,106}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_cf(redeclare package
      Medium = ExternalMedia.Examples.WaterCoolProp, p0=100000)
    annotation (Placement(transformation(extent={{258,28},{278,48}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.02,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000,
    L_lstart=0.99,
    Mdotnom=2.6)
    annotation (Placement(transformation(extent={{136,114},{156,134}})));
equation
  connect(valve.InFlow, dP.InFlow) annotation (Line(
      points={{82,45},{82,2},{69,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, dP.OutFlow) annotation (Line(
      points={{12,47},{12,2},{51,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-137.3,47},{-132,47},{-132,46},{-115.8,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP1.InFlow, valve1.InFlow) annotation (Line(
      points={{43,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, pump.InFlow) annotation (Line(
      points={{12,47},{12,2.5},{-36.8,2.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-98.64,21},{-98.64,9.4},{-49.6,9.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, valve1.InFlow) annotation (Line(
      points={{-98.12,70.5},{-96,70.5},{-96,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-159,14},{-142,14},{-142,-43.7273},{-95.2,-43.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-159,-28},{-148,-28},{-148,-57.0909},{-95.6667,-57.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-159,-60},{-144,-60},{-144,-71.0909},{-95.6667,-71.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-159,-94},{-136,-94},{-136,-84.1364},{-95.9,-84.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-157,-132},{-148,-132},{-148,-130},{-122,-130},{-122,-97.8182},{
          -95.6667,-97.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{61,116},{82,116},{82,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.InFlowCf, source_cf.flangeB) annotation (Line(
      points={{248.8,83.1111},{255,83.1111},{255,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, openTank.InFlow) annotation (Line(
      points={{61,116},{98,116},{98,115.6},{136.2,115.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, ORC.InFlowSf) annotation (Line(
      points={{155.8,115.6},{182,115.6},{182,70.7111},{191.2,70.7111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.OutFlowSf, pump1.InFlow) annotation (Line(
      points={{191.2,50.0444},{178,50.0444},{178,-119.5},{153.2,-119.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{140.4,-112.6},{-72.8,-112.6},{-72.8,-108.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP.InFlow) annotation (Line(
      points={{-70,-38.6364},{-70,-26},{122,-26},{122,8},{82,8},{82,2},{69,2}},

      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -160},{280,140}}), graphics), Icon(coordinateSystem(extent={{-160,
            -160},{280,140}})));
end Test_BiomassSystem8New_4_1;
