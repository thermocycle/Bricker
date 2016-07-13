within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_0_prova

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
        origin={-139,2})));

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
    annotation (Placement(transformation(extent={{-104,-44},{-124,-24}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-57,4})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-152,52},{-130,66}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-198,-126},{-188,-116}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-198,-108},{-186,-96}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-196,-88},{-186,-78}})));
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
    annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
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
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={16,-77})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-44,-174})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-42},{-130,-58}})));
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
    annotation (Placement(transformation(extent={{46,-78},{66,-58}})));
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
    annotation (Placement(transformation(extent={{212,-2},{222,8}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{202,-4},{192,6}})));
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
    annotation (Placement(transformation(extent={{124,-190},{104,-170}})));
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
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-21,-64})));
  Modelica.Blocks.Sources.Constant const3(k=528)
    annotation (Placement(transformation(extent={{-46,-58},{-36,-48}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut1(
                                                  redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,-62},{18,-44}})));
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
        origin={-205,22})));
  Modelica.Blocks.Sources.Constant const4(k=533)
    annotation (Placement(transformation(extent={{-238,28},{-228,38}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 1000,0; 1001,400;
        3000,400; 3001,550; 5000,550; 5001,550; 7000,550; 7001,550; 9000,550;
        9001,0; 10000,0])
    annotation (Placement(transformation(extent={{-204,-156},{-190,-142}})));
  Modelica.Fluid.Sensors.Temperature Inlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{30,52},{6,68}})));
  Modelica.Fluid.Sensors.Temperature Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{120,-94},{144,-78}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={164,-157})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_Bm_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11.5,10.5},{11.5,-10.5}},
        rotation=0,
        origin={-103.5,38.5})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-18,40})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_mix(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={52,39})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=15,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={232,40})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={312,140})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump_HEX_oil(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=3.9,
    hstart=145528,
    V_dot_max=0.00938,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{166,120},{184,138}})));
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc2(
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
        origin={206.5,102.5})));
 BrickerISES.Components.Valve_lin Valve_HEX(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Mdot_nom=0.1,
    Xopen=0.0001,
    Afull=4e-05,
    DELTAp_nom=50000) annotation (Placement(transformation(
        extent={{-13,-12},{13,12}},
        rotation=90,
        origin={86,97})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={136,22})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation_HEX1(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={151,89})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet1(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{286,88},{248,110}})));
  Modelica.Blocks.Sources.TimeTable timeTable3(table=[0,10; 2000,10; 2001,12;
        8000,12; 8001,12; 9000,12])
    annotation (Placement(transformation(extent={{314,8},{300,22}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID4(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=0.1,
    CSmin=0.001)
             annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={33,96})));
  Modelica.Blocks.Sources.Constant const7(k=333)
    annotation (Placement(transformation(extent={{-8,132},{2,142}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet1(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{274,134},{234,156}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water1(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={232,69})));
equation
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-143.34,-22},{-143.34,-26.6},{-119.6,-26.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
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
      points={{-185.5,-83},{-152,-83},{-152,-85.7273},{-151.2,-85.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y,solarCollector_Soltigua. Theta) annotation (Line(
      points={{-185.4,-102},{-154,-102},{-154,-99.0909},{-151.667,-99.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y,solarCollector_Soltigua. Tamb) annotation (Line(
      points={{-187.5,-121},{-160,-121},{-160,-113.091},{-151.667,-113.091}},
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
      points={{-169,-74},{-126,-74},{-126,-80.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-49.4,-76},{-68,-76},{-68,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-38.6,-76},{9,-76},{9,-77}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{23,-77},{43.5,-77},{43.5,-76.4},{46.2,-76.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{222.5,3},{232,3},{232,-10},{209.714,-10},{209.714,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{191.5,1},{188.286,1},{188.286,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-54,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{108.4,-172.6},{-4,-172.6},{-4,-174},{-34,-174}},
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
      points={{-139,-42},{-146,-42},{-146,-26.6},{-119.6,-26.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-35.5,-53},{-30.75,-53},{-30.75,-61.6},{-26,-61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-64},{-8,-64},{-8,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut1.port, massFlowRate3.port_a) annotation (Line(
      points={{4,-62},{2,-62},{2,-76},{9,-76},{9,-77}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-227.5,33},{-222.75,33},{-222.75,24.4},{-210,24.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS, flow1DIncHeatInput.u) annotation (Line(
      points={{-199.7,22},{-188,22},{-188,2},{-163.8,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-133.3,59},{-118,59},{-118,84},{-248,84},{-248,19.6},{-210,19.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-132.7,-50},{-104,-50},{-104,-66.4},{-26,-66.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, pump.InFlow) annotation (Line(
      points={{65.8,-76.4},{76,-76.4},{76,-32},{-106.8,-32},{-106.8,-33.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-57,-8},{-57,-32},{-106.8,-32},{-106.8,-33.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable.y, solarCollector_Soltigua.DNI) annotation (Line(
      points={{-189.3,-149},{-172,-149},{-172,-126.136},{-151.9,-126.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{132,-94},{164,-94},{164,-126.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-141,52},{-141,25.52},{-142.72,25.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, Mflow_orc.port_a) annotation (Line(
      points={{164,-137.4},{164,-150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_orc.port_b, pump2.InFlow) annotation (Line(
      points={{164,-164},{162,-164},{162,-172},{121.2,-172},{121.2,-179.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_Bm_out.port_a) annotation (Line(
      points={{-142.72,25.52},{-132.36,25.52},{-132.36,38.5},{-115,38.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, Mflow_Bm_out.port_b) annotation (Line(
      points={{-57,16},{-56,16},{-56,38.5},{-92,38.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF2.InFlow, Mflow_Bm_out.port_b) annotation (Line(
      points={{-23.4,40},{-40,40},{-40,38},{-56,38},{-56,38.5},{-92,38.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate_mix.port_b, oRCunitHx.InletSf) annotation (Line(
      points={{59,39},{90,39},{90,-26},{128,-26},{128,-27.3333},{165.143,
          -27.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF2.OutFlow, massFlowRate_mix.port_a) annotation (Line(
      points={{-12.6,40},{16,40},{16,39},{45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Inlet_orc.port, massFlowRate_mix.port_a) annotation (Line(
      points={{18,52},{18,40},{16,40},{16,39},{45,39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hx1DInc2.outlet_fl1, sinkP1.flangeB) annotation (Line(
      points={{210.923,113.654},{210.923,128},{312,128},{312,131.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc2.outlet_fl2, Mflow_HEX_oil.port_a) annotation (Line(
      points={{201.369,91.5692},{200,91.5692},{200,52},{136,52},{136,34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_HEX_oil.OutFlow, hx1DInc2.inlet_fl2) annotation (Line(
      points={{180.04,135.66},{201.192,135.66},{201.192,113.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Valve_HEX.OutFlow, pump_HEX_oil.InFlow) annotation (Line(
      points={{86,108.7},{86,129.45},{168.52,129.45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX1.port_a, Mflow_HEX_oil.port_a) annotation (
      Line(
      points={{151,72},{151,52},{136,52},{136,34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX1.port_b, pump_HEX_oil.InFlow) annotation (
      Line(
      points={{151,106},{151,129.45},{168.52,129.45}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const7.y, pID4.SP) annotation (Line(
      points={{2.5,137},{10.25,137},{10.25,98.4},{28,98.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID4.CS, Valve_HEX.cmd) annotation (Line(
      points={{38.3,96},{50,96},{50,97},{76.4,97}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet1.port, sinkP1.flangeB) annotation (Line(
      points={{254,134},{232,134},{232,128},{312,128},{312,131.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable3.y, sourceMdot1.in_Mdot) annotation (Line(
      points={{299.3,15},{261.65,15},{261.65,34},{238,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, Mflow_HEX_water1.port_a) annotation (Line(
      points={{232,49},{232,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water1.port_b, hx1DInc2.inlet_fl1) annotation (Line(
      points={{232,76},{232,84},{210.923,84},{210.923,91.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet1.port, hx1DInc2.inlet_fl1) annotation (Line(
      points={{267,88},{267,84},{210.923,84},{210.923,91.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet1.T, pID4.PV) annotation (Line(
      points={{253.7,99},{222,99},{222,144},{16,144},{16,93.6},{28,93.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Valve_HEX.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{86,85.3},{88,85.3},{88,40},{90,40},{90,-26},{128,-26},{128,
          -27.3333},{165.143,-27.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -220},{540,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -220},{540,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V4_0_prova;
