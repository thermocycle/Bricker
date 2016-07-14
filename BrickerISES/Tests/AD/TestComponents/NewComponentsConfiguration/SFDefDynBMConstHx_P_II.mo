within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_II
   /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
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
    annotation (Placement(transformation(extent={{-112,-26},{-132,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-59,20})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-160,72},{-138,86}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-200,-126},{-190,-116}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-200,-108},{-188,-96}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-200,-88},{-190,-78}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
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
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-120})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={31,-75})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-34,-174})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));

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
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{52,-78},{72,-58}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{226,-12},{216,-2}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{226,6},{216,16}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.9,
    hstart=361133,
    V_dot_max=0.0065,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{134,-192},{114,-172}})));
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
  Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
    annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-8,-68},{20,-50}})));
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-248,60},{-238,70}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{190,-120},{214,-104}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={164,-156})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-112.5,59.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=1,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={256,36})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={306,146})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
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
    annotation (Placement(transformation(extent={{156,126},{186,156}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={107,-75})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={138,100})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{280,94},{242,116}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-22,60})));
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
        origin={29,108})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{276,140},{236,162}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={256,65})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={34.5,-16})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{12,66},{40,84}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{180,176},{208,194}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{140,28},{174,48}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
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
        origin={79,113})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-200,-148},{-186,-134}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    CSmin=0.3,
    Ti=20*100,
    Kp=15)   annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-209,58})));
  Components.Biomass.Flow1DIncHeatInput BM(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=9.4,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    Unom=1000,
    QcombustionNominal=500e3,
    QcombustionStart=150e3,
    QcombustionMin=150e3,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
    tStartup=20*60,
    M_wall=200,
    Vint=2,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=483.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=488.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-151,36})));

  Components.SF.SolarField_SoltiguaWall_Inc SF(
    Ns=3,
    Nt=4,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    steadystate_T_fl=true,
    steadystate_T_wall=true,
    Unom=1000,
    Mwall=26.64,
    cwall=480,
    Tstart_inlet_wall=163 + 10,
    Tstart_outlet_wall=203 + 10,
    N=5,
    Mdotnom=2.5,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-150,-140},{-120,-86}})));

    /* Performance Indexes */
    Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
    Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
    Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
    Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

    /* Efficiencies */
    Real eta_sys_CHP;
    Real eta_sys_el;
    Real eta_ORC_el;
    Real eta_ORC_chp;
    Real eta_SF;
    Real eta_BM;
    Real eta_HX;
    Real Q_hx;

  Components.ORC.ORCunitHxS ORC(
    MdotNom_wf=2.6,
    MdotNom_sf=2.45,
    A_wf=80,
    A_sf=80,
    U_wf=4000,
    U_sf=1000,
    MdotWf=2.6,
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    p_wf_start=2500000,
    T_wf_su_start=333.15,
    T_wf_ex_start=403.15,
    p_sf_start=350000,
    T_sf_su_start=518.15,
    T_sf_ex_start=441.15,
    steadystate_T_wall=true,
    T_wall_fixed=false,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{170,-94},{214,-38}})));
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
        origin={210,111})));
equation
   /* Energy calculation */
   der(E_BM) = BM.source_Q.Q_tot;
   der(E_SF) = SF.Summary.Q_htf;
   der(E_ORC) = ORC.Pel_gross;
   der(E_HX) = HxOilWater.Summary.Q_ss;
   Q_hx = HxOilWater.Summary.Q_ss;
   eta_ORC_el = ORC.Pel_gross/ORC.Q_orc_eva;
   eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Q_orc_eva;
   //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
   eta_BM = 0.75;
   eta_SF = SF.Summary.Eta_solarCollector;
   //eta_HX = Q/(UA*(T_ave_sf-T_ave_pf); // Based on Ahmad Fakheri 2007
   eta_HX = 0.95;
   eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
   eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-49.4,-76},{-70,-76},{-70,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-38.6,-76},{22,-76},{22,-75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{40,-75},{43.5,-75},{43.5,-76.4},{52.2,-76.4}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-24,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-139,-30},{-146,-30},{-146,-8.6},{-127.6,-8.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-64},{-8,-64},{-8,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{6,-68},{6,-76},{22,-76},{22,-75}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{202,-120},{164,-120},{164,-126.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{164,-137.4},{164,-148}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
      points={{164,-164},{162,-164},{162,-182},{131.2,-182},{131.2,-181.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{138,90},{138,58},{107,58},{107,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{138,110},{138,141.75},{160.2,141.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{256,140},{250,140},{250,132},{306,132},{306,137.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{24,-16},{-32,-16},{-32,-15.5},{-114.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-102,59.5},{-59,59.5},{-59,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-16},{45,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-59,10},{-59,-15.5},{-114.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{26,66},{26,60},{-12,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{107,-86},{107,-174},{-24,-174}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-32,60},{-59,60},{-59,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{24,105.6},{-28,105.6},{-28,170},{222,170},{222,151},{242,151}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{78.25,102.2},{76.125,102.2},{76.125,60},{-12,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
          141.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-149,72},{-148,72},{-148,59.52},{-154.72,59.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-123,59.5},{-130,59.5},{-130,66},{-154.72,66},{-154.72,59.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-155.34,12},{-154,12},{-154,-8.6},{-127.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-203.7,58},{-196,58},{-196,32},{-175.8,32},{-175.8,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-237.5,65},{-220,65},{-220,60.4},{-214,60.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-141.3,79},{-126,79},{-126,116},{-220,116},{-220,56},{-214,56},{
          -214,55.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-132,-140.491},{-134,-140.491},{-134,-166.6},{-105.6,-166.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-130,-86.4909},{-130,-78},{-70,-78},{-70,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-189.5,-83},{-166,-83},{-166,-90.4182},{-148,-90.4182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-187.4,-102},{-168,-102},{-168,-100.727},{-148.333,-100.727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-189.5,-121},{-168,-121},{-168,-111.527},{-148.333,-111.527}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-185.86,-141},{-168,-141},{-168,-124},{-148.5,-124},{-148.5,
          -121.591}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-179.4,-184},{-156,-184},{-156,-132.145},{-148.333,-132.145}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-169,-74},{-166,-74},{-166,-78},{-70,-78},{-70,-110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{168.743,-85.2889},{164,-85.2889},{164,-126.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
      points={{169.371,-47.3333},{132,-47.3333},{132,22},{98,22},{98,60},{-12,
          60}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(const2.y, ORC.MdotWfORC) annotation (Line(
      points={{215.5,11},{186.343,11},{186.343,-39.8667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{215.5,-7},{215.5,-8},{202.057,-8},{202.057,-39.8667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
      points={{179.4,152.1},{190,152.1},{190,127.2},{193.44,127.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{256,45},{256,58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
      points={{210.46,130.8},{210.46,134},{250,134},{250,132},{306,132},{306,137.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
      points={{256,72},{256,78},{216,78},{216,91.2},{210.46,91.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
      points={{261,94},{256,94},{256,82},{240,82},{240,78},{216,78},{216,91.2},{
          210.46,91.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
      points={{227.02,94.8},{226,94.8},{226,62},{220,62},{220,58},{107,58},{107,
          -64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{157,28},{158,28},{158,34},{204,34},{204,58},{107,58},{107,-64}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{360,200}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_II;
