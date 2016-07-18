within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_All
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
    annotation (Placement(transformation(extent={{-532,38},{-552,58}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-475,81})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-580,136},{-558,150}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-620,-62},{-610,-52}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-620,-44},{-608,-32}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-620,-24},{-610,-14}})));
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
    annotation (Placement(transformation(extent={{-510,-120},{-530,-100}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-420,-52})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-568,-128},{-552,-114}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-580,-10},{-598,6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-490,-56})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-612,-126},{-600,-114}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-389,-11})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-454,-110})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-568,34},{-550,18}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-534,-20})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-372,-12},{-354,0}})));

  ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-256,-68})));
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
        origin={-441,0})));
  Modelica.Blocks.Sources.Constant const3(k=219 + 273.15)
    annotation (Placement(transformation(extent={{-470,8},{-458,20}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-424,2},{-396,20}})));
  Modelica.Blocks.Sources.Constant const4(k=225 + 273.15)
    annotation (Placement(transformation(extent={{-656,126},{-646,136}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-252,-50},{-236,-38}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8.5,7.5},{8.5,-7.5}},
        rotation=0,
        origin={-536.5,129.5})));
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
    annotation (Placement(transformation(extent={{-268,190},{-248,210}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-6,-8},{6,8}},
        rotation=-90,
        origin={-310,-16})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{7,-6},{-7,6}},
        rotation=-90,
        origin={-286,161})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-140,158},{-178,180}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={-441,124})));
  ThermoCycle.Components.Units.ControlSystems.PID pID2(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.001,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-8,-11},{8,11}},
        rotation=0,
        origin={-388,177})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-416,176},{-406,186}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-150,212},{-180,230}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{5,-7},{-5,7}},
        rotation=0,
        origin={-393,49})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-408,130},{-380,148}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-248,224},{-220,242}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-250,132},{-230,150}})));
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
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={-339,181})));
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
        origin={-629,122})));
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
        origin={-571,98})));

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
        origin={-210,175})));
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
    annotation (Placement(transformation(extent={{-582,-76},{-544,-38}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.12808e+07)
    annotation (Placement(transformation(extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-499,123})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.7)
    annotation (Placement(transformation(extent={{-266,-126},{-286,-106}})));
  Modelica.Blocks.Sources.Constant Qeva(k=-472000)
    annotation (Placement(transformation(extent={{-248,54},{-238,64}})));
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
    annotation (Placement(transformation(extent={{-242,-20},{-186,38}})));
  Modelica.Blocks.Sources.Constant Qcond(k=387000)
    annotation (Placement(transformation(extent={{-190,54},{-200,64}})));
  Modelica.Fluid.Sensors.Temperature Temp_ORC_cond_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-142,24},{-170,40}})));
  Modelica.Fluid.Sensors.Temperature Temp_ORC_cond_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-164,-26},{-184,-38}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot1(
              redeclare package Medium = ThermoCycle.Media.Water, Mdot_0=10.4)
    annotation (Placement(transformation(extent={{-120,-32},{-140,-12}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_chiller(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{11,-11},{-11,11}},
        rotation=180,
        origin={-91,199})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot2(
              redeclare package Medium = ThermoCycle.Media.Water, Mdot_0=
        10.41)
    annotation (Placement(transformation(extent={{14,-14},{-14,14}},
        rotation=-90,
        origin={-22,46})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{11,-12},{-11,12}},
        rotation=-90,
        origin={-90,11})));
  Components.ORC.HEX Ad_chiller(
    redeclare package Medium = ThermoCycle.Media.Water,
    pstart=400000,
    Tstart_inlet=343.15,
    Tstart_outlet=333.15) annotation (Placement(transformation(
        extent={{-20,26},{20,-26}},
        rotation=90,
        origin={106,158})));
  Components.ORC.HEX Cooling_tower(
    redeclare package Medium = ThermoCycle.Media.Water,
    pstart=400000,
    Tstart_inlet=333.15,
    Tstart_outlet=333.15) annotation (Placement(transformation(
        extent={{-20,-23},{20,23}},
        rotation=-90,
        origin={107,64})));
  Modelica.Fluid.Sensors.Temperature Temp_out_chiller(redeclare package Medium
      =        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{142,108},{120,124}})));
  Modelica.Fluid.Sensors.Temperature Temp_out_cooling_tower(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{150,-10},{116,10}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID_pump(
    PVmin=0,
    PVmax=440,
    Td=0,
    Ti=0.2,
    CSstart=1,
    CSmin=10.41,
    CSmax=20,
    Kp=0.05) annotation (Placement(transformation(
        extent={{-9.5,7.5},{9.5,-7.5}},
        rotation=180,
        origin={17.5,41.5})));
  Modelica.Blocks.Sources.Constant const1(k=60 + 273)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=180,
        origin={47,59})));
  Components.Control.WatTBa watTBa
    annotation (Placement(transformation(extent={{206,28},{150,88}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium = ThermoCycle.Media.Water,
    L_lstart=0.7,
    Mdotnom=10.4,
    V_tank=0.5,
    p_ext=400000,
    Tstart=333.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{-46,-10},{-28,2}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis1(
                                                uLow=59.9 + 273, uHigh=60.3
         + 273)
    annotation (Placement(transformation(extent={{142,198},{156,212}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=-1, realFalse=0)
    annotation (Placement(transformation(extent={{176,198},{190,212}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,-387000; 20000,-387000;
        25000,-620000; 35000,-620000; 40000,-387000; 50000,-387000])
    annotation (Placement(transformation(extent={{168,152},{154,166}})));
  Components.GeneralCombiTableModel.GeneralCombiTable generalCombiTable(
      redeclare package AmbientDataTable =
        BrickerISES.Components.GeneralCombiTableModel.Tables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-654,-96},{-634,-76}})));
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
      points={{-595.3,-2},{-670,-2},{-670,-120},{-613.2,-120}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-490,-66},{-490,-109.5},{-512.8,-109.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-560,-128},{-560,-130},{-540,-130},{-540,-102.6},{-525.6,-102.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{-380,-11},{-376.5,-11},{-376.5,-11.04},{-371.82,-11.04}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-464,-110},{-512.8,-110},{-512.8,-109.5}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-420,-61},{-420,-110},{-444,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-559,34},{-566,34},{-566,55.4},{-547.6,55.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-457.4,14},{-450.75,14},{-450.75,2.4},{-446,2.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-435.7,0},{-428,0},{-428,-52}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{-410,2},{-410,-12},{-398,-12},{-398,-11}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-552.7,26},{-524,26},{-524,-2.4},{-446,-2.4}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
      points={{-244,-50},{-256,-50},{-256,-62.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{-286,154},{-286,122},{-310,122},{-310,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{-286,168},{-286,200.5},{-265.2,200.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-398,49},{-452,49},{-452,48.5},{-534.8,48.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{-354.18,-11.04},{-354.18,-14},{-344,-14},{-344,49},{-388,49}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-475,74},{-475,48.5},{-534.8,48.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{-394,130},{-394,124},{-434,124}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{-310,-22},{-310,-110},{-444,-110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-448,124},{-475,124},{-475,88}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{-396,172.6},{-448,172.6},{-448,222},{-198,222},{-198,221},{
          -175.5,221}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{-234,224},{-234,207.4},{-252.4,207.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{-339.55,173.08},{-339.875,173.08},{-339.875,124},{-434,124}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{-347.14,187.16},{-352,187.16},{-352,200},{-306,200},{-306,200.5},
          {-265.2,200.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{-379.52,177},{-370,177},{-370,177.48},{-347.8,177.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-569,136},{-568,136},{-568,121.52},{-574.72,121.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-545,129.5},{-550,129.5},{-550,130},{-574.72,130},{-574.72,
          121.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-575.34,74},{-574,74},{-574,55.4},{-547.6,55.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-623.7,122},{-616,122},{-616,96},{-595.8,96},{-595.8,98}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-645.5,131},{-640,131},{-640,124.4},{-634,124.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-561.3,143},{-546,143},{-546,180},{-640,180},{-640,120},{-634,
          120},{-634,119.6}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-589,-10},{-586,-10},{-586,-14},{-490,-14},{-490,-46}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
      points={{-252.4,207.4},{-230,207.4},{-230,191.2},{-226.56,191.2}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
      points={{-159,158},{-164,158},{-164,146},{-180,146},{-180,142},{-204,142},
          {-204,155.2},{-209.54,155.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
      points={{-192.98,158.8},{-194,158.8},{-194,126},{-200,126},{-200,122},{
          -310,122},{-310,-10}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-525.6,-102.6},{-525.6,-88},{-560,-88},{-560,-76.3455},{-559.2,
          -76.3455}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-609.5,-57},{-602,-57},{-602,-54},{-579.889,-54},{-579.889,
          -55.9636}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-607.4,-38},{-602,-38},{-602,-48.3636},{-579.889,-48.3636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-609.5,-19},{-590,-19},{-590,-41.1091},{-579.467,-41.1091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-599.4,-120},{-596,-120},{-596,-116},{-590,-116},{-590,-70.4727},
          {-579.889,-70.4727}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
      points={{-528,129.5},{-516,129.5},{-516,123},{-508.9,123}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-489.1,123},{-482,123},{-482,122},{-476,122},{-476,88},{-475,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-556.667,-38.3455},{-556.667,-20},{-539.4,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-528.6,-20},{-520,-20},{-520,-14},{-490,-14},{-490,-46}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-420,-43},{-420,-14},{-398,-14},{-398,-11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-420,-43},{-420,-14},{-490,-14},{-490,-46}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.outlet, MflowToSF.port_a) annotation (Line(
      points={{-281.6,-108.6},{-306,-108.6},{-306,-110},{-444,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot2.inlet,Mflow_recirculation. port_b) annotation (Line(
      points={{-21.3,35.92},{-22,35.92},{-22,22},{-90,22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation.port_a,Tank2. InFlow) annotation (Line(
      points={{-90,0},{-90,-9.04},{-45.82,-9.04}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hysteresis1.y, booleanToReal.u) annotation (Line(
      points={{156.7,205},{174.6,205}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Dp_ORC.OutFlow, pump_Mdot.inlet) annotation (Line(
      points={{-256,-73.4},{-258,-73.4},{-258,-115.5},{-268.8,-115.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{-240,132},{-242,132},{-242,122},{-310,122},{-310,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-405.5,181},{-400.75,181},{-400.75,181.4},{-396,181.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ORCunitHex.OutletEvap, Dp_ORC.InFlow) annotation (Line(
      points={{-242,18.6667},{-256,18.6667},{-256,-62.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.InletEvap, MflowBM_mix.port_b) annotation (Line(
      points={{-242,32.2},{-252,32.2},{-252,36},{-262,36},{-262,40},{-340,40},{
          -340,124},{-434,124}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_ORC_cond_outlet.port, ORCunitHex.Outletcond) annotation (Line(
      points={{-156,24},{-160,24},{-160,12},{-188.8,12},{-188.8,2.55556}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump_Mdot1.inlet, Tank2.InFlow) annotation (Line(
      points={{-122.8,-21.5},{-102,-21.5},{-102,-10},{-88,-10},{-45.82,-9.04}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pump_Mdot1.outlet, ORCunitHex.InletCond) annotation (Line(
      points={{-135.6,-14.6},{-166,-14.6},{-166,-12.2667},{-188.8,-12.2667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond, Mflow_recirculation.port_b) annotation (Line(
      points={{-188.8,2.55556},{-132,2.55556},{-132,22},{-90,22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_ORC_cond_inlet.port, ORCunitHex.InletCond) annotation (Line(
      points={{-174,-26},{-172,-26},{-172,-12.2667},{-188.8,-12.2667}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, Mflow_chiller.port_a) annotation (Line(
      points={{-209.54,194.8},{-209.54,199},{-102,199}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_chiller.port_b, Ad_chiller.inlet_fl2) annotation (Line(
      points={{-80,199},{109.64,199},{109.64,178}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(watTBa.Qres, Cooling_tower.u) annotation (Line(
      points={{148.88,62.2},{125.4,62.2},{125.4,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Ad_chiller.outlet_fl2, Cooling_tower.outlet_fl2) annotation (Line(
      points={{109.12,138.4},{109.12,111.2},{109.76,111.2},{109.76,83.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID_pump.CS, pump_Mdot2.flow_in) annotation (Line(
      points={{7.43,41.5},{-0.285,41.5},{-0.285,41.52},{-10.8,41.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID_pump.SP, const1.y) annotation (Line(
      points={{27,44.5},{34,44.5},{34,59},{41.5,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Cooling_tower.inlet_fl2, Tank2.OutFlow) annotation (Line(
      points={{110.22,44},{110,44},{110,-9.04},{-28.18,-9.04}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_out_chiller.port, Cooling_tower.outlet_fl2) annotation (Line(
      points={{131,108},{130,108},{130,104},{114,104},{114,106},{109.76,106},{
          109.76,83.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_out_chiller.T, pID_pump.PV) annotation (Line(
      points={{123.3,116},{80,116},{80,38.5},{27,38.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_out_cooling_tower.port, Tank2.OutFlow) annotation (Line(
      points={{133,-10},{134,-10},{134,-18},{108,-18},{108,-10},{-28.18,-9.04}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Qeva.y, ORCunitHex.QevapORC) annotation (Line(
      points={{-237.5,59},{-228,59},{-228,38.6444}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Qcond.y, ORCunitHex.QcondORC) annotation (Line(
      points={{-200.5,59},{-200.5,60},{-210.733,60},{-210.733,38.9667}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Temp_HEX_water_outlet.port, Mflow_chiller.port_a) annotation (Line(
      points={{-165,212},{-166,212},{-166,200},{-102,199}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hysteresis1.u, pID_pump.PV) annotation (Line(
      points={{140.6,205},{140,205},{140,206},{90,206},{90,116},{80,116},{80,
          38.5},{27,38.5}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Ad_chiller.u, timeTable1.y) annotation (Line(
      points={{126.8,158},{140,158},{140,159},{153.3,159}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanToReal.y, watTBa.ControlSignal) annotation (Line(
      points={{190.7,205},{198,205},{198,172},{183.04,172},{183.04,86.8}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(timeTable1.y, watTBa.Qbuilding) annotation (Line(
      points={{153.3,159},{150,159},{150,114},{222,114},{222,81.7},{208.52,81.7}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));

  connect(Qcond.y, watTBa.QORC) annotation (Line(
      points={{-200.5,59},{-214,59},{-214,74},{-58,74},{-58,-44},{222,-44},{222,
          58},{208.24,58}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(HxOilWater.Q_hx, watTBa.Qhx) annotation (Line(
      points={{-198.04,187.24},{-186,187.24},{-186,252},{234,252},{234,35.2},{
          208.24,35.2}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Temp_HEX_water_inlet.port, pump_Mdot2.outlet) annotation (Line(
      points={{-159,158},{-11.64,158},{-11.64,53.84}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(generalCombiTable.OutPut, SF.DNI) annotation (Line(
      points={{-633.8,-86},{-624,-86},{-624,-84},{-600,-84},{-600,-63.0455},{
          -580.1,-63.0455}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-720,
            -140},{240,340}}), graphics), Icon(coordinateSystem(extent={{-720,
            -140},{240,340}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_All;
