within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_VII
   /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    hstart=575410,
    X_pp0=0.5,
    V_dot_max=0.0263,
    eta_is=0.85,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-302,94},{-322,114}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-249,140})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-350,192},{-328,206}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-390,-6},{-380,4}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-390,12},{-378,24}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-390,32},{-380,42}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.5,
    hstart=3.46e5,
    V_dot_max=0.0064,
    eta_is=0.85,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-280,-64},{-300,-44}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-190,4})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-338,-72},{-322,-58}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-350,46},{-368,62}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-260,0})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-382,-70},{-370,-58}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-159,45})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-224,-54})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-338,90},{-320,74}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-304,36})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-138,42},{-118,62}})));

  ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-26,-12})));
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
        origin={-211,56})));
  Modelica.Blocks.Sources.Constant const3(k=219 + 273.15)
    annotation (Placement(transformation(extent={{-240,64},{-228,76}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-194,58},{-166,76}})));
  Modelica.Blocks.Sources.Constant const4(k=225 + 273.15)
    annotation (Placement(transformation(extent={{-426,182},{-416,192}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{0,0},{24,16}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={-26,-36})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-302.5,179.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=1,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={66,156})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={116,266})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=3.9,
    hstart=145528,
    V_dot_max=0.00988,
    eta_is=0.85,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-34,246},{-4,276}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={-83,45})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-52,220})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{90,214},{52,236}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-212,180})));
  ThermoCycle.Components.Units.ControlSystems.PID pID2(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.001,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-161,228})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-204,258},{-194,268}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{86,260},{46,282}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={66,185})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={-155.5,104})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-178,186},{-150,204}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,296},{18,314}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-50,148},{-16,168}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=3.9,
    hstart=145528,
    V_dot_max=0.0015,
    eta_is=0.85,
    p_su_start=350000) annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-109,233})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-412,-30},{-398,-16}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Ti=20*100,
    Kp=15,
    CSmin=0.1)
             annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-399,178})));
  Components.Biomass.Flow1DIncHeatInput_L BM(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=9.4,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    Unom=1000,
    QcombustionStart=150e3,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
    tStartup=20*60,
    M_wall=200,
    Vint=2,
    QcombustionMin=10e3,
    QcombustionNominal=500e3,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=498.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=503.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-341,154})));

//     /* Performance Indexes */
//     Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
//     Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
//     Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
//     Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";
//
//     Modelica.SIunits.Power Pel_net_tot "Net electrical power";
//
//     /* Efficiencies */
//     Real eta_sys_CHP;
//     Real eta_sys_el;
//     Real eta_ORC_el;
//     Real eta_ORC_chp;
//     Real eta_SF;
//     Real eta_BM;
//     Real eta_HX;
//     Real Q_hx;

  Components.HX_singlephase HxOilWater(
    redeclare package MediumSs =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    MdotNom_ps=1,
    MdotNom_ss=4.8,
    A_ps=6.4,
    A_ss=6.4,
    U_ps=2500,
    U_ss=3000,
    steadystate_T_wall=true,
    redeclare package MediumPs = ThermoCycle.Media.Water,
    p_ps_start=100000,
    T_ps_su_start=340.15,
    T_ps_ex_start=343.15,
    p_ss_start=400000,
    T_ss_su_start=354.15,
    T_ss_ex_start=347.15) annotation (Placement(transformation(
        extent={{-18,-23},{18,23}},
        rotation=90,
        origin={20,231})));
BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Nt=4,
    Ns=3,
    Unom=1000,
    Mdotnom=2.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    pstart=100000,
    Tstart_inlet=429.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-352,-20},{-314,18}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.12808e+07)
    annotation (Placement(transformation(extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-269,179})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.7)
    annotation (Placement(transformation(extent={{-54,-62},{-74,-42}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    UseT=true,
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=10.4,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{-14,14},{14,-14}},
        rotation=90,
        origin={126,-52})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_water(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={67,3})));
  Modelica.Blocks.Sources.Constant Qeva(k=-472000)
    annotation (Placement(transformation(extent={{-2,86},{8,96}})));
  Components.ORC.ORCunitHex             ORCunitHex(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model HeatTransferModelEva =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    UnomEva=1000,
    redeclare model HeatTransferModelCond =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    UnomCond=1000,
    Cond(redeclare model Medium2HeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant),
    Eva(redeclare model Medium2HeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant),
    redeclare package MediumWat = ThermoCycle.Media.Water,
    Mdotnomeva=2.7,
    Mdotnomcond=10.41,
    pstartEva=450000,
    TstartEva_inlet=498.15,
    TstartEva_outlet=429.15,
    TstartCond_inlet=333.15,
    TstartCond_outlet=343.15)
    annotation (Placement(transformation(extent={{0,32},{38,68}})));
  Modelica.Blocks.Sources.Constant Qcond(k=387000)
    annotation (Placement(transformation(extent={{42,84},{32,94}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet1(
                                                           redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{186,100},{150,124}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet1(
                                                          redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{142,-24},{106,0}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP2(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={108,108})));
equation
//    /* Energy calculation */
//    der(E_BM) = BM.source_Q.Q_tot;
//    der(E_SF) = SF.Cell_wf.Q_tot;
//    der(E_ORC) = ORC.Pel_net;
//    der(E_HX) = HxOilWater.Summary.Q_ss;
//    Q_hx = HxOilWater.Summary.Q_ss;
//
//    /* Net Electrical power */
//
//   Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9  - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;
//   // - PumpORC.W_dot/0.9
//    /* Efficiency */
//    eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
//    eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
//    //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
//    eta_BM = 0.75;
//    eta_SF = SF.SolarAbsorber.Eta_tot;
//
//    eta_HX = 0.95;
//    eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
//    eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-365.3,54},{-394,54},{-394,-64},{-383.2,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-260,-10},{-260,-53.5},{-282.8,-53.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-330,-72},{-330,-74},{-310,-74},{-310,-46.6},{-295.6,-46.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{-150,45},{-146.5,45},{-146.5,43.6},{-137.8,43.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-234,-54},{-282.8,-54},{-282.8,-53.5}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-190,-5},{-190,-54},{-214,-54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-329,90},{-336,90},{-336,111.4},{-317.6,111.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-227.4,70},{-220.75,70},{-220.75,58.4},{-216,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-205.7,56},{-198,56},{-198,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{-180,58},{-180,44},{-168,44},{-168,45}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-322.7,82},{-294,82},{-294,53.6},{-216,53.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
      points={{12,0},{-26,0},{-26,-6.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{-26,-17.4},{-26,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{-52,210},{-52,178},{-83,178},{-83,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{-52,230},{-52,261.75},{-29.8,261.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-193.5,263},{-185.75,263},{-185.75,230.4},{-166,230.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{66,260},{60,260},{60,252},{116,252},{116,257.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-166,104},{-222,104},{-222,104.5},{-304.8,104.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{-118.2,43.6},{-118.2,44},{-110,44},{-110,104},{-145,104}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-249,130},{-249,104.5},{-304.8,104.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{-164,186},{-164,180},{-202,180}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{-83,34},{-83,-54},{-214,-54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-222,180},{-249,180},{-249,150}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{-166,225.6},{-218,225.6},{-218,290},{32,290},{32,271},{52,271}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{4,296},{-2,296},{-2,272.1},{-10.6,272.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{-109.75,222.2},{-113.875,222.2},{-113.875,180},{-202,180}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{-120.1,241.4},{-122,241.4},{-122,262},{-76,262},{-76,261.75},{
          -29.8,261.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{-155.7,228},{-140,228},{-140,228.2},{-121,228.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-339,192},{-338,192},{-338,177.52},{-344.72,177.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-313,179.5},{-320,179.5},{-320,186},{-344.72,186},{-344.72,
          177.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-345.34,130},{-344,130},{-344,111.4},{-317.6,111.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-393.7,178},{-386,178},{-386,152},{-365.8,152},{-365.8,154}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-415.5,187},{-410,187},{-410,180.4},{-404,180.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-331.3,199},{-316,199},{-316,236},{-410,236},{-410,176},{-404,
          176},{-404,175.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-359,46},{-356,46},{-356,42},{-260,42},{-260,10}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
      points={{-10.6,272.1},{0,272.1},{0,247.2},{3.44,247.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{66,165},{66,178}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
      points={{20.46,250.8},{20.46,254},{60,254},{60,252},{116,252},{116,257.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
      points={{66,192},{66,198},{26,198},{26,211.2},{20.46,211.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
      points={{71,214},{66,214},{66,202},{50,202},{50,198},{26,198},{26,211.2},
          {20.46,211.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
      points={{37.02,214.8},{36,214.8},{36,182},{30,182},{30,178},{-83,178},{
          -83,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{-33,148},{-32,148},{-32,154},{14,154},{14,178},{-83,178},{-83,56}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-295.6,-46.6},{-295.6,-32},{-330,-32},{-330,-20.3455},{-329.2,
          -20.3455}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-397.86,-23},{-364,-23},{-364,-7.04545},{-350.1,-7.04545}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-379.5,-1},{-372,-1},{-372,2},{-349.889,2},{-349.889,0.0363636}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-377.4,18},{-372,18},{-372,7.63636},{-349.889,7.63636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-379.5,37},{-360,37},{-360,14.8909},{-349.467,14.8909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-369.4,-64},{-366,-64},{-366,-60},{-360,-60},{-360,-14.4727},{
          -349.889,-14.4727}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
      points={{-292,179.5},{-286,179.5},{-286,179},{-278.9,179}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-259.1,179},{-254,179},{-254,180},{-248,180},{-248,164},{-249,
          164},{-249,150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-326.667,17.6545},{-326.667,36},{-309.4,36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-298.6,36},{-290,36},{-290,42},{-260,42},{-260,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-190,13},{-190,42},{-168,42},{-168,45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-190,13},{-190,42},{-260,42},{-260,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.inlet, MflowORC_out.port_b) annotation (Line(
      points={{-56.8,-51.5},{-26,-51.5},{-26,-44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.outlet, MflowToSF.port_a) annotation (Line(
      points={{-69.6,-44.6},{-76,-44.6},{-76,-54},{-214,-54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Qeva.y,ORCunitHex. QevapORC) annotation (Line(
      points={{8.5,91},{8.5,88},{9.5,88},{9.5,68.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qcond.y,ORCunitHex. QcondORC) annotation (Line(
      points={{31.5,89},{21.2167,89},{21.2167,68.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_water.port_a,sourceMdot1. flangeB) annotation (Line(
      points={{67,-14},{96,-14},{96,-39.4},{126,-39.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, Temp_HEX_water_inlet1.port) annotation (Line(
      points={{126,-39.4},{126,-24},{124,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond,sinkP2. flangeB) annotation (Line(
      points={{36.1,46},{70,46},{70,68},{108,68},{108,99.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet1.port, sinkP2.flangeB) annotation (Line(
      points={{168,100},{146,100},{146,99.6},{108,99.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_water.port_b,ORCunitHex. InletCond) annotation (Line(
      points={{67,20},{54,20},{54,36.8},{36.1,36.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.InletEvap, MflowBM_mix.port_b) annotation (Line(
      points={{0,64.4},{-16,64.4},{-16,72},{-60,72},{-60,156},{-114,156},{-114,
          182},{-113.875,180},{-202,180}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.OutletEvap, Dp_ORC.InFlow) annotation (Line(
      points={{0,56},{-26,56},{-26,-6.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-420,
            -200},{280,300}}), graphics), Icon(coordinateSystem(extent={{-420,
            -200},{280,300}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_VII;
