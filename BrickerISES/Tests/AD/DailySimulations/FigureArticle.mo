within BrickerISES.Tests.AD.DailySimulations;
model FigureArticle
/* Simulazione di una giornata tipo - carico termico variabile - Def totale */
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
    annotation (Placement(transformation(extent={{-72,-26},{-92,-6}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-138,72},{-160,86}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-188,-134},{-176,-122}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-190,-112},{-178,-100}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-190,-90},{-180,-80}})));
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
    annotation (Placement(transformation(extent={{-78,-178},{-98,-158}})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.074) annotation (Placement(transformation(
        extent={{-11,-12},{11,12}},
        rotation=90,
        origin={0,-119})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
        273.15, uLow=200 + 273.15)
    annotation (Placement(transformation(extent={{-188,-176},{-176,-164}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-120,-26},{-102,-42}})));

  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-48,-76})));
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
    annotation (Placement(transformation(extent={{166,-64},{226,-20}})));

  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{238,-4},{228,6}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{220,14},{210,24}})));
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
    annotation (Placement(transformation(extent={{142,-186},{122,-166}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=1.37457e+07)
    annotation (Placement(transformation(extent={{11,-11},{-11,11}},
        rotation=90,
        origin={163,-115})));
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
        origin={-21,-118})));
  Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
    annotation (Placement(transformation(extent={{-54,-112},{-42,-100}})));
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-208,42},{-198,52}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Water,
    UseT=true,
    Mdot_0=1,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={230,52})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={254,108})));
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
    annotation (Placement(transformation(extent={{144,104},{166,126}})));
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
        origin={200.5,82.5})));

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
        origin={53,86})));
  Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
    annotation (Placement(transformation(extent={{8,94},{18,104}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{234,124},{208,138}})));
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
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={77,89})));
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-190,-156},{-176,-142}})));
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
        origin={-181,34})));
  Components.Biomass.Flow1DIncHeatInput             BM1(
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
        origin={-131,34})));
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
    TotalDefocusing=true,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-150,-156},{-108,-84}})));

  Components.GeneralCombiTableModel.GeneralCombiTable generalCombiTable(
      redeclare package AmbientDataTable =
        BrickerISES.Components.GeneralCombiTableModel.Tables.WaterMassFlowDataTable_3Sept)
    annotation (Placement(transformation(extent={{260,58},{246,72}})));
protected
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow1
    annotation (Placement(transformation(extent={{-45,63},{-43,65}})));
protected
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow2
    annotation (Placement(transformation(extent={{-1,-77},{1,-75}})));
