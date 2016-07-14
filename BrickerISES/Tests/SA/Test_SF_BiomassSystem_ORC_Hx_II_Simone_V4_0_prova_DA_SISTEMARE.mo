within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_0_prova_DA_SISTEMARE

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
        origin={-139,26})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=575410,
    V_dot_max=0.02625,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-88,-16},{-108,4}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-45,24})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-132,78},{-154,92}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-212,-122},{-202,-112}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-196,-108},{-184,-96}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-214,-90},{-204,-80}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.5,
    hstart=3.46e5,
    V_dot_max=0.00319445,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-90,-184},{-110,-164}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-116})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-160,-74},{-184,-56}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-68,-120})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=528, uLow=518)
    annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9.5,-8.5},{9.5,8.5}},
        rotation=0,
        origin={26.5,-76.5})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-44,-174})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-150,-20},{-124,-38}})));
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
    annotation (Placement(transformation(extent={{-154,-150},{-112,-80}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-44,-76})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=100,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{50,-78},{70,-58}})));
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
    annotation (Placement(transformation(extent={{166,-64},{226,-20}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{238,20},{222,36}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{206,22},{192,36}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.9,
    hstart=361133,
    V_dot_max=0.0064,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{70,-190},{50,-170}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={164,-132})));
  ThermoCycle.Components.Units.ControlSystems.PID pID(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=-0.1) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-20,-56})));
  Modelica.Blocks.Sources.Constant const3(k=511)
    annotation (Placement(transformation(extent={{-68,-46},{-52,-30}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut1(
                                                  redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{6,-50},{34,-32}})));
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
        origin={-205,46})));
  Modelica.Blocks.Sources.Constant const4(k=533)
    annotation (Placement(transformation(extent={{-242,54},{-228,68}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 1000,0; 1001,400;
        3000,400; 3001,550; 5000,550; 5001,550; 7000,550; 7001,550; 9000,550;
        9001,0; 10000,0])
    annotation (Placement(transformation(extent={{-212,-154},{-198,-140}})));
  Modelica.Fluid.Sensors.Temperature Inlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{70,88},{42,106}})));
  Modelica.Fluid.Sensors.Temperature Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{190,-100},{214,-84}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={164,-157})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_Bm_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-13,12},{13,-12}},
        rotation=0,
        origin={-95,60})));
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
    annotation (Placement(transformation(extent={{198,158},{218,178}})));
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
        origin={240.5,142.5})));
 BrickerISES.Components.Valve_lin ValveSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Mdot_nom=0.1,
    Xopen=0.0001,
    Afull=4e-05,
    DELTAp_nom=50000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,124})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-10},{9,10}},
        rotation=-90,
        origin={156,69})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation_HEX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{11,-12},{-11,12}},
        rotation=-90,
        origin={156,131})));
 BrickerISES.Components.Valve_lin ValveSF2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Mdot_nom=0.4,
    Afull=8.7971e-04,
    Xopen=0.0001) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={12,30})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-19,61})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    CSmin=0.001,
    Kp=0.1)  annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=0,
        origin={5,83})));
  Modelica.Blocks.Sources.Constant const6(k=518)
    annotation (Placement(transformation(extent={{64,128},{50,142}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_mix(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={74,65})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={42,66})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=90,
        origin={245,106})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=50,
    p=100000,
    T_0=308.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={378,82})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={380,182})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water1(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={378,111})));
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(redeclare package
      Medium1 = ThermoCycle.Media.Water, redeclare package Medium2 =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={341,145})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump4(
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.9,
    hstart=361133,
    redeclare package Medium = ThermoCycle.Media.Water,
    V_dot_max=0.08,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{290,168},{310,188}})));
