within BrickerISES.Tests.AD.TestComponents.BiomassSystem_VP1;
model Test_4_1
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
    N=5,
    Ns=19,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-124,-228},{-82,-158}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=25)
    annotation (Placement(transformation(extent={{-208,-206},{-188,-186}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-208,-174},{-188,-154}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-200,-128},{-180,-108}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=1000)
    annotation (Placement(transformation(extent={{-208,-240},{-188,-220}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-206,-278},{-186,-258}})));
 Components.Valve_lin             valve3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.5e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-6,-188})));
  Modelica.Blocks.Sources.Constant const4(k=0.04)
    annotation (Placement(transformation(extent={{-50,-192},{-40,-182}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{34,-114},{54,-94}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{98,-266},{78,-246}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96E+07)
         annotation (Placement(transformation(extent={{-68,-120},{-48,-100}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        450000)
    annotation (Placement(transformation(extent={{128,20},{148,40}})));
Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.6923,
    Afull=5.20006e-05)
                annotation (Placement(transformation(extent={{44,-46},{24,-26}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000)
    annotation (Placement(transformation(extent={{-224,52},{-244,72}})));
Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002)
                annotation (Placement(transformation(extent={{-86,20},{-66,40}})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    QcombustionStart=10e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-205,8})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-264,2},{-250,16}})));
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
    annotation (Placement(transformation(extent={{-156,44},{-136,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
equation
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-187,-230},{-160,-230},{-160,-204.136},{-121.9,-204.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-185,-268},{-138,-268},{-138,-217.818},{-121.667,-217.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{79,-256},{-98.8,-256},{-98.8,-228.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{-6,-197},{-6,-256},{-98.8,-256},{-98.8,-228.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y,valve3. cmd) annotation (Line(
      points={{-39.5,-187},{-32,-187},{-32,-188},{-14,-188}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve3.OutFlow,sensTp1. InFlow) annotation (Line(
      points={{-6,-179},{-6,-110},{37,-110},{37,-108.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y,solarCollectorIncSchott. Theta) annotation (Line(
      points={{-187,-164},{-162,-164},{-162,-177.091},{-121.667,-177.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y,solarCollectorIncSchott. Tamb) annotation (Line(
      points={{-187,-196},{-160,-196},{-160,-191.091},{-121.667,-191.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y,solarCollectorIncSchott. v_wind) annotation (Line(
      points={{-179,-118},{-158,-118},{-158,-163.727},{-121.2,-163.727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP3.InFlow) annotation (Line(
      points={{-96,-158.636},{-98,-158.636},{-98,-110},{-67,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP3.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-49,-110},{37,-110},{37,-108.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{51,-108.8},{98,-108.8},{98,30},{129.6,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, sinkP.flangeB) annotation (Line(
      points={{43,-36},{98,-36},{98,30},{129.6,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, valve.OutFlow) annotation (Line(
      points={{-67,30},{-54,30},{-54,-6},{-72,-6},{-72,-30},{-24,-30},{-24,-36},
          {25,-36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-225.6,62},{-210,62},{-210,32.5},{-208.12,32.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-249.3,9},{-242,9},{-242,8},{-225.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.OutFlow, flow1DIncHeatInput.inlet_fl2) annotation (Line(
      points={{25,-36},{-208,-36},{-208,-17},{-208.64,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-140.4,61.4},{64,61.4},{64,28},{98,28},{98,30},{129.6,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-160.6,90},{-160,90},{-160,54.5},{-153.2,54.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, valve1.InFlow) annotation (Line(
      points={{-140.4,61.4},{-102,61.4},{-102,30},{-85,30}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-280,-320},{380,260}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-280,-320},{380,260}})));
end Test_4_1;
