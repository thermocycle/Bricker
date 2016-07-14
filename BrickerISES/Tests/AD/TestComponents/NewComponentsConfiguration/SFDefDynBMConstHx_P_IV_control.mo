within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration;
model SFDefDynBMConstHx_P_IV_control
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
    annotation (Placement(transformation(extent={{-310,100},{-330,120}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-257,146})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-358,198},{-336,212}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-398,0},{-388,10}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-398,18},{-386,30}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-398,38},{-388,48}})));
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
    annotation (Placement(transformation(extent={{-288,-58},{-308,-38}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,10})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-346,-66},{-330,-52}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-358,52},{-376,68}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-268,6})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-390,-64},{-378,-52}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-167,51})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-232,-48})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-346,96},{-328,80}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-312,42})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.5,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-146,50},{-126,70}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{60,98},{50,108}})));
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
    annotation (Placement(transformation(extent={{-64,-66},{-84,-46}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-34,-6})));
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
        origin={-219,62})));
  Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
    annotation (Placement(transformation(extent={{-248,70},{-236,82}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-202,64},{-174,82}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-8,6},{16,22}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=-90,
        origin={-34,-30})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-310.5,185.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=1,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={58,162})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={108,272})));
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
    annotation (Placement(transformation(extent={{-42,252},{-12,282}})));

  Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={-91,51})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-60,226})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{82,220},{44,242}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-220,186})));
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
        origin={-169,234})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-212,264},{-202,274}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{78,266},{38,288}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={58,191})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={-163.5,110})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-186,192},{-158,210}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-18,302},{10,320}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-76,152},{-42,172}})));
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
        origin={-117,239})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-458,-32},{-444,-18}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Ti=20*100,
    Kp=15,
    CSmin=0.01)
             annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-407,184})));
  Components.Biomass.Flow1DIncHeatInput_L BM(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=9.4,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    Unom=1000,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
    tStartup=20*60,
    M_wall=200,
    Vint=2,
    QcombustionStart=50e3,
    QcombustionNominal=250e3,
    QcombustionMin=10e3,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=483.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=488.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-351,162})));

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
    annotation (Placement(transformation(extent={{-26,32},{18,88}})));
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
        origin={12,237})));
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
    annotation (Placement(transformation(extent={{-360,-14},{-322,24}})));
  ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.12808e+07)
    annotation (Placement(transformation(extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-277,185})));
  Modelica.Blocks.Logical.Hysteresis hysTOut(uLow=10, uHigh=150)
    "Hysteresis for on/off based on outside temperature"
    annotation (Placement(transformation(extent={{-436,32},{-422,46}})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{-412,88},{-392,108}})));
  Modelica.Blocks.Math.BooleanToReal booToReaRad(realTrue=100 + 273.15,
      realFalse=245 + 273.15) "Radiator pump signal"
    annotation (Placement(transformation(extent={{-436,138},{-416,158}})));
  Modelica.Blocks.Math.BooleanToReal booToReaRad1(realTrue=0.2, realFalse=
        2.45) "Radiator pump signal"
    annotation (Placement(transformation(extent={{14,102},{-6,122}})));
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
      points={{-373.3,60},{-402,60},{-402,-58},{-391.2,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-268,-4},{-268,-47.5},{-290.8,-47.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-338,-66},{-338,-68},{-318,-68},{-318,-40.6},{-303.6,-40.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
      points={{-158,51},{-154.5,51},{-154.5,51.6},{-145.8,51.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-242,-48},{-290.8,-48},{-290.8,-47.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{-79.6,-48.6},{-202,-48.6},{-202,-48},{-222,-48}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-198,1},{-198,-48},{-222,-48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-337,96},{-344,96},{-344,117.4},{-325.6,117.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-235.4,76},{-228.75,76},{-228.75,64.4},{-224,64.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-213.7,62},{-206,62},{-206,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
      points={{-188,64},{-188,50},{-176,50},{-176,51}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-330.7,88},{-302,88},{-302,59.6},{-224,59.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
      points={{4,6},{-34,6},{-34,-0.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{-34,-11.4},{-34,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
      points={{-34,-38},{-36,-38},{-36,-56},{-66.8,-56},{-66.8,-55.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{-60,216},{-60,184},{-91,184},{-91,62}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{-60,236},{-60,267.75},{-37.8,267.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-201.5,269},{-193.75,269},{-193.75,236.4},{-174,236.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{58,266},{52,266},{52,258},{108,258},{108,263.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-174,110},{-230,110},{-230,110.5},{-312.8,110.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{-126.2,51.6},{-126.2,50},{-118,50},{-118,110},{-153,110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-257,136},{-257,110.5},{-312.8,110.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{-172,192},{-172,186},{-210,186}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
      points={{-91,40},{-91,-48},{-222,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-230,186},{-257,186},{-257,156}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{-174,231.6},{-226,231.6},{-226,296},{24,296},{24,277},{44,277}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{-4,302},{-10,302},{-10,278.1},{-18.6,278.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{-117.75,228.2},{-121.875,228.2},{-121.875,186},{-210,186}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{-128.1,247.4},{-130,247.4},{-130,268},{-84,268},{-84,267.75},{
          -37.8,267.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{-163.7,234},{-148,234},{-148,234.2},{-129,234.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-347,198},{-346,198},{-346,185.52},{-354.72,185.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-321,185.5},{-328,185.5},{-328,192},{-354.72,192},{-354.72,
          185.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-355.34,138},{-352,138},{-352,117.4},{-325.6,117.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-401.7,184},{-394,184},{-394,158},{-375.8,158},{-375.8,162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID3.PV) annotation (Line(
      points={{-339.3,205},{-324,205},{-324,242},{-418,242},{-418,182},{-412,
          182},{-412,181.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-367,52},{-364,52},{-364,48},{-268,48},{-268,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
      points={{-27.2571,40.7111},{-34,40.7111},{-34,-0.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
      points={{-26.6286,78.6667},{-66,78.6667},{-66,148},{-100,148},{-100,186},
          {-210,186}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{49.5,103},{49.5,102},{6.05714,102},{6.05714,86.1333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
      points={{-18.6,278.1},{-8,278.1},{-8,253.2},{-4.56,253.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{58,171},{58,184}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
      points={{12.46,256.8},{12.46,260},{52,260},{52,258},{108,258},{108,
          263.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
      points={{58,198},{58,204},{18,204},{18,217.2},{12.46,217.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
      points={{63,220},{58,220},{58,208},{42,208},{42,204},{18,204},{18,217.2},
          {12.46,217.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
      points={{29.02,220.8},{28,220.8},{28,188},{22,188},{22,184},{-91,184},{
          -91,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
      points={{-59,152},{-40,152},{-40,160},{6,160},{6,184},{-91,184},{-91,62}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-303.6,-40.6},{-303.6,-26},{-338,-26},{-338,-14.3455},{-337.2,
          -14.3455}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-443.86,-25},{-378,-25},{-378,-1.04545},{-358.1,-1.04545}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-387.5,5},{-380,5},{-380,8},{-357.889,8},{-357.889,6.03636}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-385.4,24},{-380,24},{-380,13.6364},{-357.889,13.6364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-387.5,43},{-368,43},{-368,20.8909},{-357.467,20.8909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-377.4,-58},{-374,-58},{-374,-54},{-368,-54},{-368,-8.47273},{
          -357.889,-8.47273}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
      points={{-300,185.5},{-294,185.5},{-294,185},{-286.9,185}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-267.1,185},{-262,185},{-262,186},{-256,186},{-256,170},{-257,
          170},{-257,156}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-334.667,23.6545},{-334.667,42},{-317.4,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-306.6,42},{-298,42},{-298,48},{-268,48},{-268,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-198,19},{-198,48},{-176,48},{-176,51}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-198,19},{-198,48},{-268,48},{-268,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hysTOut.u, SF.DNI) annotation (Line(
      points={{-437.4,39},{-448,39},{-448,12},{-422,12},{-422,-16},{-378,-16},
          {-378,-1.04545},{-358.1,-1.04545}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysTOut.y, not2.u) annotation (Line(
      points={{-421.3,39},{-416,39},{-416,80},{-438,80},{-438,98},{-414,98}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(not2.y, booToReaRad.u) annotation (Line(
      points={{-391,98},{-374,98},{-374,120},{-450,120},{-450,148},{-438,148}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pID3.SP, booToReaRad.y) annotation (Line(
      points={{-412,186.4},{-420,186.4},{-420,188},{-436,188},{-436,166},{
          -408,166},{-408,148},{-415,148}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booToReaRad1.y, ORC.MdotWfORC) annotation (Line(
      points={{-7,112},{-9.65714,112},{-9.65714,86.1333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booToReaRad1.u, booToReaRad.u) annotation (Line(
      points={{16,112},{36,112},{36,132},{-450,132},{-450,148},{-438,148}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-460,
            -200},{260,340}}), graphics), Icon(coordinateSystem(extent={{-460,
            -200},{260,340}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end SFDefDynBMConstHx_P_IV_control;