equation
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-175.3,-66},{-208,-66},{-208,-170},{-189.2,-170}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));

  connect(const1.y, ORC.TWfORCSu) annotation (Line(
      points={{227.5,1},{210,1},{210,-6},{209.714,-6},{209.714,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));

  connect(const2.y, ORC.MdotWfORC) annotation (Line(
      points={{209.5,19},{188.286,19},{188.286,-21.4667}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
      points={{164.286,-57.1556},{164.286,-104.578},{163,-104.578},{163,-105.1}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));

  connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
      points={{-39,-76},{6.66134e-016,-76},{6.66134e-016,-109.1}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-111,-26},{-112,-26},{-112,-8.6},{-87.6,-8.6}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(const3.y, pID.SP) annotation (Line(
      points={{-41.4,-106},{-30.75,-106},{-30.75,-115.6},{-26,-115.6}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(pID.CS, ValveSF.cmd) annotation (Line(
      points={{-15.7,-118},{-9.6,-118},{-9.6,-119}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));

  connect(Temp_BMin.T, pID.PV) annotation (Line(
      points={{-104.7,-34},{-80,-34},{-80,-120.4},{-26,-120.4}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(PumpHxOil_2.OutFlow, HxOilWater.inlet_fl2) annotation (Line(
      points={{161.16,123.14},{195.192,123.14},{195.192,93.4308}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(const5.y, pID2.SP) annotation (Line(
      points={{18.5,99},{26.25,99},{26.25,88.4},{48,88.4}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
      points={{48,83.6},{-6,83.6},{-6,130},{202,130},{202,132},{212,132},{212,
          131},{211.9,131}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{68.86,95.16},{70,95.16},{70,116},{116,116},{116,115.55},{147.08,
          115.55}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(BM1.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-135.34,10},{-134,10},{-134,-8.6},{-87.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-124.8,-156.655},{-124.8,-160.6},{-93.6,-160.6}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-179.5,-85},{-166,-85},{-166,-89.8909},{-147.2,-89.8909}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-177.4,-106},{-168,-106},{-168,-103.636},{-147.667,-103.636}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-175.4,-128},{-168,-128},{-168,-118.036},{-147.667,-118.036}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(aM_DNI.DNI, SF.DNI) annotation (Line(
      points={{-175.86,-149},{-162,-149},{-162,-126},{-147.9,-126},{-147.9,
          -131.455}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(hysteresis.y, SF.Defocusing) annotation (Line(
      points={{-175.4,-170},{-156,-170},{-156,-145.527},{-147.667,-145.527}},
      color={255,0,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(generalCombiTable.OutPut, sourceMdot.in_Mdot) annotation (Line(
      points={{245.86,65},{236,65},{236,58}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(Temp_BMout.port, BM1.outlet_fl2) annotation (Line(
      points={{-149,72},{-148,72},{-148,66},{-134.72,66},{-134.72,57.52}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpSF.InFlow, SF.OutFlow) annotation (Line(
      points={{-57,-76},{-122,-76},{-122,-84.6545}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpSF.InFlow, ValveSF.InFlow) annotation (Line(
      points={{-80.8,-167.5},{-4.44089e-016,-167.5},{-4.44089e-016,-128.9}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpORC.OutFlow, ValveSF.InFlow) annotation (Line(
      points={{126.4,-168.6},{0,-168.6},{0,-168},{-4.44089e-016,-168},{
          -4.44089e-016,-128.9}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpSF.InFlow, SF.OutFlow) annotation (Line(
      points={{-80.8,-167.5},{-68,-167.5},{-68,-76},{-122,-76},{-122,-84.6545}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));

  connect(DpSF1.OutFlow, PumpORC.InFlow) annotation (Line(
      points={{163,-124.9},{163,-175.5},{139.2,-175.5}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(HxOilWater.outlet_fl2, PumpHxOil_2.InFlow) annotation (Line(
      points={{195.369,71.5692},{195.369,54},{118,54},{118,115.55},{147.08,
          115.55}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpORC.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
      points={{126.4,-168.6},{126.4,-168},{118,-168},{118,115.55},{147.08,
          115.55}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(sourceMdot.flangeB, HxOilWater.inlet_fl1) annotation (Line(
      points={{221,52},{221,54},{204.923,54},{204.923,71.3462}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(BM1.outlet_fl2, PumpHxOil_1.InFlow) annotation (Line(
      points={{-134.72,57.52},{-134.72,66},{76.45,66},{76.45,81.08}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpHxOil_1.InFlow, ORC.InletSf) annotation (Line(
      points={{76.45,81.08},{76.45,24},{165.143,24},{165.143,-27.3333}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpBM.InFlow, Tank1.OutFlow) annotation (Line(
      points={{-74.8,-15.5},{86,-15.5},{86,-76.4},{71.8,-76.4}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpBM.InFlow, InFlow1) annotation (Line(
      points={{-74.8,-15.5},{-44,-15.5},{-44,64}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(sinkP.flangeB, HxOilWater.outlet_fl1) annotation (Line(
      points={{245.6,108},{204.923,108},{204.923,93.6538}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(Temp_HEX_water_outlet.port, HxOilWater.outlet_fl1) annotation (Line(
      points={{221,124},{221,108},{204.923,108},{204.923,93.6538}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(Tank1.InFlow, InFlow2) annotation (Line(
      points={{52.2,-76.4},{28,-76.4},{28,-76},{0,-76}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TempSfOut.port, SF.OutFlow) annotation (Line(
      points={{-169,-74},{-168,-74},{-168,-78},{-122,-78},{-122,-84.6545}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(pID3.CS, BM1.u) annotation (Line(
      points={{-175.7,34},{-155.8,34}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(const4.y, pID3.SP) annotation (Line(
      points={{-197.5,47},{-192,47},{-192,36.4},{-186,36.4}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(pID3.PV, Temp_BMout.T) annotation (Line(
      points={{-186,31.6},{-196,31.6},{-196,32},{-212,32},{-212,79},{-156.7,79}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));

  connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
      points={{58.3,86},{64,86},{64,85.48},{68.2,85.48}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
            -200},{360,200}})),
    experiment(StartTime=-5000, StopTime=75000),
    __Dymola_experimentSetupOutput);
end FigureArticle;
