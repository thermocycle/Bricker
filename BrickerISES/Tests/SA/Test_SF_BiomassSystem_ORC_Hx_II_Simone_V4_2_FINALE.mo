within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_2_FINALE

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
        origin={-135,20})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=575410,
    X_pp0=0.5,
    V_dot_max=0.0263,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-100,-26},{-120,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-17,-15},{17,15}},
        rotation=-90,
        origin={-53,19})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,70},{-126,84}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-196,-108},{-186,-98}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-196,-90},{-184,-78}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-196,-70},{-186,-60}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.5,
    hstart=3.46e5,
    V_dot_max=0.0064,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-86,-166},{-106,-146}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={4,-98})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-144,-174},{-128,-160}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-156,-56},{-174,-40}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-64,-102})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=528, uLow=518)
    annotation (Placement(transformation(extent={{-188,-172},{-176,-160}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-14.5,-6.5},{14.5,6.5}},
        rotation=0,
        origin={27.5,-58.5})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-40,-156})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-144,-24},{-126,-40}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollector_Soltigua(
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
    annotation (Placement(transformation(extent={{-150,-132},{-108,-62}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-58})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=2,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{56,-60},{76,-40}})));
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
    annotation (Placement(transformation(extent={{170,-46},{230,-2}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{218,24},{228,34}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{206,26},{196,36}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.9,
    hstart=361133,
    V_dot_max=0.0065,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{138,-174},{118,-154}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={168,-114})));
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
        origin={-17,-46})));
  Modelica.Blocks.Sources.Constant const3(k=512)
    annotation (Placement(transformation(extent={{-68,-36},{-56,-24}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-8,-50},{20,-32}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.3,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-9,-10},{9,10}},
        rotation=0,
        origin={-201,50})));
  Modelica.Blocks.Sources.Constant const4(k=518)
    annotation (Placement(transformation(extent={{-226,62},{-216,72}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{194,-78},{218,-62}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={168,-138})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_Bm_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11.5,10.5},{11.5,-10.5}},
        rotation=0,
        origin={-99.5,56.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=15,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={230,64})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={310,164})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump_HEX_oil(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=3.9,
    hstart=145528,
    V_dot_max=0.00988,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{160,144},{190,174}})));
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
        origin={204.5,126.5})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={112,-58})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation_HEX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{19,-20},{-19,20}},
        rotation=-90,
        origin={144,113})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{284,112},{246,134}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,8; 2000,11; 2001,11;
        7000,11; 7001,15; 9000,15])
    annotation (Placement(transformation(extent={{312,32},{298,46}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_BM_mix(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-14,-10},{14,10}},
        rotation=0,
        origin={-12,58})));
  ThermoCycle.Components.Units.ControlSystems.PID pID2(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.001,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=0,
        origin={31,131})));
  Modelica.Blocks.Sources.Constant const5(k=69.85 + 273.15)
    annotation (Placement(transformation(extent={{-10,156},{0,166}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{280,158},{240,180}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={230,93})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_in_BM2(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{21.5,-13},{-21.5,13}},
        rotation=0,
        origin={29.5,-3})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{24,66},{52,84}})));
  Modelica.Blocks.Sources.TimeTable timeTable2(table=[0,0; 1000,0; 1001,400;
        3000,400; 3001,550; 5000,550; 5001,550; 6000,550; 6001,400; 9000,400;
        9001,0; 10000,0])
    annotation (Placement(transformation(extent={{-196,-140},{-182,-126}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{184,194},{212,212}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{144,46},{178,66}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump_HEX_oil1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=3.9,
    hstart=145528,
    V_dot_max=0.0015,
    p_su_start=350000) annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={83,131})));
