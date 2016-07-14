within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_ByPassBiomassORCHx

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
    annotation (Placement(transformation(extent={{-118,-78},{-76,-8}})));

  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-194,-56},{-174,-36}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-194,-28},{-174,-8}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-194,6},{-174,26}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=960)
    annotation (Placement(transformation(extent={{-194,-90},{-174,-70}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-192,-128},{-172,-108}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true,
    Mdot_nom=2.45,
    DELTAp_lin_nom=100000,
    DELTAp_start=100000)
         annotation (Placement(transformation(extent={{-14,4},{6,24}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=2.60022e-05,
    Xopen=0.0923,
    Mdot_nom=0.25,
    DELTAp_nom=100000)
                annotation (Placement(transformation(extent={{-10,-9},{10,9}},
        rotation=90,
        origin={57,-50})));
  Modelica.Blocks.Sources.Constant const6(k=0.0923)
    annotation (Placement(transformation(extent={{12,-52},{32,-32}})));
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
    annotation (Placement(transformation(extent={{114,-136},{94,-116}})));
  Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Afull=5.40698e-05,
    Mdot_nom=0.6,
    DELTAp_nom=50000)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,100})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.08063e+07,
    Mdot_nom=1.77,
    DELTAp_lin_nom=50000,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{48,38},{28,58}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.98666e+07,
    Mdot_nom=1.77,
    DELTAp_lin_nom=50000,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{20,152},{40,172}})));
 Components.Valve_lin             valve2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=0.000188098,
    Xopen=0.8106,
    Mdot_nom=6.62,
    DELTAp_nom=50000)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,102})));
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
        origin={-117,92})));

  Modelica.Blocks.Sources.Constant const2(
                                         k=1)
    annotation (Placement(transformation(extent={{-176,86},{-162,100}})));
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
    annotation (Placement(transformation(extent={{-56,38},{-76,58}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    L_lstart=0.9,
    V_tank=0.05,
    p_ext=450000,
    Tstart=479.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{78,14},{98,34}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    L_lstart=0.000001,
    V_tank=0.5,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{116,146},{136,166}})));
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
    annotation (Placement(transformation(extent={{310,2},{370,46}})));
  Modelica.Blocks.Sources.Constant const4(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{346,92},{366,112}})));
  Modelica.Blocks.Sources.Constant const5(k=2.45)
    annotation (Placement(transformation(extent={{342,118},{322,138}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=3.13021e+07,
    UseHomotopy=true,
    Mdot_nom=2.45,
    DELTAp_lin_nom=50000,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{306,-126},{286,-106}})));
 Components.Valve_lin             valve3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Afull=0.000125,
    Mdot_nom=0.1,
    DELTAp_nom=50000)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={150,90})));

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
        origin={261,24})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={272,-36})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={278,96})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=140.2e3,
    X_pp0=1,
    V_dot_max=0.0047,
    M_dot_start=2.93,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{224,-44},{204,-24}})));
 Components.Valve_lin             valve4(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.5,
    Afull=0.0001555,
    Mdot_nom=3.68,
    DELTAp_nom=50000)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={176,14})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    L_lstart=0.99,
    V_tank=0.5,
    p_ext=350000,
    Tstart=518.15,
    pstart=350000)
    annotation (Placement(transformation(extent={{208,60},{228,80}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP4(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.66623e+08,
    UseHomotopy=true,
    Mdot_nom=0.25,
    DELTAp_lin_nom=50000,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{170,-82},{150,-62}})));
equation
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-173,16},{-130,16},{-130,-14},{-115.2,-14},{-115.2,-13.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-173,-18},{-138,-18},{-138,-27.0909},{-115.667,-27.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-173,-46},{-142,-46},{-142,-41.0909},{-115.667,-41.0909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-173,-80},{-130,-80},{-130,-54.1364},{-115.9,-54.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-171,-118},{-142,-118},{-142,-67.8182},{-115.667,-67.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-92.8,-78.6364},{-92.8,-118.6},{98.4,-118.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, valve.cmd) annotation (Line(
      points={{33,-42},{39.25,-42},{39.25,-50},{49.8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{57,-59},{57,-118.6},{98.4,-118.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, valve.OutFlow) annotation (Line(
      points={{5,14},{57,14},{57,-41}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.InFlow, dP2.InFlow) annotation (Line(
      points={{-10,111},{-10,162},{21,162}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-161.3,93},{-154,93},{-154,92},{-137.8,92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP2.InFlow,valve2. InFlow) annotation (Line(
      points={{21,162},{-10,162},{-10,111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.OutFlow,pump. InFlow) annotation (Line(
      points={{-10,93},{-10,48.5},{-58.8,48.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
      points={{-120.64,67},{-120.64,55.4},{-71.6,55.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2,valve2. InFlow) annotation (Line(
      points={{-120.12,116.5},{-118,116.5},{-118,162},{-10,162},{-10,111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, pump.InFlow) annotation (Line(
      points={{29,48},{18,48},{18,46},{-10,46},{-10,48},{-58.8,48.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP2.OutFlow, valve1.OutFlow) annotation (Line(
      points={{39,162},{60,162},{60,109}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.InFlow, dP1.InFlow) annotation (Line(
      points={{60,91},{60,48},{47,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
      points={{5,14},{68,14},{68,15.6},{78.2,15.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
      points={{97.8,15.6},{108,15.6},{108,48},{47,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
      points={{39,162},{80,162},{80,150},{116.2,150},{116.2,147.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const5.y,oRCunitHx. MdotWfORC) annotation (Line(
      points={{321,128},{320,128},{320,66},{326,66},{326,44.5333},{332.286,
          44.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{367,102},{380,102},{380,66},{356,66},{356,44.5333},{353.714,
          44.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tank.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{135.8,147.6},{309.143,147.6},{309.143,38.6667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, dP3.InFlow) annotation (Line(
      points={{308.286,8.84444},{308.286,-116},{305,-116}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.InFlow, dP3.OutFlow) annotation (Line(
      points={{111.2,-125.5},{126,-125.5},{126,-116},{287,-116}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{150,99},{150,150},{309.143,150},{309.143,38.6667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,hx1DInc. inlet_fl1) annotation (Line(
      points={{272,-27},{272,-18},{271,-18},{271,4.76923}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB,hx1DInc. outlet_fl1) annotation (Line(
      points={{278,87.6},{278,70},{271,70},{271,43.2308}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl2, pump1.InFlow) annotation (Line(
      points={{249.4,5.15385},{249.4,-33.5},{221.2,-33.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve4.InFlow, pump1.OutFlow) annotation (Line(
      points={{176,5},{176,-26.6},{208.4,-26.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.OutFlow, Tank2.InFlow) annotation (Line(
      points={{150,81},{150,61.6},{208.2,61.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve4.OutFlow, Tank2.InFlow) annotation (Line(
      points={{176,23},{176,61.6},{208.2,61.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank2.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
      points={{227.8,61.6},{249,61.6},{249,42.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, dP4.InFlow) annotation (Line(
      points={{208.4,-26.6},{180,-26.6},{180,-72},{169,-72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP4.OutFlow, dP3.OutFlow) annotation (Line(
      points={{151,-72},{142,-72},{142,-98},{202,-98},{202,-116},{287,-116}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-90,-8.63636},{-90,20},{-83,20},{-83,13.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
      points={{-69,13.2},{-26,13.2},{-26,14},{-13,14}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-200,-180},{420,200}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=5000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-200,-180},{420,200}})));
end Test_SF_ByPassBiomassORCHx;
