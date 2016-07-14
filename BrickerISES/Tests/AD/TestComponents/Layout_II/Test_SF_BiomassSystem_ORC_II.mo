within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_BiomassSystem_ORC_II

  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-78,28})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{-124,48},{-104,68}})));
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
        origin={-180.5,28.5})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-238,22},{-224,36}})));
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
    annotation (Placement(transformation(extent={{-156,-26},{-176,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-102,-26},{-122,-6}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={-136,29})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-198,74},{-170,96}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-68,66},{-54,78}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-238,-108},{-224,-94}})));
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
    annotation (Placement(transformation(extent={{-120,-162},{-140,-142}})));
 Components.Valve_lin             ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.075)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-46,-88})));
  Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-188,-170},{-172,-156}})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-178,-46},{-196,-30}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-108,-98})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-222,-202},{-204,-184}})));
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
    annotation (Placement(transformation(extent={{-238,-142},{-226,-130}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{6,-50},{-12,-34}})));
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
    Tstart_inlet=436.15,
    Tstart_outlet=476.15,
    pstart=100000,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal)
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
    V_tank=0.5,
    Mdotnom=2.9,
    L_lstart=0.1,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
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
    annotation (Placement(transformation(extent={{90,-76},{150,-32}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=60 + 273.15)
    annotation (Placement(transformation(extent={{136,6},{156,26}})));
  Modelica.Blocks.Sources.Constant const2(k=2.45)
    annotation (Placement(transformation(extent={{154,42},{134,62}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.5,
    Mdotnom=2.9,
    L_lstart=0.9,
    p_ext=400000,
    Tstart=498.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{6,56},{26,76}})));
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
equation
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-223.3,29},{-216,29},{-216,28.5},{-202.5,28.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-184.35,8},{-184.35,-8.6},{-171.6,-8.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{-105,58},{-78,58},{-78,37}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-193.3,-38},{-252,-38},{-252,-188},{-240,-188},{-240,-193},{
          -223.8,-193}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-108,-108},{-108,-151.5},{-122.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
      points={{-180,-170},{-180,-172},{-152,-172},{-152,-144.6},{-135.6,
          -144.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{-46,-97},{-46,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-168.8,-128.636},{-168.8,-144.6},{-135.6,-144.6}},
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
      points={{-223.3,-101},{-200,-101},{-200,-91.0909},{-191.667,-91.0909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-225.4,-136},{-212,-136},{-212,-138},{-200,-138},{-200,
          -104.136},{-191.9,-104.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-203.1,-193},{-190,-193},{-190,-117.818},{-191.667,-117.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-166,-58.6364},{-166,-54},{-108,-54},{-108,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-187,-46},{-188,-46},{-188,-48},{-166,-48},{-166,-58.6364}},
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
      points={{27.8,-52.4},{34,-52.4},{34,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
      points={{-78,19},{-78,-16},{-102,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{-17,-55},{3.5,-55},{3.5,-52.4},{8.2,-52.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
      points={{-183.8,48.59},{-183.8,58},{-123,58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
      points={{-184,74},{-184,58},{-123,58}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
      points={{-136,36},{-136,58},{-123,58}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{-136,22},{-136,-15.5},{-158.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{-122,-16},{-136,-16},{-136,-15.5},{-158.8,-15.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
      points={{-3,-50},{-4,-50},{-4,-58},{2,-58},{2,-64},{3.5,-64},{3.5,-52.4},
          {8.2,-52.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-46,-79},{-46,-54},{-31,-54},{-31,-55}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{157,16},{162,16},{162,-22},{133.714,-22},{133.714,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{133,52},{112.286,52},{112.286,-33.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-94,-152},{-122.8,-152},{-122.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
      points={{-105,58},{6.2,58},{6.2,57.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{25.8,57.6},{89.1429,57.6},{89.1429,-39.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
      points={{-61,66},{-60,66},{-60,58},{6.2,58},{6.2,57.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, pump2.InFlow) annotation (Line(
      points={{88.2857,-69.1556},{88.2857,-157.5},{27.2,-157.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
      points={{14.4,-150.6},{-44,-150.6},{-44,-152},{-74,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,
            -200},{220,160}}), graphics), Icon(coordinateSystem(extent={{-240,
            -200},{220,160}})));
end Test_SF_BiomassSystem_ORC_II;
