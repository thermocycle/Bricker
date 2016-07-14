within BrickerISES.Tests.AD.TestComponents;
model Test_BMSys
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
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    pstart=100000,
    Tstart_inlet=473.15,
    Tstart_outlet=483.15,
    Tstart_inlet_wall=478.15,
    Tstart_outlet_wall=488.15) annotation (Placement(transformation(
        extent={{24,-31},{-24,31}},
        rotation=90,
        origin={-137,32})));

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
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-150,82},{-128,96}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID1(
    PVmin=0,
    CSmax=1,
    PVmax=440,
    CSstart=0.004,
    Td=0,
    Kp=0.1,
    CSmin=0.3,
    Ti=0.2)  annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-185,48})));
  Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
    annotation (Placement(transformation(extent={{-204,52},{-194,62}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10.5,9.5},{10.5,-9.5}},
        rotation=0,
        origin={-102.5,69.5})));
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
    p=200000,
    T_0=495.15)
    annotation (Placement(transformation(extent={{108,-16},{88,4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        200000)
    annotation (Placement(transformation(extent={{90,58},{110,78}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-186,-28},{-164,-14}})));
equation
  connect(BM.inlet_fl2,PumpBM. OutFlow) annotation (Line(
      points={{-141.34,8},{-141.34,1.4},{-117.6,1.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y,pID1. SP) annotation (Line(
      points={{-193.5,57},{-190,57},{-190,50.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID1.CS,BM. u) annotation (Line(
      points={{-179.7,48},{-178,48},{-178,32},{-161.8,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.T,pID1. PV) annotation (Line(
      points={{-131.3,89},{-82,89},{-82,114},{-212,114},{-212,45.6},{-190,45.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_BMout.port,BM. outlet_fl2) annotation (Line(
      points={{-139,82},{-139,55.52},{-140.72,55.52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(BM.outlet_fl2,MflowBM_out. port_a) annotation (Line(
      points={{-140.72,55.52},{-140.36,55.52},{-140.36,69.5},{-113,69.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowBM_in.port_b,PumpBM. InFlow) annotation (Line(
      points={{34,-6},{-22,-6},{-22,-5.5},{-104.8,-5.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_out.port_b,MflowBM_Recirculation. port_a) annotation (Line(
      points={{-92,69.5},{-49,69.5},{-49,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_Recirculation.port_b,PumpBM. InFlow) annotation (Line(
      points={{-49,20},{-49,-5.5},{-104.8,-5.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(T_inlet_ORC.port,MflowBM_mix. port_b) annotation (Line(
      points={{36,76},{36,70},{-2,70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(MflowBM_mix.port_a,MflowBM_Recirculation. port_a) annotation (Line(
      points={{-22,70},{-49,70},{-49,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, MflowBM_in.port_a) annotation (Line(
      points={{89,-6},{55,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, MflowBM_mix.port_b) annotation (Line(
      points={{91.6,68},{84,68},{84,52},{36,52},{36,70},{-2,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
      points={{-175,-28},{-174,-28},{-174,-36},{-134,-36},{-134,2},{-117.6,1.4}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (
    Diagram(coordinateSystem(extent={{-220,-100},{140,140}},
          preserveAspectRatio=false), graphics),
    Icon(coordinateSystem(extent={{-220,-100},{140,140}})),
    experiment(StopTime=2000),
    __Dymola_experimentSetupOutput);
end Test_BMSys;
