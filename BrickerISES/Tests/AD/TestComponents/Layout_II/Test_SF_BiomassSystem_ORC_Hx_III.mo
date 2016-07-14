within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_BiomassSystem_ORC_Hx_III

  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-94,18})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{-138,38},{-118,58}})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    Mdotnom=9.4,
    QcombustionStart=210e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    QcombustionNominal=200e3,
    Unom=1000,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{20.5,-27.5},{-20.5,27.5}},
        rotation=90,
        origin={-198.5,20.5})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-276,60},{-256,80}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.026507,
    hstart=575410,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-162,-26},{-182,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-118,-26},{-138,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={-152,13})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-210,56},{-188,70}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-82,56},{-68,68}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-252,-104},{-242,-94}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-254,-86},{-242,-74}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-252,-66},{-242,-56}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    V_dot_max=0.0064588,
    M_dot_start=2.5,
    hstart=3.46e5,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-146,-162},{-166,-142}})));
 Components.Valve_lin             ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-58,-94})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-204,-170},{-188,-156}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-188,-48},{-206,-32}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,-98})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-248,-168},{-236,-156}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={-40,-55})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-152})));
  Modelica.Blocks.Sources.Constant Tamb1(k=670)
    annotation (Placement(transformation(extent={{-252,-126},{-242,-116}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-26,-44},{-44,-28}})));
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
    annotation (Placement(transformation(extent={{-210,-128},{-168,-58}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-100,-54})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.2,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-10,-56},{10,-36}})));
  Components.ORC.ORCunitHx_v1 oRCunitHx(
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
    annotation (Placement(transformation(extent={{56,-76},{116,-32}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{104,-4},{114,6}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{92,-4},{82,6}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.9,
    V_tank=0.2,
    p_ext=400000,
    Tstart=498.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{-40,46},{-20,66}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    V_dot_max=0.00753484,
    M_dot_start=2.9,
    hstart=361133,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{14,-168},{-6,-148}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={168,136})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump3(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    V_dot_max=0.00909278,
    M_dot_start=3.9,
    hstart=145528,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{76,96},{56,116}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=270,
        origin={30,-85})));
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
        origin={128.5,92.5})));
 Components.Valve_lin             ValveSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=4e-06,
    Xopen=0.5,
    Mdot_nom=0.1,
    DELTAp_nom=50000)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,90})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    L_lstart=0.9,
    Mdotnom=3.9,
    V_tank=0.2,
    p_ext=350000,
    Tstart=353.15,
    pstart=350000)
    annotation (Placement(transformation(extent={{80,132},{100,152}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={56,-108})));
  Components.Chiller.Chiller_v2 chiller_v1_1(
    redeclare package Medium = ThermoCycle.Media.Water,
    T_start_su=343.15,
    m_start=8)
    annotation (Placement(transformation(extent={{200,56},{220,94}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut1(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{194,106},{176,122}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium =
        ThermoCycle.Media.Water)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={140,131})));
  Modelica.Blocks.Sources.Constant ThermalDemand(k=250000)
    annotation (Placement(transformation(extent={{216,112},{236,132}})));
  Modelica.Blocks.Sources.Constant const3(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{130,-4},{140,6}})));
