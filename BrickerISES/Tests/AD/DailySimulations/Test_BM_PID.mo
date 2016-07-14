within BrickerISES.Tests.AD.DailySimulations;
model Test_BM_PID
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-236,12},{-226,22}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    CSmin=0.3,
    Ti=20*100,
    Kp=15)   annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-203,52})));
  Components.Biomass.Flow1DIncHeatInput             BM(
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
        origin={-135,32})));

  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-150,82},{-128,96}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-102.5,69.5})));
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
    annotation (Placement(transformation(extent={{-102,-16},{-122,4}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=-90,
        origin={-49,30})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-12,70})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=0,
        origin={44.5,-6})));
  Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{22,76},{50,94}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    T_0=483.15)
    annotation (Placement(transformation(extent={{108,-20},{88,0}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000)
    annotation (Placement(transformation(extent={{100,56},{120,76}})));
  Modelica.Blocks.Sources.Trapezoid DNI(
    rising=2,
    falling=2,
    startTime=1000,
    nperiod=3,
    width=100,
    period=304,
    amplitude=-30,
    offset=210 + 273.15)
    annotation (Placement(transformation(extent={{126,20},{116,30}})));
equation
  connect(MflowBM_Recirculation.port_b,PumpBM. InFlow) annotation (Line(
      points={{-49,20},{-49,-5.5},{-104.8,-5.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a,MflowBM_Recirculation. port_a) annotation (Line(
      points={{-22,70},{-49,70},{-49,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b,MflowBM_Recirculation. port_a) annotation (Line(
      points={{-92,69.5},{-49,69.5},{-49,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b,PumpBM. InFlow) annotation (Line(
      points={{34,-6},{-22,-6},{-22,-5.5},{-104.8,-5.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID1.CS, BM.u) annotation (Line(
      points={{-197.7,52},{-192,52},{-192,50},{-184,50},{-184,32},{-159.8,32}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
      points={{-139,82},{-139,69},{-138.72,69},{-138.72,55.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
      points={{-113,69.5},{-140,70},{-139,69},{-138.72,69},{-138.72,55.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pID1.SP, const4.y) annotation (Line(
      points={{-208,54.4},{-218,54.4},{-218,17},{-225.5,17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T, pID1.PV) annotation (Line(
      points={{-131.3,89},{-128,89},{-128,104},{-228,104},{-228,49.6},{-208,
          49.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
      points={{36,76},{36,70},{-2,70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port, sinkP.flangeB) annotation (Line(
      points={{36,76},{36,66},{101.6,66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, MflowBM_in.port_a) annotation (Line(
      points={{89,-10},{68,-10},{68,-6},{55,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpBM.OutFlow, BM.inlet_fl2) annotation (Line(
      points={{-117.6,1.4},{-139.34,1.4},{-139.34,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DNI.y, sourceMdot.in_T) annotation (Line(
      points={{115.5,25},{98.2,25},{98.2,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-240,-120},{140,140}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-240,-120},{140,140}})),
    experiment(StartTime=-2000, StopTime=2000),
    __Dymola_experimentSetupOutput);
end Test_BM_PID;
