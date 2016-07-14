within BrickerISES.Tests.AD.TestComponents.LayOut_III;
model Test_SystemSpring

  BrickerISES.Components.Biomass.Flow1DIncHeatInput BM(
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
        origin={-157,50})));

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
    annotation (Placement(transformation(extent={{-114,-18},{-134,2}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-17,-15},{17,15}},
        rotation=-90,
        origin={-67,29})));
  Modelica.Fluid.Sensors.Temperature TempBMOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-184,94},{-162,108}})));
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
  Modelica.Fluid.Sensors.Temperature TempSFIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
  Modelica.Fluid.Sensors.Temperature TempSFOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-120})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=528, uLow=518)
    annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={33,-77})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-44,-174})));
  Modelica.Fluid.Sensors.Temperature TempBMIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc SF(
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
  ThermoCycle.Components.Units.Tanks.OpenTank Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=2,
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
    annotation (Placement(transformation(extent={{166,-64},{226,-20}})));

  Modelica.Blocks.Sources.Constant ORCTevaIn(k=60 + 273.15)
    annotation (Placement(transformation(extent={{214,6},{224,16}})));
  Modelica.Blocks.Sources.Constant ORCMdotWf(k=2.45)
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
  ThermoCycle.Components.Units.PdropAndValves.DP DpORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={164,-132})));
  ThermoCycle.Components.Units.ControlSystems.PID PID_v_SF(
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
  Modelica.Blocks.Sources.Constant SP_PID_v_SF(k=512)
    annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
  Modelica.Fluid.Sensors.Temperature TempSFMix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{0,-62},{28,-44}})));
  ThermoCycle.Components.Units.ControlSystems.PID PID_BM(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.3,
    Ti=0.2) annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=0,
        origin={-214,52})));
  Modelica.Blocks.Sources.Constant SP_PID_BM(k=518)
    annotation (Placement(transformation(extent={{-246,70},{-236,80}})));
  Modelica.Fluid.Sensors.Temperature TempORCOut(redeclare package Medium =
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
        extent={{-11.5,10.5},{11.5,-10.5}},
        rotation=0,
        origin={-101.5,84.5})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot WaterSource(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=15,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={226,46})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP WaterSink(redeclare package
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

  Modelica.Fluid.Sensors.MassFlowRate MflowHX(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={108,-76})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{19,-20},{-19,20}},
        rotation=-90,
        origin={148,95})));
  Modelica.Fluid.Sensors.Temperature TempHXWaterIn(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{288,94},{250,116}})));
  Modelica.Blocks.Sources.TimeTable WaterTableFlowRate(table=[0,8; 2000,11;
        2001,11; 7000,11; 7001,15; 9000,15])
    annotation (Placement(transformation(extent={{308,14},{294,28}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-14,-10},{14,10}},
        rotation=0,
        origin={-26,70})));
  ThermoCycle.Components.Units.ControlSystems.PID PID_PumpHXOil_1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.001,
    Ti=0.2) annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={29,108})));
  Modelica.Blocks.Sources.Constant SP_PID_PumpHXOil_1(k=343)
    annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
  Modelica.Fluid.Sensors.Temperature TempHXWaterOut(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{254,148},{214,170}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowHXWater(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={226,75})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{21.5,-13},{-21.5,13}},
        rotation=0,
        origin={11.5,-1})));
  Modelica.Fluid.Sensors.Temperature TempORCIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{4,74},{30,88}})));
  Modelica.Fluid.Sensors.Temperature TempHEXIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{178,166},{206,184}})));
  Modelica.Fluid.Sensors.Temperature TempHEXOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{156,38},{186,52}})));
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
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSpring)
    annotation (Placement(transformation(extent={{-236,-160},{-216,-140}})));
