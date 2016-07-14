within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_IV_Water
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
    annotation (Placement(transformation(extent={{-290,66},{-310,86}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-237,112})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-338,164},{-316,178}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-378,-34},{-368,-24}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-378,-16},{-366,-4}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-378,4},{-368,14}})));
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
    annotation (Placement(transformation(extent={{-268,-92},{-288,-72}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-178,-24})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-326,-100},{-310,-86}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-338,18},{-356,34}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-248,-28})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15,
    pre_y_start=false)
    annotation (Placement(transformation(extent={{-370,-98},{-358,-86}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-147,17})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-212,-82})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-326,62},{-308,46}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-292,8})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-126,14},{-106,34}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{48,80},{38,90}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{48,98},{38,108}})));
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
    annotation (Placement(transformation(extent={{-44,-100},{-64,-80}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-14,-40})));
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
        origin={-199,28})));
  Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
    annotation (Placement(transformation(extent={{-228,36},{-216,48}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-182,30},{-154,48}})));
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-396,144},{-386,154}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{12,-28},{36,-12}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={-14,-64})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-290.5,151.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=1,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={78,128})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={128,238})));
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
    annotation (Placement(transformation(extent={{-22,218},{8,248}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={-71,17})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-40,192})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{102,186},{64,208}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-200,152})));
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
        origin={-149,200})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-192,230},{-182,240}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{98,232},{58,254}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={78,157})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={-143.5,76})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-166,158},{-138,176}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{2,268},{30,286}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-38,120},{-4,140}})));
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
        origin={-97,205})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-378,-56},{-364,-42}})));
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
        origin={-369,146})));
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
        origin={-329,128})));

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
    annotation (Placement(transformation(extent={{-6,-2},{38,54}})));
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
    T_ss_ex_start=347.15,
    T_wall_fixed=false)   annotation (Placement(transformation(
        extent={{-18,-23},{18,23}},
        rotation=90,
        origin={32,203})));
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
    annotation (Placement(transformation(extent={{-340,-48},{-302,-10}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.12808e+07)
    annotation (Placement(transformation(extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-257,151})));
  Components.WaterSide.WaterCircuit waterCircuit(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{154,142},{210,210}})));
  Modelica.Blocks.Sources.Constant Q_heating(k=0)
    annotation (Placement(transformation(extent={{274,192},{248,218}})));
  Modelica.Blocks.Sources.Constant Q_cooling(k=100e3)
    annotation (Placement(transformation(extent={{274,142},{248,168}})));
