within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V3_9_prova

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
    eta_is=0.7,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=575410,
    X_pp0=0.5,
    V_dot_max=0.0263,
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
    V_dot_max=0.0064,
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
    V_tank=2,
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
    annotation (Placement(transformation(extent={{214,6},{224,16}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{202,8},{192,18}})));
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
    annotation (Placement(transformation(extent={{128,-192},{108,-172}})));
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
    annotation (Placement(transformation(extent={{-50,-60},{-38,-48}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,-62},{18,-44}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.3,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-205,22})));
  Modelica.Blocks.Sources.Constant const4(k=533)
    annotation (Placement(transformation(extent={{-236,32},{-226,42}})));
  Modelica.Fluid.Sensors.Temperature T_Inlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{60,56},{36,72}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{190,-96},{214,-80}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={164,-156})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_Bm_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11.5,10.5},{11.5,-10.5}},
        rotation=0,
        origin={-103.5,38.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=15,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={226,46})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={306,146})));
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
    annotation (Placement(transformation(extent={{160,126},{178,144}})));
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
        origin={200.5,108.5})));
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
        origin={80,103})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={130,28})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation_HEX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={145,95})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{280,94},{242,116}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,10; 2000,10; 2001,12;
        8000,12; 8001,12; 9000,12])
    annotation (Placement(transformation(extent={{308,14},{294,28}})));
 BrickerISES.Components.Valve_lin ValveSF2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Mdot_nom=0.4,
    UseNom=false,
    Xopen=0.074,
    DELTAp_nom=0,
    Afull=9.5e-03) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={12,8})));
  Modelica.Blocks.Sources.Constant const6(k=518)
    annotation (Placement(transformation(extent={{6,72},{16,82}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_mix(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9.5,-6.5},{9.5,6.5}},
        rotation=0,
        origin={71.5,40.5})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={42,42})));
  ThermoCycle.Components.Units.ControlSystems.PID pID2(
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
        origin={27,102})));
  Modelica.Blocks.Sources.Constant const5(k=333)
    annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{268,140},{228,162}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={226,75})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_totBM(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{7,-6},{-7,6}},
        rotation=0,
        origin={48,-33})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_in_BM2(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{9.5,-6.5},{-9.5,6.5}},
        rotation=0,
        origin={-6.5,-21.5})));
  Modelica.Fluid.Sensors.Temperature TempBM_in2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-104,68},{-76,86}})));
  Modelica.Fluid.Sensors.Temperature TempBM_out2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,68},{-38,86}})));
  Modelica.Fluid.Sensors.Temperature TempBM_out3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-30,2},{-8,16}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID4(
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
        origin={13,60})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF4(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-64,-18})));
  Modelica.Blocks.Sources.Constant DNI(k=500)
    annotation (Placement(transformation(extent={{-198,-154},{-188,-144}})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{44,8},{64,28}})));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{62,-22},{82,-2}})));
 BrickerISES.Components.Valve_lin ValveSF3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Mdot_nom=0.4,
    UseNom=false,
    DELTAp_nom=0,
    Afull=9e-03,
    Xopen=0.99) annotation (Placement(transformation(
        extent={{8,9},{-8,-9}},
        rotation=180,
        origin={-20,43})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmin=0.0004,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Ti=1,
    Kp=0.1)  annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-31,110})));
  Modelica.Blocks.Sources.Constant const7(k=518)
    annotation (Placement(transformation(extent={{-56,124},{-46,134}})));
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
      points={{224.5,11},{232,11},{232,-10},{209.714,-10},{209.714,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{191.5,13},{188.286,13},{188.286,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-54,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{112.4,-174.6},{-4,-174.6},{-4,-174},{-34,-174}},
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
      points={{-37.4,-54},{-30.75,-54},{-30.75,-61.6},{-26,-61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-64},{-8,-64},{-8,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, massFlowRate3.port_a) annotation (Line(
      points={{4,-62},{2,-62},{2,-76},{9,-76},{9,-77}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-225.5,37},{-218,37},{-218,24.4},{-210,24.4}},
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
  connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{202,-96},{164,-96},{164,-126.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-141,52},{-141,25.52},{-142.72,25.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, Mflow_orc.port_a) annotation (Line(
      points={{164,-137.4},{164,-148}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_orc.port_b, pump2.InFlow) annotation (Line(
      points={{164,-164},{162,-164},{162,-172},{125.2,-172},{125.2,-181.5}},
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
  connect(hx1DInc1.outlet_fl1,sinkP. flangeB) annotation (Line(
      points={{204.923,119.654},{204.923,134},{306,134},{306,137.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, Mflow_HEX_oil.port_a) annotation (Line(
      points={{195.369,97.5692},{194,97.5692},{194,58},{130,58},{130,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_HEX_oil.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{174.04,141.66},{195.192,141.66},{195.192,119.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Valve_HEX.OutFlow, pump_HEX_oil.InFlow) annotation (Line(
      points={{80,114.7},{80,135.45},{162.52,135.45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_a, Mflow_HEX_oil.port_a) annotation (
      Line(
      points={{145,78},{145,58},{130,58},{130,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation_HEX.port_b, pump_HEX_oil.InFlow) annotation (Line(
      points={{145,112},{145,135.45},{162.52,135.45}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_mix.port_b, Valve_HEX.InFlow) annotation (Line(
      points={{81,40.5},{81,65.5},{80,65.5},{80,91.3}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_mix.port_b, oRCunitHx.InletSf) annotation (Line(
      points={{81,40.5},{94,40.5},{94,-28},{164,-28},{164,-27.3333},{165.143,
          -27.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF3.OutFlow, massFlowRate_mix.port_a) annotation (Line(
      points={{47.4,42},{56,42},{56,40.5},{62,40.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(T_Inlet_orc.port, massFlowRate_mix.port_a) annotation (Line(
      points={{48,56},{50,56},{50,50},{56,50},{56,40.5},{62,40.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-3.5,143},{4.25,143},{4.25,104.4},{22,104.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID2.CS, Valve_HEX.cmd) annotation (Line(
      points={{32.3,102},{44,102},{44,103},{70.4,103}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{248,140},{226,140},{226,134},{306,134},{306,137.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable1.y, sourceMdot.in_Mdot) annotation (Line(
      points={{293.3,21},{255.65,21},{255.65,40},{232,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{226,55},{226,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water.port_b, hx1DInc1.inlet_fl1) annotation (Line(
      points={{226,82},{226,90},{204.923,90},{204.923,97.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, hx1DInc1.inlet_fl1) annotation (Line(
      points={{261,94},{261,90},{204.923,90},{204.923,97.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.T, pID2.PV) annotation (Line(
      points={{247.7,105},{216,105},{216,150},{10,150},{10,99.6},{22,99.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_HEX_oil.port_b, MflowToSf.port_a) annotation (Line(
      points={{130,16},{130,2},{108,2},{108,-174},{-4,-174},{-4,-174},{-34,-174}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(pID4.CS, ValveSF2.cmd) annotation (Line(
      points={{7.7,60},{0,60},{0,14},{4,14},{4,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, DpSF4.InFlow) annotation (Line(
      points={{-57,-8},{-64,-8},{-64,-12.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, massFlowRate_totBM.port_a) annotation (Line(
      points={{65.8,-76.4},{65.8,-53.2},{55,-53.2},{55,-33}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF2.OutFlow, DpSF3.InFlow) annotation (Line(
      points={{12,17},{24,17},{24,42},{36.6,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarCollector_Soltigua.DNI) annotation (Line(
      points={{-187.5,-149},{-169.75,-149},{-169.75,-126.136},{-151.9,-126.136}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(ValveSF2.InFlow, massFlowRate_totBM.port_b) annotation (Line(
      points={{12,-1},{14,-1},{14,-33},{41,-33}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF4.OutFlow, pump.InFlow) annotation (Line(
      points={{-64,-23.4},{-64,-34},{-106.8,-33.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempBM_out3.port, ValveSF2.InFlow) annotation (Line(
      points={{-19,2},{-4,2},{-4,-1},{12,-1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressure1.port, massFlowRate_totBM.port_b) annotation (Line(
      points={{72,-22},{34,-22},{34,-14},{14,-14},{14,-33},{41,-33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressure.port, DpSF3.InFlow) annotation (Line(
      points={{54,8},{38,8},{38,20},{24,20},{24,42},{36.6,42}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(massFlowRate_in_BM2.port_a, massFlowRate_totBM.port_b) annotation (
      Line(
      points={{3,-21.5},{3,-32},{14,-32},{14,-33},{41,-33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID3.CS, ValveSF3.cmd) annotation (Line(
      points={{-25.7,110},{-20,110},{-20,50.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const7.y, pID3.SP) annotation (Line(
      points={{-45.5,129},{-42,129},{-42,112.4},{-36,112.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ValveSF3.InFlow, Mflow_Bm_out.port_b) annotation (Line(
      points={{-27.2,43},{-56,43},{-56,38.5},{-92,38.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF3.OutFlow, DpSF3.InFlow) annotation (Line(
      points={{-12.8,43},{24,43},{24,42},{36.6,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempBM_out2.port, ValveSF3.InFlow) annotation (Line(
      points={{-52,68},{-46,68},{-46,62},{-27.2,62},{-27.2,43}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_Inlet_orc.T, pID3.PV) annotation (Line(
      points={{39.6,64},{28,64},{28,90},{-26,90},{-26,98},{-40,98},{-40,107.6},
          {-36,107.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const6.y, pID4.SP) annotation (Line(
      points={{16.5,77},{22,77},{22,62.4},{18,62.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID4.PV, T_Inlet_orc.T) annotation (Line(
      points={{18,57.6},{27,57.6},{27,64},{39.6,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowRate_in_BM2.port_b, pump.InFlow) annotation (Line(
      points={{-16,-21.5},{-40,-21.5},{-40,-34},{-64,-34},{-106.8,-33.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempBM_in2.port, pump.InFlow) annotation (Line(
      points={{-90,68},{-76,68},{-76,56},{-36,56},{-36,-22},{-40,-21.5},{-40,
          -34},{-64,-34},{-106.8,-33.5}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{440,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{440,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V3_9_prova;