equation
  connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-161.34,26},{-161.34,-0.6},{-129.6,-0.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSFOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
      points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSFIn.port, PumpSF.OutFlow) annotation (Line(
      points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-128.8,-150.636},{-128.8,-166.6},{-105.6,-166.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-189.5,-83},{-152,-83},{-152,-85.7273},{-151.2,-85.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-187.4,-102},{-154,-102},{-154,-99.0909},{-151.667,-99.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-189.5,-121},{-160,-121},{-160,-113.091},{-151.667,-113.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-179.4,-184},{-166,-184},{-166,-139.818},{-151.667,-139.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-126,-80.6364},{-126,-76},{-70,-76},{-70,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSFOut.port, SF.OutFlow) annotation (Line(
      points={{-169,-74},{-126,-74},{-126,-80.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
      points={{-49.4,-76},{-70,-76},{-70,-110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
      points={{-38.6,-76},{24,-76},{24,-77}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowSF_mix.port_b, Tank.InFlow) annotation (Line(
      points={{42,-77},{43.5,-77},{43.5,-76.4},{52.2,-76.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCTevaIn.y, ORC.TWfORCSu) annotation (Line(
      points={{224.5,11},{232,11},{232,-10},{209.714,-10},{209.714,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(ORCMdotWf.y, ORC.MdotWfORC) annotation (Line(
      points={{191.5,13},{188.286,13},{188.286,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
      points={{-54,-174},{-92.8,-174},{-92.8,-173.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
      points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-34,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.OutletSf, DpORC.InFlow) annotation (Line(
      points={{164.286,-57.1556},{164.286,-104.578},{164,-104.578},{164,-126.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
      points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-34,-174}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempBMIn.port, PumpBM.OutFlow) annotation (Line(
      points={{-139,-30},{-148,-30},{-148,-0.6},{-129.6,-0.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(SP_PID_v_SF.y, PID_v_SF.SP) annotation (Line(
      points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_v_SF.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-64},{-8,-64},{-8,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSFMix.port, MflowSF_mix.port_a) annotation (Line(
      points={{14,-62},{14,-76},{24,-76},{24,-77}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(SP_PID_BM.y, PID_BM.SP) annotation (Line(
      points={{-235.5,75},{-222,75},{-222,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_BM.CS, BM.u) annotation (Line(
      points={{-205.52,52},{-186,52},{-186,50},{-181.8,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempBMOut.T, PID_BM.PV) annotation (Line(
      points={{-165.3,101},{-132,101},{-132,118},{-262,118},{-262,48},{-222,48}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(TempBMIn.T, PID_v_SF.PV) annotation (Line(
      points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempORCOut.port, DpORC.InFlow) annotation (Line(
      points={{202,-96},{164,-96},{164,-126.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempBMOut.port, BM.outlet_fl2) annotation (Line(
      points={{-173,94},{-173,73.52},{-160.72,73.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpORC.OutFlow, MflowORC_out.port_a) annotation (Line(
      points={{164,-137.4},{164,-148}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
      points={{164,-164},{162,-164},{162,-172},{131.2,-172},{131.2,-181.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.outlet_fl2, MflowBM_out.port_a) annotation (Line(
      points={{-160.72,73.52},{-160.36,73.52},{-160.36,84.5},{-113,84.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.outlet_fl1, WaterSink.flangeB) annotation (Line(
      points={{204.923,119.654},{204.923,134},{306,134},{306,137.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.outlet_fl2, MflowHX.port_a) annotation (Line(
      points={{195.369,97.5692},{196,97.5692},{196,58},{108,58},{108,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_2.OutFlow, HxOilWater.inlet_fl2) annotation (Line(
      points={{179.4,152.1},{195.192,152.1},{195.192,119.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_a, MflowHX.port_a) annotation (Line(
      points={{148,76},{148,58},{108,58},{108,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
      points={{148,114},{148,141.75},{160.2,141.75}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_b, ORC.InletSf) annotation (Line(
      points={{-12,70},{94,70},{94,-28},{164,-28},{164,-27.3333},{165.143,
          -27.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(SP_PID_PumpHXOil_1.y, PID_PumpHXOil_1.SP) annotation (Line(
      points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempHXWaterOut.port, WaterSink.flangeB) annotation (Line(
      points={{234,148},{226,148},{226,134},{306,134},{306,137.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(WaterTableFlowRate.y, WaterSource.in_Mdot) annotation (Line(
      points={{293.3,21},{255.65,21},{255.65,40},{232,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WaterSource.flangeB, MflowHXWater.port_a) annotation (Line(
      points={{226,55},{226,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowHXWater.port_b, HxOilWater.inlet_fl1) annotation (Line(
      points={{226,82},{226,90},{204.923,90},{204.923,97.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempHXWaterIn.port, HxOilWater.inlet_fl1) annotation (Line(
      points={{269,94},{269,90},{204.923,90},{204.923,97.3462}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
      points={{-10,-1},{-36,-1},{-36,-7.5},{-116.8,-7.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-90,84.5},{-67,84.5},{-67,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank.OutFlow, MflowBM_in.port_a) annotation (Line(
      points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-1},{33,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
      points={{-67,12},{-67,-7.5},{-116.8,-7.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempORCIn.port, MflowBM_mix.port_b) annotation (Line(
      points={{17,74},{17,70},{-12,70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowHX.port_b, MflowToSF.port_a) annotation (Line(
      points={{108,-88},{108,-148},{100,-148},{100,-174},{-34,-174}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
      points={{-40,70},{-67,70},{-67,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PID_PumpHXOil_1.PV, TempHXWaterOut.T) annotation (Line(
      points={{24,105.6},{-42,105.6},{-42,194},{208,194},{208,159},{220,159}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempHEXIn.port, PumpHxOil_2.OutFlow) annotation (Line(
      points={{192,166},{192,152.1},{179.4,152.1}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempHEXOut.port, HxOilWater.outlet_fl2) annotation (Line(
      points={{171,38},{196,38},{196,97.5692},{195.369,97.5692}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
      points={{78.25,102.2},{84.125,102.2},{84.125,70},{-12,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
          141.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PID_PumpHXOil_1.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-215.8,-150},{-190,-150},{-190,-126.136},{-151.9,-126.136}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{360,200}})),
    experiment(StopTime=86400),
    __Dymola_experimentSetupOutput);
end Test_SystemSpring;