equation
   /* Energy calculation */
   der(E_BM) = BM.source_Q.Q_tot;
   der(E_SF) = SF.Cell_wf.Q_tot;
   der(E_ORC) = ORC.Pel_net;
   der(E_HX) = HxOilWater.Summary.Q_ss;
   Q_hx = HxOilWater.Summary.Q_ss;

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
      points={{-353.3,26},{-382,26},{-382,-92},{-371.2,-92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-248,-38},{-248,-81.5},{-270.8,-81.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-318,-100},{-318,-102},{-298,-102},{-298,-74.6},{-283.6,-74.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{-138,17},{-134.5,17},{-134.5,15.6},{-125.8,15.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-222,-82},{-270.8,-82},{-270.8,-81.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{-59.6,-82.6},{-182,-82.6},{-182,-82},{-202,-82}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-178,-33},{-178,-82},{-202,-82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-317,62},{-324,62},{-324,83.4},{-305.6,83.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-215.4,42},{-208.75,42},{-208.75,30.4},{-204,30.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-193.7,28},{-186,28},{-186,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{-168,30},{-168,16},{-156,16},{-156,17}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-310.7,54},{-282,54},{-282,25.6},{-204,25.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
      points={{24,-28},{-14,-28},{-14,-34.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{-14,-45.4},{-14,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
      points={{-14,-72},{-16,-72},{-16,-90},{-46.8,-90},{-46.8,-89.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{-40,182},{-40,150},{-71,150},{-71,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{-40,202},{-40,233.75},{-17.8,233.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-181.5,235},{-173.75,235},{-173.75,202.4},{-154,202.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{78,232},{72,232},{72,224},{128,224},{128,229.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-154,76},{-210,76},{-210,76.5},{-292.8,76.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{-106.2,15.6},{-106.2,16},{-98,16},{-98,76},{-133,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-237,102},{-237,76.5},{-292.8,76.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{-152,158},{-152,152},{-190,152}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{-71,6},{-71,-82},{-202,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-210,152},{-237,152},{-237,122}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{-154,197.6},{-206,197.6},{-206,262},{44,262},{44,243},{64,243}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{16,268},{10,268},{10,244.1},{1.4,244.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{-97.75,194.2},{-101.875,194.2},{-101.875,152},{-190,152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{-108.1,213.4},{-110,213.4},{-110,234},{-64,234},{-64,233.75},{
          -17.8,233.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{-143.7,200},{-128,200},{-128,200.2},{-109,200.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-327,164},{-326,164},{-326,151.52},{-332.72,151.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-301,151.5},{-308,151.5},{-308,158},{-332.72,158},{-332.72,
          151.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-333.34,104},{-332,104},{-332,83.4},{-305.6,83.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-363.7,146},{-358,146},{-358,128},{-353.8,128}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-385.5,149},{-382,149},{-382,148.4},{-374,148.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-319.3,171},{-288,171},{-288,212},{-382,212},{-382,152},{-374,
          152},{-374,143.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-347,18},{-344,18},{-344,14},{-248,14},{-248,-18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
      points={{-7.25714,6.71111},{-14,6.71111},{-14,-34.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
      points={{-6.62857,44.6667},{-46,44.6667},{-46,114},{-80,114},{-80,152},
          {-190,152}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(const2.y, ORC.MdotWfORC) annotation (Line(
      points={{37.5,103},{10.3429,103},{10.3429,52.1333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{37.5,85},{37.5,84},{26.0571,84},{26.0571,52.1333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
      points={{1.4,244.1},{12,244.1},{12,219.2},{15.44,219.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{78,137},{78,150}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
      points={{32.46,222.8},{32.46,226},{72,226},{72,224},{128,224},{128,
          229.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
      points={{78,164},{78,170},{30,170},{30,183.2},{32.46,183.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
      points={{83,186},{74,186},{74,174},{58,174},{58,170},{34,170},{34,183.2},
          {32.46,183.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
      points={{49.02,186.8},{48,186.8},{48,154},{42,154},{42,150},{-71,150},{
          -71,28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{-21,120},{-20,120},{-20,126},{26,126},{26,150},{-71,150},{-71,
          28}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-283.6,-74.6},{-283.6,-60},{-318,-60},{-318,-48.3455},{-317.2,
          -48.3455}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-363.86,-49},{-352,-49},{-352,-35.0455},{-338.1,-35.0455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-367.5,-29},{-360,-29},{-360,-26},{-337.889,-26},{-337.889,
          -27.9636}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-365.4,-10},{-360,-10},{-360,-20.3636},{-337.889,-20.3636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-367.5,9},{-348,9},{-348,-13.1091},{-337.467,-13.1091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-357.4,-92},{-354,-92},{-354,-88},{-348,-88},{-348,-42.4727},{
          -337.889,-42.4727}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
      points={{-280,151.5},{-274,151.5},{-274,151},{-266.9,151}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-247.1,151},{-242,151},{-242,152},{-236,152},{-236,136},{-237,
          136},{-237,122}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-314.667,-10.3455},{-314.667,8},{-297.4,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-286.6,8},{-278,8},{-278,14},{-248,14},{-248,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-178,-15},{-178,14},{-156,14},{-156,17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-178,-15},{-178,14},{-248,14},{-248,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.PthCooling, waterCircuit.Q_ORC) annotation (Line(
      points={{39.2571,3.6},{128,3.6},{128,155.6},{151.2,155.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_heating.y, waterCircuit.Q_Heating) annotation (Line(
      points={{246.7,205},{238,205},{238,196.4},{212.24,196.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_cooling.y, waterCircuit.Q_Cooling) annotation (Line(
      points={{246.7,155},{234,155},{234,148.8},{212.8,148.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(waterCircuit.T_to_Hx, sourceMdot.in_T) annotation (Line(
      points={{193.48,140.98},{193.48,100},{100,100},{100,127.8},{84,127.8}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(HxOilWater.Q_hx, waterCircuit.Q_HX) annotation (Line(
      points={{43.96,215.24},{124,215.24},{124,195.72},{151.2,195.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(waterCircuit.m_to_Hx, sourceMdot.in_Mdot) annotation (Line(
      points={{180.6,140.3},{180.6,122},{84,122}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-400,
            -140},{280,280}}), graphics), Icon(coordinateSystem(extent={{-400,
            -140},{280,280}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_IV_Water;
