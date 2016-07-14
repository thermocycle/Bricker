within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_ByPassBiomass

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=3,
    Nt=4,
    Mdotnom=2.5,
    Tstart_inlet=442.15,
    Tstart_outlet=498.15,
    pstart=100000,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
      CollectorGeometry)
    annotation (Placement(transformation(extent={{-46,-116},{-4,-46}})));

  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-132,-96},{-112,-76}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-132,-68},{-112,-48}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-132,-34},{-112,-14}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=960)
    annotation (Placement(transformation(extent={{-132,-130},{-112,-110}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-130,-168},{-110,-148}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-18,-42},{-38,-22}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{32,-22},{52,-2}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Afull=2.60022e-05,
    Xopen=0.0923)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={72,-82})));
  Modelica.Blocks.Sources.Constant const6(k=0.0923)
    annotation (Placement(transformation(extent={{26,-84},{36,-74}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.007,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{128,-168},{108,-148}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=350000,
    T_0=437.15)
    annotation (Placement(transformation(extent={{178,-154},{158,-134}})));
  Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=5.40698e-05,
    DELTAp_nom=50000)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={74,68})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.08063e+07)
         annotation (Placement(transformation(extent={{62,6},{42,26}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.98666e+07)
         annotation (Placement(transformation(extent={{34,120},{54,140}})));
 Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=0.000188098,
    Xopen=0.8106,
    Mdot_nom=7.62)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={4,70})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    Mdotnom=9.4,
    QcombustionNominal=210e3,
    Unom=2500,
    QcombustionStart=210e3,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState)
                               annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-103,60})));

  Modelica.Blocks.Sources.Constant const2(
                                         k=1)
    annotation (Placement(transformation(extent={{-162,54},{-148,68}})));
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
    annotation (Placement(transformation(extent={{-42,6},{-62,26}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    V_tank=0.02,
    L_lstart=0.9,
    p_ext=450000,
    Tstart=479.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{88,-18},{108,2}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.02,
    Mdotnom=2.6,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000,
    L_lstart=0.001)
    annotation (Placement(transformation(extent={{116,112},{136,132}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.703,
    pstart=400000)
    annotation (Placement(transformation(extent={{160,104},{180,124}})));
equation
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-111,-24},{-68,-24},{-68,-54},{-43.2,-54},{-43.2,-51.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-111,-58},{-76,-58},{-76,-65.0909},{-43.6667,-65.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-111,-86},{-80,-86},{-80,-79.0909},{-43.6667,-79.0909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-111,-120},{-68,-120},{-68,-92.1364},{-43.9,-92.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-109,-158},{-80,-158},{-80,-105.818},{-43.6667,-105.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-21,-36.8},{-18,-36.8},{-18,-46.6364}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-20.8,-116.636},{-20.8,-150.6},{112.4,-150.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, valve.cmd) annotation (Line(
      points={{36.5,-79},{53.25,-79},{53.25,-82},{64,-82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
      points={{-35,-36.8},{-48,-36.8},{-48,-12},{33,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, PumpSF.InFlow) annotation (Line(
      points={{158.6,-144},{144,-144},{144,-157.5},{125.2,-157.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{72,-91},{72,-150.6},{112.4,-150.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, valve.OutFlow) annotation (Line(
      points={{51,-12},{72,-12},{72,-73}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.InFlow, dP2.InFlow) annotation (Line(
      points={{4,79},{4,130},{35,130}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-147.3,61},{-140,61},{-140,60},{-123.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP2.InFlow,valve2. InFlow) annotation (Line(
      points={{35,130},{4,130},{4,79}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow,pump. InFlow) annotation (Line(
      points={{4,61},{4,16.5},{-44.8,16.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
      points={{-106.64,35},{-106.64,23.4},{-57.6,23.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2,valve2. InFlow) annotation (Line(
      points={{-106.12,84.5},{-104,84.5},{-104,130},{4,130},{4,79}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, pump.InFlow) annotation (Line(
      points={{43,16},{32,16},{32,14},{4,14},{4,16},{-44.8,16.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP2.OutFlow, valve1.OutFlow) annotation (Line(
      points={{53,130},{74,130},{74,77}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.InFlow, dP1.InFlow) annotation (Line(
      points={{74,59},{74,16},{61,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
      points={{51,-12},{82,-12},{82,-16.4},{88.2,-16.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
      points={{107.8,-16.4},{134,-16.4},{134,16},{61,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
      points={{53,130},{94,130},{94,112},{116.2,112},{116.2,113.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{135.8,113.6},{147.9,113.6},{147.9,114},{160.2,114}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-160},{240,140}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-160},{240,140}})));
end Test_SF_ByPassBiomass;
