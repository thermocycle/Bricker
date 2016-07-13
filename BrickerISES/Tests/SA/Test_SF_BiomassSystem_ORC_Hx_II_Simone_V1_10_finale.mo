within BrickerISES.Tests.SA;
model Test_SF_BiomassSystem_ORC_Hx_II_Simone_V1_10_finale

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
        origin={-139,24})));

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
    annotation (Placement(transformation(extent={{-104,-22},{-124,-2}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-57,26})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-152,72},{-130,86}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-198,-104},{-188,-94}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-198,-86},{-186,-74}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-196,-66},{-186,-56}})));
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
    annotation (Placement(transformation(extent={{-90,-162},{-110,-142}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-94})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-170},{-132,-156}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-160,-52},{-178,-36}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-68,-98})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=528, uLow=518)
    annotation (Placement(transformation(extent={{-192,-168},{-180,-156}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={16,-55})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-44,-152})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-148,-20},{-130,-36}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
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
    annotation (Placement(transformation(extent={{-154,-128},{-112,-58}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-44,-54})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.2,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{46,-56},{66,-36}})));
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
    annotation (Placement(transformation(extent={{166,-42},{226,2}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{214,28},{224,38}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{202,30},{192,40}})));
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
    annotation (Placement(transformation(extent={{70,-168},{50,-148}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={164,-110})));
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
        origin={-21,-42})));
  Modelica.Blocks.Sources.Constant const3(k=511.5)
    annotation (Placement(transformation(extent={{-46,-36},{-36,-26}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut1(
                                                  redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,-40},{18,-22}})));
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
        origin={-205,44})));
  Modelica.Blocks.Sources.Constant const4(k=518)
    annotation (Placement(transformation(extent={{-238,50},{-228,60}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 1000,0; 1001,400;
        3000,400; 3001,800; 5000,800; 5001,650; 7000,650; 7001,250; 9000,250;
        9001,0; 10000,0])
    annotation (Placement(transformation(extent={{-204,-134},{-190,-120}})));
  Modelica.Fluid.Sensors.Temperature Inlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{124,12},{148,28}})));
  Modelica.Fluid.Sensors.Temperature Outlet_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{120,-72},{144,-56}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_orc(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={164,-135})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_Bm_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-11.5,10.5},{11.5,-10.5}},
        rotation=0,
        origin={-103.5,60.5})));
equation
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-143.34,3.55271e-015},{-143.34,-4.6},{-119.6,-4.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-44},{-208,-44},{-208,-162},{-193.2,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-68,-108},{-68,-151.5},{-92.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-140,-170},{-140,-172},{-120,-172},{-120,-144.6},{-105.6,-144.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-128.8,-128.636},{-128.8,-144.6},{-105.6,-144.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-185.5,-61},{-152,-61},{-152,-63.7273},{-151.2,-63.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-185.4,-80},{-154,-80},{-154,-77.0909},{-151.667,-77.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-187.5,-99},{-160,-99},{-160,-91.0909},{-151.667,-91.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-179.4,-162},{-166,-162},{-166,-117.818},{-151.667,-117.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-126,-58.6364},{-126,-54},{-68,-54},{-68,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-169,-52},{-126,-52},{-126,-58.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-49.4,-54},{-68,-54},{-68,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-38.6,-54},{9,-54},{9,-55}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{23,-55},{43.5,-55},{43.5,-54.4},{46.2,-54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{224.5,33},{232,33},{232,12},{209.714,12},{209.714,0.533333}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{191.5,35},{188.286,35},{188.286,0.533333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-54,-152},{-92.8,-152},{-92.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{54.4,-150.6},{-4,-150.6},{-4,-152},{-34,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{164.286,-35.1556},{164.286,-82.5778},{164,-82.5778},{164,-104.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-2,-103},{-2,-152},{-34,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-38.6,-54},{-2,-54},{-2,-85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, pump.OutFlow) annotation (Line(
      points={{-139,-20},{-146,-20},{-146,-4.6},{-119.6,-4.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-35.5,-31},{-30.75,-31},{-30.75,-39.6},{-26,-39.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-42},{-10,-42},{-10,-94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TempSfSysOut1.port, massFlowRate3.port_a) annotation (Line(
      points={{4,-40},{2,-40},{2,-54},{9,-54},{9,-55}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const4.y, pID1.SP) annotation (Line(
      points={{-227.5,55},{-222.75,55},{-222.75,46.4},{-210,46.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS, flow1DIncHeatInput.u) annotation (Line(
      points={{-199.7,44},{-188,44},{-188,24},{-163.8,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-133.3,79},{-118,79},{-118,106},{-248,106},{-248,41.6},{-210,
          41.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-132.7,-28},{-104,-28},{-104,-44.4},{-26,-44.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, pump.InFlow) annotation (Line(
      points={{65.8,-54.4},{76,-54.4},{76,-10},{-106.8,-10},{-106.8,-11.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-57,14},{-57,-10},{-106.8,-10},{-106.8,-11.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(timeTable.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-189.3,-127},{-172,-127},{-172,-104.136},{-151.9,-104.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Outlet_orc.port, DpSF1.InFlow) annotation (Line(
      points={{132,-72},{164,-72},{164,-104.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, flow1DIncHeatInput.outlet_fl2) annotation (Line(
      points={{-141,72},{-141,47.52},{-142.72,47.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF1.OutFlow, Mflow_orc.port_a) annotation (Line(
      points={{164,-115.4},{164,-128}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_orc.port_b, pump2.InFlow) annotation (Line(
      points={{164,-142},{162,-142},{162,-150},{67.2,-150},{67.2,-157.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_Bm_out.port_a) annotation (Line(
      points={{-142.72,47.52},{-132.36,47.52},{-132.36,60.5},{-115,60.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_Bm_out.port_b, oRCunitHx.InletSf) annotation (Line(
      points={{-92,60.5},{76,60.5},{76,36},{120,36},{120,-5.33333},{165.143,
          -5.33333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Inlet_orc.port, oRCunitHx.InletSf) annotation (Line(
      points={{136,12},{136,-5.33333},{165.143,-5.33333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, Mflow_Bm_out.port_b) annotation (Line(
      points={{-57,38},{-56,38},{-56,60.5},{-92,60.5}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{240,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{240,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II_Simone_V1_10_finale;