equation
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-143.34,2},{-143.34,1.4},{-103.6,1.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-180.4,-65},{-208,-65},{-236,-65},{-236,-66},{-236,-184},{-193.2,
          -184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-68,-130},{-68,-173.5},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollector_Soltigua.InFlow, pump1.OutFlow) annotation (Line(
      points={{-128.8,-150.636},{-128.8,-166.6},{-105.6,-166.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y,solarCollector_Soltigua. v_wind) annotation (Line(
      points={{-203.5,-85},{-152,-85},{-152,-85.7273},{-151.2,-85.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y,solarCollector_Soltigua. Theta) annotation (Line(
      points={{-183.4,-102},{-154,-102},{-154,-99.0909},{-151.667,-99.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y,solarCollector_Soltigua. Tamb) annotation (Line(
      points={{-201.5,-117},{-160,-117},{-160,-113.091},{-151.667,-113.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y,solarCollector_Soltigua. Defocusing) annotation (Line(
      points={{-179.4,-184},{-166,-184},{-166,-139.818},{-151.667,-139.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollector_Soltigua.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-126,-80.6364},{-126,-76},{-68,-76},{-68,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port,solarCollector_Soltigua. OutFlow) annotation (Line(
      points={{-172,-74},{-126,-74},{-126,-80.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-49.4,-76},{-68,-76},{-68,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-38.6,-76},{17,-76},{17,-76.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{36,-76.5},{43.5,-76.5},{43.5,-76.4},{50.2,-76.4}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{191.3,29},{188.286,29},{188.286,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-54,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{54.4,-172.6},{-4,-172.6},{-4,-174},{-34,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{164.286,-57.1556},{164.286,-104.578},{164,-104.578},{164,-126.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-34,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, pump.OutFlow) annotation (Line(
      points={{-137,-20},{-146,-20},{-146,1.4},{-103.6,1.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-51.2,-38},{-38.75,-38},{-38.75,-52.8},{-28,-52.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-11.52,-56},{-8,-56},{-8,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut1.port, massFlowRate3.port_a) annotation (Line(
      points={{20,-50},{2,-50},{2,-76},{17,-76},{17,-76.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-227.3,61},{-222.75,61},{-222.75,48.4},{-210,48.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS, flow1DIncHeatInput.u) annotation (Line(
      points={{-199.7,46},{-188,46},{-188,26},{-163.8,26}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-127.9,-29},{-104,-29},{-104,-59.2},{-28,-59.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, pump.InFlow) annotation (Line(
      points={{69.8,-76.4},{76,-76.4},{76,-8},{-90.8,-8},{-90.8,-5.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-45,12},{-45,-8},{-90.8,-8},{-90.8,-5.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable.y, solarCollector_Soltigua.DNI) annotation (Line(
      points={{-197.3,-147},{-172,-147},{-172,-126.136},{-151.9,-126.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, Mflow_orc.port_a) annotation (Line(
      points={{164,-137.4},{164,-150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_orc.port_b, pump2.InFlow) annotation (Line(
      points={{164,-164},{162,-164},{162,-172},{67.2,-172},{67.2,-179.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_Bm_out.port_a) annotation (Line(
      points={{-142.72,49.52},{-142,49.52},{-142,60},{-108,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, Mflow_Bm_out.port_b) annotation (Line(
      points={{-45,36},{-44,36},{-44,60},{-82,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{213.6,175.4},{235.192,175.4},{235.192,153.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.OutFlow, pump3.InFlow) annotation (Line(
      points={{110,133},{110,168.5},{200.8,168.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_a, Mflow_HEX.port_a) annotation (Line(
      points={{156,120},{156,78}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_b, pump3.InFlow) annotation (Line(
      points={{156,142},{156,168.5},{200.8,168.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF2.InFlow, pump.InFlow) annotation (Line(
      points={{12,21},{12,-8},{-90.8,-8},{-90.8,-5.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, pID3.PV) annotation (Line(
      points={{49.3,135},{32,135},{32,80.2},{12,80.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID3.CS, ValveSF2.cmd) annotation (Line(
      points={{-2.42,83},{-4,83},{-4,30},{4,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DpSF2.InFlow, Mflow_Bm_out.port_b) annotation (Line(
      points={{-25.3,61},{-56,61},{-56,60},{-82,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate_mix.port_b, oRCunitHx.InletSf) annotation (Line(
      points={{81,65},{110,65},{110,-28},{166,-28},{166,-27.3333},{165.143,
          -27.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF3.OutFlow, massFlowRate_mix.port_a) annotation (Line(
      points={{47.4,66},{56,66},{56,65},{67,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF2.OutFlow, DpSF3.InFlow) annotation (Line(
      points={{-12.7,61},{12,61},{12,66},{36.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF2.OutFlow, DpSF3.InFlow) annotation (Line(
      points={{12,39},{12,66},{36.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Inlet_orc.port, massFlowRate_mix.port_a) annotation (Line(
      points={{56,88},{56,65},{67,65}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Inlet_orc.T, pID3.SP) annotation (Line(
      points={{46.2,97},{22,97},{22,85.8},{12,85.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, Mflow_HEX_water1.port_a) annotation (Line(
      points={{378,91},{378,104}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, pump4.InFlow) annotation (Line(
      points={{244.923,153.654},{244,153.654},{244,178.5},{292.8,178.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump4.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
      points={{305.6,185.4},{305.6,186},{335,186},{335,154.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl1, sinkP1.flangeB) annotation (Line(
      points={{346,155},{346,164},{380,164},{380,173.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.inlet_fl1, Mflow_HEX_water1.port_b) annotation (Line(
      points={{346,135},{346,122},{378,122},{378,118}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water.port_b, hx1DInc1.inlet_fl1) annotation (Line(
      points={{245,116},{244.923,116},{244.923,131.346}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, Mflow_HEX.port_a) annotation (Line(
      points={{235.369,131.569},{235.369,122},{186,122},{186,78},{156,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX.port_b, pump2.InFlow) annotation (Line(
      points={{156,60},{154,60},{154,16},{118,16},{118,-172},{67.2,-172},{67.2,
          -179.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{221.2,28},{209.714,28},{209.714,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ValveSF1.InFlow, massFlowRate_mix.port_b) annotation (Line(
      points={{110,115},{110,65},{81,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{202,-100},{164,-100},{164,-104},{164,-126},{164,-126},{164,
          -126.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-143,78},{-143,64},{-142.72,64},{-142.72,49.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-150.7,85},{-250,85},{-250,43.6},{-210,43.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl2, Mflow_HEX_water.port_a) annotation (Line(
      points={{335.2,135.2},{334,135.2},{334,74},{244,74},{244,96},{245,96}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{420,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{420,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_0_prova_DA_SISTEMARE;
