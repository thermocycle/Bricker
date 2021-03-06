within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_BiomassSystem_ORC_Hx_II

  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-78,18})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{-122,38},{-102,58}})));
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
        origin={-182.5,20.5})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-260,60},{-240,80}})));
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
    annotation (Placement(transformation(extent={{-146,-26},{-166,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-102,-26},{-122,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={-136,13})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-194,56},{-172,70}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,56},{-52,68}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-236,-104},{-226,-94}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-238,-86},{-226,-74}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-236,-66},{-226,-56}})));
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
    annotation (Placement(transformation(extent={{-130,-162},{-150,-142}})));
 Components.Valve_lin             ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-42,-94})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-188,-170},{-172,-156}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-172,-48},{-190,-32}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-108,-98})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-232,-168},{-220,-156}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={-24,-55})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-152})));
  Modelica.Blocks.Sources.Constant Tamb1(k=670)
    annotation (Placement(transformation(extent={{-236,-126},{-226,-116}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,-44},{-28,-28}})));
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
    annotation (Placement(transformation(extent={{-194,-128},{-152,-58}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-84,-54})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.1,
    V_tank=0.2,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{6,-56},{26,-36}})));
  Components.ORC.ORCunitHx oRCunitHx(
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
    annotation (Placement(transformation(extent={{72,-76},{132,-32}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{120,-6},{130,4}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{108,-4},{98,6}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.9,
    L_lstart=0.9,
    V_tank=0.2,
    p_ext=400000,
    Tstart=498.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{-24,46},{-4,66}})));
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
    annotation (Placement(transformation(extent={{30,-168},{10,-148}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=7.96,
    p=100000,
    T_0=340.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={156,38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={184,136})));
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
    annotation (Placement(transformation(extent={{92,96},{72,116}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=270,
        origin={46,-85})));
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
        origin={144.5,92.5})));
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
        origin={32,90})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    L_lstart=0.9,
    Mdotnom=3.9,
    V_tank=0.2,
    p_ext=350000,
    Tstart=353.15,
    pstart=350000)
    annotation (Placement(transformation(extent={{96,132},{116,152}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=90,
        origin={72,-108})));
equation
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-239,70},{-220,70},{-220,20.5},{-204.5,20.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-186.35,3.55271e-015},{-186.35,-8.6},{-161.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{-103,48},{-78,48},{-78,27}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-187.3,-40},{-240,-40},{-240,-162},{-233.2,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-108,-108},{-108,-151.5},{-132.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-180,-170},{-180,-172},{-160,-172},{-160,-144.6},{-145.6,
          -144.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-168.8,-128.636},{-168.8,-144.6},{-145.6,-144.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-225.5,-61},{-192,-61},{-192,-63.7273},{-191.2,-63.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-225.4,-80},{-194,-80},{-194,-77.0909},{-191.667,-77.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-225.5,-99},{-200,-99},{-200,-91.0909},{-191.667,-91.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-225.5,-121},{-224,-121},{-224,-120},{-212,-120},{-212,
          -104.136},{-191.9,-104.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-219.4,-162},{-206,-162},{-206,-117.818},{-191.667,-117.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-166,-58.6364},{-166,-54},{-108,-54},{-108,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-181,-48},{-166,-48},{-166,-58.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-89.4,-54},{-108,-54},{-108,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-78.6,-54},{-31,-54},{-31,-55}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
      points={{25.8,-54.4},{34,-54.4},{34,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
      points={{-78,9},{-78,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{-17,-55},{3.5,-55},{3.5,-54.4},{6.2,-54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
      points={{-185.8,40.59},{-185.8,48},{-121,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
      points={{-183,56},{-183,48},{-121,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
      points={{-136,20},{-136,48},{-121,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-136,6},{-136,-15.5},{-148.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{-122,-16},{-136,-16},{-136,-15.5},{-148.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
      points={{-19,-44},{-10,-44},{-10,-50},{-8.5,-50},{-8.5,-54.4},{6.2,
          -54.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{130.5,-1},{138,-1},{138,-22},{115.714,-22},{115.714,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{97.5,1},{94.2857,1},{94.2857,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-94,-152},{-132.8,-152},{-132.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
      points={{-103,48},{-23.8,48},{-23.8,47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{-4.2,47.6},{71.1429,47.6},{71.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
      points={{-59,56},{-58,56},{-58,48},{-23.8,48},{-23.8,47.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{14.4,-150.6},{-44,-150.6},{-44,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
      points={{156,47},{156,58},{148,58},{148,81.3462},{148.923,81.3462}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{148.923,103.654},{148.923,118},{184,118},{184,127.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
      points={{139.369,81.5692},{139.369,64},{46,64},{46,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.InFlow, massFlowRate2.port_a) annotation (Line(
      points={{89.2,106.5},{90,106.5},{90,64},{46,64},{46,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump3.OutFlow, Tank3.InFlow) annotation (Line(
      points={{76.4,113.4},{76.4,133.6},{96.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
      points={{115.8,133.6},{139.192,133.6},{139.192,103.431}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{70.2857,-69.1556},{70.2857,-82.5778},{72,-82.5778},{72,-102.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(DpSF1.OutFlow, pump2.InFlow) annotation (Line(
      points={{72,-113.4},{72,-160},{27.2,-160},{27.2,-157.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate2.port_b, pump2.InFlow) annotation (Line(
      points={{46,-92},{46,-160},{27.2,-160},{27.2,-157.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-42,-103},{-42,-150},{-44,-150},{-44,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-78.6,-54},{-42,-54},{-42,-85}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{32,81},{32,48},{71.1429,48},{71.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF1.OutFlow, Tank3.InFlow) annotation (Line(
      points={{32,99},{32,134},{78,134},{78,133.6},{96.2,133.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{240,160}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{240,160}})));
end Test_SF_BiomassSystem_ORC_Hx_II;
