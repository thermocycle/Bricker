within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_V
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
    annotation (Placement(transformation(extent={{-252,40},{-272,60}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-199,86})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-300,138},{-278,152}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-340,-60},{-330,-50}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-340,-42},{-328,-30}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-340,-22},{-330,-12}})));
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
    annotation (Placement(transformation(extent={{-230,-118},{-250,-98}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-140,-50})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-288,-126},{-272,-112}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-300,-8},{-318,8}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-210,-54})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-332,-124},{-320,-112}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-109,-9})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-174,-108})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-288,36},{-270,20}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-254,-18})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{96,40},{86,50}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{74,58},{64,68}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    M_dot_start=2.9,
    hstart=361133,
    V_dot_max=0.0065,
    eta_is=0.85,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-6,-126},{-26,-106}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={24,-66})));
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
        origin={-161,2})));
  Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
    annotation (Placement(transformation(extent={{-190,10},{-178,22}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-144,4},{-116,22}})));
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-376,128},{-366,138}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{50,-54},{74,-38}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={24,-90})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-252.5,125.5})));
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
    annotation (Placement(transformation(extent={{16,192},{46,222}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={-33,-9})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-2,166})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-162,126})));
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
        origin={-111,174})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-154,204},{-144,214}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={-105.5,50})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-128,132},{-100,150}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{40,242},{68,260}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{0,94},{34,114}})));
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
        origin={-59,179})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-340,-82},{-326,-68}})));
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
        origin={-349,124})));
  Components.Biomass.Flow1DIncHeatInput_L BM(
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
        origin={-291,102})));

    /* Performance Indexes */
    Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
    Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
    Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
    Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

    Modelica.SIunits.Power Pel_net_tot "Net electrical power";

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
    steadystate_T_wall=true,
    T_wall_fixed=false,
    p_wf_start=2500000,
    T_wf_su_start=333.15,
    T_wf_ex_start=403.15,
    p_sf_start=350000,
    T_sf_su_start=518.15,
    T_sf_ex_start=441.15,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{32,-28},{76,28}})));
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
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-302,-74},{-264,-36}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.12808e+07)
    annotation (Placement(transformation(extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-219,125})));
  Components.Biomass.Flow1DIncHeatInput_L_NoDyn HX_OilWater(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Vint=0.01,
    Aint=6.4,
    Aext=6.5,
    Unom=3000,
    Mdotnom=4.8,
    steadystate_T=true,
    pstart=400000,
    Tstart_inlet=354.15,
    Tstart_outlet=347.15,
    Tstart_inlet_wall=343.15,
    Tstart_outlet_wall=333.15) annotation (Placement(transformation(
        extent={{19,-21},{-19,21}},
        rotation=-90,
        origin={71,163})));
  Modelica.Blocks.Sources.Constant const6(k=70 + 273.15)
    annotation (Placement(transformation(extent={{128,222},{116,234}})));
  Modelica.Blocks.Sources.Constant const7(k=-8380)
    annotation (Placement(transformation(extent={{138,162},{126,174}})));
  Modelica.Blocks.Sources.Constant const8(k=0.02)
    annotation (Placement(transformation(extent={{-104,188},{-94,198}})));