equation
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-255,70},{-236,70},{-236,20.5},{-220.5,20.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-202.35,3.55271e-015},{-202.35,-8.6},{-177.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{-119,48},{-94,48},{-94,27}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-203.3,-40},{-256,-40},{-256,-162},{-249.2,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-124,-108},{-124,-151.5},{-148.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-196,-170},{-196,-172},{-176,-172},{-176,-144.6},{-161.6,-144.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-184.8,-128.636},{-184.8,-144.6},{-161.6,-144.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-241.5,-61},{-208,-61},{-208,-63.7273},{-207.2,-63.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-241.4,-80},{-210,-80},{-210,-77.0909},{-207.667,-77.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-241.5,-99},{-216,-99},{-216,-91.0909},{-207.667,-91.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-241.5,-121},{-240,-121},{-240,-120},{-228,-120},{-228,
          -104.136},{-207.9,-104.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-235.4,-162},{-222,-162},{-222,-117.818},{-207.667,-117.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-182,-58.6364},{-182,-54},{-124,-54},{-124,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-197,-48},{-182,-48},{-182,-58.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-105.4,-54},{-124,-54},{-124,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-94.6,-54},{-47,-54},{-47,-55}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
      points={{9.8,-54.4},{18,-54.4},{18,-16},{-118,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
      points={{-94,9},{-94,-16},{-118,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{-33,-55},{-12.5,-55},{-12.5,-54.4},{-9.8,-54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
      points={{-201.8,40.59},{-201.8,48},{-137,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
      points={{-199,56},{-199,48},{-137,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
      points={{-152,20},{-152,48},{-137,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-152,6},{-152,-15.5},{-164.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{-138,-16},{-152,-16},{-152,-15.5},{-164.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
      points={{-35,-44},{-26,-44},{-26,-50},{-24.5,-50},{-24.5,-54.4},{-9.8,-54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{114.5,1},{122,1},{122,-22},{90.2857,-22},{90.2857,-32.4889}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{81.5,1},{70.5714,1},{70.5714,-32.4889}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-110,-152},{-148.8,-152},{-148.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
      points={{-119,48},{-39.8,48},{-39.8,47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{-20.2,47.6},{55.1429,47.6},{55.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
      points={{-75,56},{-74,56},{-74,48},{-39.8,48},{-39.8,47.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{-1.6,-150.6},{-60,-150.6},{-60,-152},{-90,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
      points={{140,47},{140,58},{132,58},{132,81.3462},{132.923,81.3462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
      points={{123.369,81.5692},{123.369,64},{30,64},{30,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{73.2,106.5},{74,106.5},{74,64},{30,64},{30,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.OutFlow, Tank3.InFlow) annotation (Line(
      points={{60.4,113.4},{60.4,133.6},{80.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{99.8,133.6},{123.192,133.6},{123.192,103.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{54.2857,-69.1556},{54.2857,-82.5778},{56,-82.5778},{56,-102.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(DpSF1.OutFlow, pump2.InFlow) annotation (Line(
      points={{56,-113.4},{56,-160},{11.2,-160},{11.2,-157.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump2.InFlow) annotation (Line(
      points={{30,-92},{30,-160},{11.2,-160},{11.2,-157.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-58,-103},{-58,-150},{-60,-150},{-60,-152},{-90,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-94.6,-54},{-58,-54},{-58,-85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{16,81},{16,48},{55.1429,48},{55.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.OutFlow, Tank3.InFlow) annotation (Line(
      points={{16,99},{16,134},{62,134},{62,133.6},{80.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfSysOut1.port, sinkP.flangeB) annotation (Line(
      points={{185,106},{184,106},{184,100},{152,100},{152,118},{168,118},{168,127.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(TempSfSysOut1.T, chiller_v1_1.Tsu) annotation (Line(
      points={{178.7,114},{172,114},{172,90.2},{199.4,90.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, massFlowRate1.port_a) annotation (Line(
      points={{132.923,103.654},{132.923,114},{128,114},{128,131},{133,131}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate1.port_b, sinkP.flangeB) annotation (Line(
      points={{147,131},{150,131},{150,116},{152,116},{152,118},{168,118},{168,127.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(massFlowRate1.m_flow, chiller_v1_1.mdotsu) annotation (Line(
      points={{140,137.6},{140,144},{154,144},{154,80.32},{199.4,80.32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ThermalDemand.y, chiller_v1_1.Q_td) annotation (Line(
      points={{237,122},{248,122},{248,82.22},{220.8,82.22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, oRCunitHx.T_cf_su) annotation (Line(
      points={{140.5,1},{156,1},{156,-26},{110.857,-26},{110.857,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{300,180}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{300,180}})));
end Test_SF_BiomassSystem_ORC_Hx_III;
