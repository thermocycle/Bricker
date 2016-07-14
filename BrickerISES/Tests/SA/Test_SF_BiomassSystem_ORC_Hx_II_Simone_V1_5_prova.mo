within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V1_5_prova

  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-80,18})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{-122,38},{-102,58}})));
  BrickerISES.Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    Mdotnom=9.4,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    Unom=1000,
    QcombustionNominal=500e3,
    QcombustionStart=150e3,
    QcombustionMin=150e3,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=483.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=488.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-179,24})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=575410,
    V_dot_max=0.013507,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-146,-26},{-166,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-102,-26},{-122,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={-136,13})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-194,56},{-172,70}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,56},{-52,68}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-238,-104},{-228,-94}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-238,-86},{-226,-74}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-236,-66},{-226,-56}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    V_dot_max=0.0064588,
    M_dot_start=2.5,
    hstart=3.46e5,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-130,-162},{-150,-142}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-44,-94})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-188,-170},{-172,-156}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-200,-52},{-218,-36}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-108,-98})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-232,-168},{-220,-156}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={-24,-55})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-152})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-188,-20},{-170,-36}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    N=5,
    Ns=3,
    Nt=4,
    Mdotnom=2.5,
    Unom=1000,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15,
    pstart=550000)
    annotation (Placement(transformation(extent={{-194,-128},{-152,-58}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-84,-54})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.2,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{6,-56},{26,-36}})));
  BrickerISES.Components.ORC.ORCunitHx oRCunitHx(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    N=15,
    UnomL=1000,
    UnomTp=8000,
    UnomV=2000,
    UseT=true,
    SteadyStateTWall=true,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    MdotnomWf=2.45,
    MdotnomSf=2.8,
    MdotWf=2.8,
    UnomSf=3000,
    Asf=100,
    Awf=100,
    pStartSf=350000,
    pStartWf=2500000,
    TstartInletWf=333.15,
    TstartOutletWf=403.15,
    TstartInletSf=498.15,
    TstartOutletSf=441.15,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{72,-76},{132,-32}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{120,-6},{130,4}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{108,-4},{98,6}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.9,
    V_tank=20,
    p_ext=400000,
    Tstart=498.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{-24,46},{-4,66}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    V_dot_max=0.00753484,
    M_dot_start=2.9,
    hstart=361133,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{30,-168},{10,-148}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={156,38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={184,136})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump3(
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
    annotation (Placement(transformation(extent={{92,96},{72,116}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=270,
        origin={46,-85})));
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
    annotation (Placement(transformation(extent={{-14.5,-11.5},{14.5,11.5}},
        rotation=90,
        origin={144.5,92.5})));
 BrickerISES.Components.Valve_lin ValveSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=4e-06,
    Mdot_nom=0.1,
    Xopen=0.0001,
    DELTAp_nom=50000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={32,90})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    L_lstart=0.9,
    Mdotnom=3.9,
    V_tank=0.2,
    p_ext=350000,
    Tstart=353.15,
    pstart=350000)
    annotation (Placement(transformation(extent={{96,132},{116,152}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={72,-108})));
  ThermoCycle.Components.Units.ControlSystems.PID pID(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=-0.1) annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-61,-42})));
  Modelica.Blocks.Sources.Constant const3(k=527)
    annotation (Placement(transformation(extent={{-86,-36},{-76,-26}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut1(
                                                  redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-50,-40},{-32,-24}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 3600,0; 7200,0; 10800,
        0; 14400,0; 18000,0; 21600,0; 25200,174.53; 28800,400; 32400,700; 36000,
        850; 39600,870; 43200,800; 46800,750; 50400,600; 54000,500; 57600,300;
        61200,100; 64800,0; 68400,0; 72000,0; 75600,0; 79200,0; 82800,0; 86400,
        0])
    annotation (Placement(transformation(extent={{-238,-130},{-224,-116}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=0.1,
    CSmin=0.3)
             annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-245,44})));
  Modelica.Blocks.Sources.Constant const4(k=533)
    annotation (Placement(transformation(extent={{-278,50},{-268,60}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID2(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=-0.1) annotation (Placement(transformation(
        extent={{5,-6},{-5,6}},
        rotation=0,
        origin={-59,18})));
  Modelica.Blocks.Sources.Constant const5(k=518)
    annotation (Placement(transformation(extent={{-22,-2},{-32,8}})));
equation
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-183.34,3.55271e-015},{-183.34,-8.6},{-161.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-215.3,-44},{-232,-44},{-232,-44},{-248,-44},{-248,-162},{-233.2,
          -162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-108,-108},{-108,-151.5},{-132.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-180,-170},{-180,-172},{-160,-172},{-160,-144.6},{-145.6,
          -144.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-168.8,-128.636},{-168.8,-144.6},{-145.6,-144.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-225.5,-61},{-192,-61},{-192,-63.7273},{-191.2,-63.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-225.4,-80},{-194,-80},{-194,-77.0909},{-191.667,-77.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-227.5,-99},{-200,-99},{-200,-91.0909},{-191.667,-91.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-219.4,-162},{-206,-162},{-206,-117.818},{-191.667,-117.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-166,-58.6364},{-166,-54},{-108,-54},{-108,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-209,-52},{-166,-52},{-166,-58.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-89.4,-54},{-108,-54},{-108,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-78.6,-54},{-31,-54},{-31,-55}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
      points={{25.8,-54.4},{34,-54.4},{34,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{-17,-55},{3.5,-55},{3.5,-54.4},{6.2,-54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
      points={{-182.72,47.52},{-182.72,48},{-121,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
      points={{-183,56},{-183,48},{-121,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
      points={{-136,20},{-136,48},{-121,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-136,6},{-136,-15.5},{-148.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{-122,-16},{-136,-16},{-136,-15.5},{-148.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{130.5,-1},{138,-1},{138,-22},{115.714,-22},{115.714,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{97.5,1},{94.2857,1},{94.2857,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-94,-152},{-132.8,-152},{-132.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
      points={{-103,48},{-23.8,48},{-23.8,47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{-4.2,47.6},{71.1429,47.6},{71.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
      points={{-59,56},{-58,56},{-58,48},{-23.8,48},{-23.8,47.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{14.4,-150.6},{-44,-150.6},{-44,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
      points={{156,47},{156,58},{148,58},{148,81.3462},{148.923,81.3462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{148.923,103.654},{148.923,118},{184,118},{184,127.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
      points={{139.369,81.5692},{139.369,64},{46,64},{46,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{89.2,106.5},{90,106.5},{90,64},{46,64},{46,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.OutFlow, Tank3.InFlow) annotation (Line(
      points={{76.4,113.4},{76.4,133.6},{96.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{115.8,133.6},{139.192,133.6},{139.192,103.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{70.2857,-69.1556},{70.2857,-82.5778},{72,-82.5778},{72,-102.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(DpSF1.OutFlow, pump2.InFlow) annotation (Line(
      points={{72,-113.4},{72,-160},{27.2,-160},{27.2,-157.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump2.InFlow) annotation (Line(
      points={{46,-92},{46,-160},{27.2,-160},{27.2,-157.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-44,-103},{-44,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-78.6,-54},{-44,-54},{-44,-85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{32,81},{32,48},{71.1429,48},{71.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.OutFlow, Tank3.InFlow) annotation (Line(
      points={{32,99},{32,134},{78,134},{78,133.6},{96.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, pump.OutFlow) annotation (Line(
      points={{-179,-20},{-186,-20},{-186,-8.6},{-161.6,-8.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-75.5,-31},{-70.75,-31},{-70.75,-39.6},{-66,-39.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-55.7,-42},{-52,-42},{-52,-94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut1.port, massFlowRate3.port_a) annotation (Line(
      points={{-41,-40},{-38,-40},{-38,-54},{-31,-54},{-31,-55}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-223.3,-123},{-212,-123},{-212,-104.136},{-191.9,-104.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-267.5,55},{-262.75,55},{-262.75,46.4},{-250,46.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS, flow1DIncHeatInput.u) annotation (Line(
      points={{-239.7,44},{-228,44},{-228,24},{-203.8,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-175.3,63},{-156,63},{-156,80},{-288,80},{-288,41.6},{-250,41.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-172.7,-28},{-144,-28},{-144,-44.4},{-66,-44.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID2.CS, valve.cmd) annotation (Line(
      points={{-64.3,18},{-72,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.T, pID2.SP) annotation (Line(
      points={{-54.1,62},{-48,62},{-48,20.4},{-54,20.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, pID2.PV) annotation (Line(
      points={{-32.5,3},{-32.5,8},{-46,8},{-46,15.6},{-54,15.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
      points={{-80,9},{-80,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, Tank2.InFlow) annotation (Line(
      points={{-80,27},{-80,48},{-23.8,48},{-23.8,47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{240,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{240,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V1_5_prova;