equation
   /* Energy calculation */
   der(E_BM) = BM.source_Q.Q_tot;
   der(E_SF) = SF.Cell_wf.Q_tot;
   der(E_ORC) = ORC.Pel_net;
   der(E_HX) =  HX_OilWater.source_Q.Q_tot;
   Q_hx = HX_OilWater.source_Q.Q_tot;

   /* Net Electrical power */

   Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9 - PumpORC.W_dot/0.9 - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;

   /* Efficiency */
   eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
   eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
   //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
   eta_BM = 0.75;
   eta_SF = SF.SolarAbsorber.Eta_tot;

   eta_HX = 0.95;
   eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
   eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-315.3,0},{-344,0},{-344,-118},{-333.2,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-210,-64},{-210,-107.5},{-232.8,-107.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-280,-126},{-280,-128},{-260,-128},{-260,-100.6},{-245.6,
          -100.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{-100,-9},{-96.5,-9},{-96.5,-10.4},{-87.8,-10.4}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-184,-108},{-232.8,-108},{-232.8,-107.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{-21.6,-108.6},{-144,-108.6},{-144,-108},{-164,-108}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-140,-59},{-140,-108},{-164,-108}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-279,36},{-286,36},{-286,57.4},{-267.6,57.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-177.4,16},{-170.75,16},{-170.75,4.4},{-166,4.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-155.7,2},{-148,2},{-148,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{-130,4},{-130,-10},{-118,-10},{-118,-9}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-272.7,28},{-244,28},{-244,-0.4},{-166,-0.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
      points={{62,-54},{24,-54},{24,-60.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{24,-71.4},{24,-82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
      points={{24,-98},{22,-98},{22,-116},{-8.8,-116},{-8.8,-115.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{-2,156},{-2,124},{-33,124},{-33,2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{-2,176},{-2,207.75},{20.2,207.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-143.5,209},{-135.75,209},{-135.75,176.4},{-116,176.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-116,50},{-172,50},{-172,50.5},{-254.8,50.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{-68.2,-10.4},{-68.2,-10},{-60,-10},{-60,50},{-95,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-199,76},{-199,50.5},{-254.8,50.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{-114,132},{-114,126},{-152,126}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{-33,-20},{-33,-108},{-164,-108}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-172,126},{-199,126},{-199,96}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{54,242},{48,242},{48,218.1},{39.4,218.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{-59.75,168.2},{-63.875,168.2},{-63.875,126},{-152,126}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{-70.1,187.4},{-72,187.4},{-72,208},{-26,208},{-26,207.75},{
          20.2,207.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-289,138},{-288,138},{-288,125.52},{-294.72,125.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-263,125.5},{-270,125.5},{-270,132},{-294.72,132},{-294.72,
          125.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-295.34,78},{-294,78},{-294,57.4},{-267.6,57.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-343.7,124},{-336,124},{-336,98},{-315.8,98},{-315.8,102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-365.5,133},{-360,133},{-360,126.4},{-354,126.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-281.3,145},{-266,145},{-266,182},{-360,182},{-360,122},{-354,
          122},{-354,121.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-309,-8},{-306,-8},{-306,-12},{-210,-12},{-210,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
      points={{30.7429,-19.2889},{24,-19.2889},{24,-60.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
      points={{31.3714,18.6667},{-8,18.6667},{-8,88},{-42,88},{-42,126},{-152,
          126}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(const2.y, ORC.MdotWfORC) annotation (Line(
      points={{63.5,63},{48.3429,63},{48.3429,26.1333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{85.5,45},{85.5,44},{64.0571,44},{64.0571,26.1333}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{17,94},{18,94},{18,100},{64,100},{64,124},{-33,124},{-33,2}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-245.6,-100.6},{-245.6,-86},{-280,-86},{-280,-74.3455},{-279.2,
          -74.3455}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-325.86,-75},{-314,-75},{-314,-61.0455},{-300.1,-61.0455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-329.5,-55},{-322,-55},{-322,-52},{-299.889,-52},{-299.889,
          -53.9636}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-327.4,-36},{-322,-36},{-322,-46.3636},{-299.889,-46.3636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-329.5,-17},{-310,-17},{-310,-39.1091},{-299.467,-39.1091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-319.4,-118},{-316,-118},{-316,-114},{-310,-114},{-310,-68.4727},
          {-299.889,-68.4727}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
      points={{-242,125.5},{-236,125.5},{-236,125},{-228.9,125}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-209.1,125},{-204,125},{-204,126},{-198,126},{-198,110},{-199,
          110},{-199,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-276.667,-36.3455},{-276.667,-18},{-259.4,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-248.6,-18},{-240,-18},{-240,-12},{-210,-12},{-210,-44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-140,-41},{-140,-12},{-118,-12},{-118,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-140,-41},{-140,-12},{-210,-12},{-210,-44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow, HX_OilWater.inlet_fl2) annotation (Line(
      points={{39.4,218.1},{73.94,218.1},{73.94,182}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HX_OilWater.outlet_fl2, MflowHXl.port_a) annotation (Line(
      points={{73.52,144.38},{73.52,124},{-33,124},{-33,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, pID2.PV) annotation (Line(
      points={{115.4,228},{-128,228},{-128,171.6},{-116,171.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const7.y, HX_OilWater.u) annotation (Line(
      points={{125.4,168},{108,168},{108,163},{87.8,163}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const8.y, PumpHxOil_1.flow_in) annotation (Line(
      points={{-93.5,193},{-88,193},{-88,174.2},{-71,174.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
            -200},{280,260}}), graphics), Icon(coordinateSystem(extent={{-380,
            -200},{280,260}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_V;
