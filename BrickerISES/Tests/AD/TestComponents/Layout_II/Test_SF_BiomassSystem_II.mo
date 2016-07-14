within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_BiomassSystem_II

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       400000)  annotation (Placement(transformation(extent={{118,96},{138,
            116}})));
  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={72,44})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{32,96},{52,116}})));
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
        origin={-106.5,44.5})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-164,52},{-150,66}})));
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
    annotation (Placement(transformation(extent={{-44,-18},{-64,2}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{44,-16},{24,4}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,38},{10,58}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-116,118},{-88,140}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{82,122},{96,134}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-230,-122},{-210,-102}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-228,-96},{-208,-76}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-224,-68},{-204,-48}})));
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
    annotation (Placement(transformation(extent={{-82,-162},{-102,-142}})));
 Components.Valve_lin             ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Afull=5.7971e-05,
    Mdot_nom=0.4,
    Xopen=0.075)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={14,-98})));
  Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-164,-166},{-148,-152}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=2.9,
    T_0=436.15) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,-154})));
  Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-206,-18},{-224,-2}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-96})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{-222,-202},{-204,-184}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-7,-6},{7,6}},
        rotation=0,
        origin={32,-63})));
  Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-24,-152})));
  Modelica.Blocks.Sources.Constant Tamb1(k=670)
    annotation (Placement(transformation(extent={{-230,-152},{-210,-132}})));
  Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{78,-48},{60,-32}})));
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
    annotation (Placement(transformation(extent={{-182,-130},{-140,-60}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.97823e+07)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-24,-54})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.5,
    Mdotnom=2.9,
    p_ext=450000,
    Tstart=477.15,
    pstart=450000,
    L_lstart=0.1)
    annotation (Placement(transformation(extent={{96,-66},{116,-46}})));
equation
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-149.3,59},{-142,59},{-142,44.5},{-128.5,44.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-110.35,24},{-110.35,-0.6},{-59.6,-0.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.InFlow, Mflow_BmRecirculation.port_a) annotation (Line(
      points={{33,106},{12,106},{12,104},{-26,104},{-26,48},{-10,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{24,-6},{-12,-6},{-12,-7.5},{-46.8,-7.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{10,48},{10,0},{6,0},{6,-7.5},{-46.8,-7.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{51,106},{72,106},{72,53}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{51,106},{119.6,106}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, sinkP.flangeB) annotation (Line(
      points={{89,122},{90,122},{90,106},{119.6,106}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_BmRecirculation.port_a)
    annotation (Line(
      points={{-109.8,64.59},{-109.8,94},{-26,94},{-26,48},{-10,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, Mflow_BmRecirculation.port_a) annotation (Line(
      points={{-102,118},{-102,94},{-26,94},{-26,48},{-10,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TempSfOut.T, hysteresis.u) annotation (Line(
      points={{-221.3,-10},{-252,-10},{-252,-188},{-240,-188},{-240,-193},{
          -223.8,-193}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
      points={{-60,-106},{-60,-151.5},{-84.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperature_IN_SF.port, pump1.OutFlow) annotation (Line(
      points={{-156,-166},{-156,-168},{-118,-168},{-118,-144.6},{-97.6,-144.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
      points={{-34,-152},{-28,-152},{-28,-151.5},{-84.8,-151.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
      points={{14,-107},{14,-152},{-14,-152}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowToSf.port_a, sourceMdot1.flangeB) annotation (Line(
      points={{-14,-152},{46,-152},{46,-154},{71,-154}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow,massFlowRate3. port_a) annotation (Line(
      points={{14,-89},{14,-62},{25,-62},{25,-63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
      points={{-156.8,-130.636},{-156.8,-144.6},{-97.6,-144.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-203,-58},{-192,-58},{-192,-65.7273},{-179.2,-65.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-207,-86},{-194,-86},{-194,-79.0909},{-179.667,-79.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-209,-112},{-200,-112},{-200,-93.0909},{-179.667,-93.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-209,-142},{-206,-142},{-206,-118},{-194,-118},{-194,-106.136},
          {-179.9,-106.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
      points={{-203.1,-193},{-190,-193},{-190,-119.818},{-179.667,-119.818}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
    annotation (Line(
      points={{-154,-60.6364},{-154,-54},{-60,-54},{-60,-86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-215,-18},{-216,-18},{-216,-32},{-154,-32},{-154,-60.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
      points={{-29.4,-54},{-60,-54},{-60,-86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
      points={{-18.6,-54},{-6,-54},{-6,-62},{25,-62},{25,-63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
      points={{39,-63},{54,-63},{54,-64.4},{96.2,-64.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
      points={{115.8,-64.4},{126,-64.4},{126,-6},{44,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
      points={{69,-48},{70,-48},{70,-64.4},{96.2,-64.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
      points={{72,35},{72,-6},{44,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,
            -200},{160,120}}), graphics), Icon(coordinateSystem(extent={{-240,
            -200},{160,120}})));
end Test_SF_BiomassSystem_II;
