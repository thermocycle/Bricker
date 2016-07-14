within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_ByPassBiomassORC

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
    annotation (Placement(transformation(extent={{-104,-110},{-62,-40}})));

  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-180,-88},{-160,-68}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-180,-60},{-160,-40}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-180,-26},{-160,-6}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=960)
    annotation (Placement(transformation(extent={{-180,-122},{-160,-102}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-178,-160},{-158,-140}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-72,-24},{-52,-4}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{32,-28},{52,-8}})));
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
    L_lstart=0.9,
    V_tank=0.05,
    p_ext=450000,
    Tstart=479.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{88,-14},{108,6}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    L_lstart=0.001,
    V_tank=0.05,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{130,114},{150,134}})));
  Components.ORC.ORCunitHx oRCunitHx(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    N=15,
    Asf=80,
    Awf=80,
    UnomSf=1000,
    UnomL=1000,
    UnomTp=8000,
    UnomV=2000,
    MdotnomSf=2.6,
    MdotWf=2.5,
    UseT=true,
    SteadyStateTWall=true,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    MdotnomWf=2.45,
    pStartSf=350000,
    pStartWf=2500000,
    TstartInletWf=333.15,
    TstartOutletWf=403.15,
    TstartInletSf=518.15,
    TstartOutletSf=427.15,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{204,-32},{264,12}})));
  Modelica.Blocks.Sources.Constant const4(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{240,58},{260,78}})));
  Modelica.Blocks.Sources.Constant const5(k=2.45)
    annotation (Placement(transformation(extent={{236,84},{216,104}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=3.13021e+07)
         annotation (Placement(transformation(extent={{200,-160},{180,-140}})));
 Components.Valve_lin             valve3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Xopen=0.04,
    Afull=0.000125)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={164,2})));

equation
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-159,-16},{-116,-16},{-116,-46},{-101.2,-46},{-101.2,-45.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-159,-50},{-124,-50},{-124,-59.0909},{-101.667,-59.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-159,-78},{-128,-78},{-128,-73.0909},{-101.667,-73.0909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-159,-112},{-116,-112},{-116,-86.1364},{-101.9,-86.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-157,-150},{-128,-150},{-128,-99.8182},{-101.667,-99.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-78.8,-110.636},{-78.8,-150.6},{112.4,-150.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, valve.cmd) annotation (Line(
      points={{36.5,-79},{53.25,-79},{53.25,-82},{64,-82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{72,-91},{72,-150.6},{112.4,-150.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, valve.OutFlow) annotation (Line(
      points={{51,-18},{72,-18},{72,-73}},
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
      points={{51,-18},{82,-18},{82,-12.4},{88.2,-12.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
      points={{107.8,-12.4},{122,-12.4},{122,16},{61,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
      points={{53,130},{94,130},{94,118},{130.2,118},{130.2,115.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const5.y,oRCunitHx. MdotWfORC) annotation (Line(
      points={{215,94},{214,94},{214,32},{220,32},{220,10.5333},{226.286,
          10.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{261,68},{274,68},{274,32},{250,32},{250,10.5333},{247.714,
          10.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tank.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{149.8,115.6},{203.143,115.6},{203.143,4.66667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, dP3.InFlow) annotation (Line(
      points={{202.286,-25.1556},{202.286,-150},{199,-150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.InFlow, dP3.OutFlow) annotation (Line(
      points={{125.2,-157.5},{140,-157.5},{140,-150},{181,-150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{164,11},{164,116},{203.143,116},{203.143,4.66667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.OutFlow, dP3.OutFlow) annotation (Line(
      points={{164,-7},{164,-150},{181,-150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-76,-40.6364},{-76,-18},{-69,-18},{-69,-18.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
      points={{-55,-18.8},{33,-18.8},{33,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-160},{240,140}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-160},{240,140}})));
end Test_SF_ByPassBiomassORC;