equation
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-139.34,-4},{-139.34,-8.6},{-115.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-171.3,-48},{-204,-48},{-204,-166},{-189.2,-166}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-64,-112},{-64,-155.5},{-88.8,-155.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-136,-174},{-136,-176},{-116,-176},{-116,-148.6},{-101.6,-148.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollector_Soltigua.InFlow, pump1.OutFlow) annotation (Line(
      points={{-124.8,-132.636},{-124.8,-148.6},{-101.6,-148.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y,solarCollector_Soltigua. v_wind) annotation (Line(
      points={{-185.5,-65},{-148,-65},{-148,-67.7273},{-147.2,-67.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y,solarCollector_Soltigua. Theta) annotation (Line(
      points={{-183.4,-84},{-150,-84},{-150,-81.0909},{-147.667,-81.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y,solarCollector_Soltigua. Tamb) annotation (Line(
      points={{-185.5,-103},{-156,-103},{-156,-95.0909},{-147.667,-95.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y,solarCollector_Soltigua. Defocusing) annotation (Line(
      points={{-175.4,-166},{-162,-166},{-162,-121.818},{-147.667,-121.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollector_Soltigua.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-122,-62.6364},{-122,-58},{-64,-58},{-64,-92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port,solarCollector_Soltigua. OutFlow) annotation (Line(
      points={{-165,-56},{-122,-56},{-122,-62.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-45.4,-58},{-64,-58},{-64,-92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-34.6,-58},{13,-58},{13,-58.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{42,-58.5},{47.5,-58.5},{47.5,-58.4},{56.2,-58.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{228.5,29},{236,29},{236,8},{213.714,8},{213.714,-3.46667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{195.5,31},{192.286,31},{192.286,-3.46667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-50,-156},{-88.8,-156},{-88.8,-155.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{122.4,-156.6},{0,-156.6},{0,-156},{-30,-156}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{168.286,-39.1556},{168.286,-86.578},{168,-86.578},{168,-108.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{4,-107},{4,-156},{-30,-156}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-34.6,-58},{4,-58},{4,-89}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, pump.OutFlow) annotation (Line(
      points={{-135,-24},{-142,-24},{-142,-8.6},{-115.6,-8.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-55.4,-30},{-26.75,-30},{-26.75,-43.6},{-22,-43.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-11.7,-46},{-4,-46},{-4,-98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, massFlowRate3.port_a) annotation (Line(
      points={{6,-50},{6,-58},{13,-58},{13,-58.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-215.5,67},{-214,67},{-214,54},{-210,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS, flow1DIncHeatInput.u) annotation (Line(
      points={{-191.46,50},{-184,50},{-184,20},{-159.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-129.3,77},{-110,77},{-110,98},{-240,98},{-240,46},{-210,46}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-128.7,-32},{-100,-32},{-100,-48.4},{-22,-48.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{206,-78},{168,-78},{168,-108.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-137,70},{-137,43.52},{-138.72,43.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, Mflow_orc.port_a) annotation (Line(
      points={{168,-119.4},{168,-130}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_orc.port_b, pump2.InFlow) annotation (Line(
      points={{168,-146},{164,-146},{164,-164},{135.2,-164},{135.2,-163.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_Bm_out.port_a) annotation (Line(
      points={{-138.72,43.52},{-138.36,43.52},{-138.36,56.5},{-111,56.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1,sinkP. flangeB) annotation (Line(
      points={{208.923,137.654},{208.923,152},{310,152},{310,155.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, Mflow_HEX_oil.port_a) annotation (Line(
      points={{199.369,115.569},{198,115.569},{198,76},{112,76},{112,-46}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_HEX_oil.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{183.4,170.1},{199.192,170.1},{199.192,137.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_a, Mflow_HEX_oil.port_a) annotation (
      Line(
      points={{144,94},{144,76},{112,76},{112,-46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_b, pump_HEX_oil.InFlow) annotation (Line(
      points={{144,132},{144,159.75},{164.2,159.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_BM_mix.port_b, oRCunitHx.InletSf) annotation (Line(
      points={{2,58},{98,58},{98,-10},{168,-10},{168,-9.33333},{169.143,
          -9.33333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{0.5,161},{8.25,161},{8.25,135.4},{20,135.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{260,158},{230,158},{230,152},{310,152},{310,155.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable1.y, sourceMdot.in_Mdot) annotation (Line(
      points={{297.3,39},{259.65,39},{259.65,58},{236,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{230,73},{230,86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water.port_b, hx1DInc1.inlet_fl1) annotation (Line(
      points={{230,100},{230,108},{208.923,108},{208.923,115.346}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, hx1DInc1.inlet_fl1) annotation (Line(
      points={{265,112},{265,108},{208.923,108},{208.923,115.346}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_in_BM2.port_b, pump.InFlow) annotation (Line(
      points={{8,-3},{-28,-3},{-28,-15.5},{-102.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_Bm_out.port_b, Mflow_BmRecirculation.port_a) annotation (Line(
      points={{-88,56.5},{-53,56.5},{-53,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, massFlowRate_in_BM2.port_a) annotation (Line(
      points={{75.8,-58.4},{75.8,-58},{84,-58},{84,-3},{51,-3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-53,2},{-53,-15.5},{-102.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, massFlowRate_BM_mix.port_b) annotation (Line(
      points={{38,66},{38,58},{2,58}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable2.y, solarCollector_Soltigua.DNI) annotation (Line(
      points={{-181.3,-133},{-170,-133},{-170,-108.136},{-147.9,-108.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_HEX_oil.port_b, MflowToSf.port_a) annotation (Line(
      points={{112,-70},{112,-130},{104,-130},{104,-156},{-30,-156}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_BM_mix.port_a, Mflow_BmRecirculation.port_a) annotation (
     Line(
      points={{-26,58},{-53,58},{-53,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{20,126.6},{-24,126.6},{-24,188},{226,188},{226,169},{246,169}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, pump_HEX_oil.OutFlow) annotation (Line(
      points={{198,194},{192,194},{192,170.1},{183.4,170.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, hx1DInc1.outlet_fl2) annotation (Line(
      points={{161,46},{198,46},{198,115.569},{199.369,115.569}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump_HEX_oil1.InFlow, massFlowRate_BM_mix.port_b) annotation (Line(
      points={{82.25,120.2},{80.125,120.2},{80.125,58},{2,58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_HEX_oil1.OutFlow, pump_HEX_oil.InFlow) annotation (Line(
      points={{71.9,139.4},{72,139.4},{72,160},{118,160},{118,159.75},{164.2,
          159.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, pump_HEX_oil1.flow_in) annotation (Line(
      points={{42.66,131},{54,131},{54,126.2},{71,126.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{340,220}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{340,220}})),
    experiment(StopTime=10000),
    __Dymola_experimentSetupOutput);
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_2_FINALE;
