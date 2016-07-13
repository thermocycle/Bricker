within BrickerISES.Tests.AD.DailySimulations;
model SFClouds
  /* Simulazione passaggio di tre nuvole in serie - Carico termico costante */
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
        273.15, uLow=212 + 273.15)
    annotation (Placement(transformation(extent={{-194,-178},{-182,-166}})));
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
  BrickerISES.Components.ORC.ORCunitHx ORC(
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
    annotation (Placement(transformation(extent={{162,-66},{222,-22}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{214,6},{224,16}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{202,8},{192,18}})));
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
    annotation (Placement(transformation(extent={{-244,38},{-234,48}})));
  Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{190,-96},{214,-80}})));
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
        origin={226,46})));
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
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc HxOilWater(
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
    Tstart_outlet_sf=347.15) annotation (Placement(transformation(
        extent={{-14.5,-11.5},{14.5,11.5}},
        rotation=90,
        origin={200.5,108.5})));

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
        origin={21,122})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{276,140},{236,162}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={226,75})));
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
  Modelica.Blocks.Sources.Trapezoid DNI(
    rising=2,
    falling=2,
    startTime=1000,
    nperiod=3,
    offset=600,
    amplitude=-550,
    width=100,
    period=304)
    annotation (Placement(transformation(extent={{-200,-148},{-190,-138}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID3(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    CSmin=0.3,
    Ti=20*100,
    Kp=10)   annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-217,22})));
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
    Vint=1.5,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=483.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=488.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-163,22})));

  Components.SF.SolarField_SoltiguaWall_Inc_II SF(
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
    annotation (Placement(transformation(extent={{-166,-154},{-110,-82}})));

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

equation
   /* Energy calculation */
   der(E_BM) = BM.source_Q.Q_tot;
   der(E_SF) = SF.Summary.Q_htf;
   der(E_ORC) = ORC.Pel_gross;
   der(E_HX) = HxOilWater.Summary.Q_sf;

   eta_ORC_el = ORC.Pel_gross/ORC.Evaporator.Q_sf_;
   eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Evaporator.Q_sf_;
   //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
   eta_BM = 0.75;
   eta_SF = SF.Eta_tot;
   //eta_HX = Q/(UA*(T_ave_sf-T_ave_pf); // Based on Ahmad Fakheri 2007
   eta_HX = 0.95;
   eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
   eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-66},{-208,-66},{-208,-172},{-195.2,-172}},
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
  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{224.5,11},{232,11},{232,-10},{205.714,-10},{205.714,-23.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, ORC.MdotWfORC) annotation (Line(
      points={{191.5,13},{184.286,13},{184.286,-23.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{160.286,-59.1556},{160.286,-104.578},{164,-104.578},{164,-126.6}},
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
      points={{202,-96},{164,-96},{164,-126.6}},
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
  connect(HxOilWater.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{204.923,119.654},{204.923,134},{306,134},{306,137.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.outlet_fl2, MflowHXl.port_a) annotation (Line(
      points={{195.369,97.5692},{194,97.5692},{194,58},{107,58},{107,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow, HxOilWater.inlet_fl2) annotation (Line(
      points={{179.4,152.1},{195.192,152.1},{195.192,119.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
      points={{138,90},{138,58},{107,58},{107,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{138,110},{138,141.75},{160.2,141.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_b, ORC.InletSf) annotation (Line(
      points={{-12,60},{94,60},{94,-28},{164,-28},{164,-29.3333},{161.143,
          -29.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{-3.5,143},{4.25,143},{4.25,124.4},{16,124.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
      points={{256,140},{226,140},{226,134},{306,134},{306,137.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{226,55},{226,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water.port_b, HxOilWater.inlet_fl1) annotation (Line(
      points={{226,82},{226,90},{204.923,90},{204.923,97.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, HxOilWater.inlet_fl1) annotation (Line(
      points={{261,94},{261,90},{204.923,90},{204.923,97.3462}},
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
  connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, HxOilWater.outlet_fl2) annotation (Line(
      points={{157,28},{194,28},{194,97.5692},{195.369,97.5692}},
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
  connect(Temp_HEX_water_outlet.T, pID2.PV) annotation (Line(
      points={{242,151},{220,151},{220,168},{-36,168},{-36,119.6},{16,119.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{26.3,122},{48,122},{48,108.2},{67,108.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(BM.outlet_fl2, MflowBM_out.port_a) annotation (Line(
      points={{-166.72,45.52},{-166.72,59.5},{-123,59.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, MflowBM_out.port_a) annotation (Line(
      points={{-149,72},{-148,72},{-148,60},{-123,59.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID3.CS, BM.u) annotation (Line(
      points={{-211.7,22},{-187.8,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-233.5,43},{-230,43},{-230,24.4},{-222,24.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID3.PV, Temp_BMout.T) annotation (Line(
      points={{-222,19.6},{-236,19.6},{-236,22},{-252,22},{-252,110},{-128,110},
          {-128,79},{-141.3,79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-167.34,-2},{-167.34,-10},{-144,-10},{-144,-8},{-127.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-128.667,-82.6545},{-128.667,-76},{-70,-76},{-70,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-169,-74},{-168,-74},{-168,-76},{-70,-76},{-70,-110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-189.5,-83},{-180,-83},{-180,-87.8909},{-162.267,-87.8909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-187.4,-102},{-176,-102},{-176,-101.636},{-162.889,-101.636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-189.5,-121},{-180,-121},{-180,-116.036},{-162.889,-116.036}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, SF.DNI) annotation (Line(
      points={{-189.5,-143},{-182,-143},{-182,-129.455},{-163.2,-129.455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-181.4,-172},{-162.889,-172},{-162.889,-143.527}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{-105.6,-166.6},{-132.4,-166.6},{-132.4,-154.655}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{360,220}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{360,220}})),
    experiment(StartTime=-5000, StopTime=4000),
    __Dymola_experimentSetupOutput);
end SFClouds;
