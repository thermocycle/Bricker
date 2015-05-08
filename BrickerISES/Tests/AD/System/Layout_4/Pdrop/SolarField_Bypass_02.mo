within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model SolarField_Bypass_02

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
    Unom=300,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    N=10,
    Ns=2,
    Nt=6,
    Mdotnom=1.3833,
    Tstart_inlet=423.15,
    Tstart_outlet=523.15,
    pstart=150000) annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-139,21})));

  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-196,42},{-186,52}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-196,20},{-186,30}})));
  Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
    annotation (Placement(transformation(extent={{-196,0},{-186,10}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-196,-20},{-186,-10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-180,-40},{-170,-30}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-132,-56},{-144,-44}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_EX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-102,78},{-88,92}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-56,-62},{-68,-50}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank1(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-70,88},{-58,76}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_BM_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-34,80},{-22,92}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ORC_EX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-24,-60},{-36,-48}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    p=300000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{30,-66},{10,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ByPass_SF(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,-2},{-58,10}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseNom=false,
    A=5e3,
    Mdot_nom=1.3833,
    k=7.74e7,
    p_nom=300000,
    T_nom=513.15,
    DELTAp_start=150000)
    annotation (Placement(transformation(extent={{-134,64},{-114,84}})));

  ThermoCycle.Components.Units.PdropAndValves.Valve valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.5857,
    UseNom=false,
    Afull=3.8e-5,
    DELTAp_0=150000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-60,28},{-80,48}})));
  Modelica.Blocks.Math.Gain Efficiency(k=0.7)
    annotation (Placement(transformation(extent={{-114,216},{-134,236}})));
  Modelica.Blocks.Sources.Constant const(k=200000)
    annotation (Placement(transformation(extent={{-74,216},{-94,236}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=5,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    pstart_f=150000,
    Tstart_inlet_f=503.15,
    Tstart_outlet_f=523.15) annotation (Placement(transformation(
        extent={{17,18},{-17,-18}},
        rotation=90,
        origin={-175,218})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump_BM(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    eta_em=1,
    eta_is=1,
    epsilon_v=1,
    M_dot_start=5,
    V_dot_max=0.0074,
    X_pp0=1,
    hstart=548005)
    annotation (Placement(transformation(extent={{-104,140},{-124,160}})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=1.974,
    rho_nom=5000,
    UseNom=false,
    h=0,
    A=5e3,
    k=2.69e7,
    DELTAp_0=20000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-116,262},{-96,282}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-38,144},{-58,164}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-64,282},{-44,262}})));
  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.5857,
    UseNom=false,
    Afull=0.0003,
    DELTAp_0=150000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-50,192},{-30,212}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank_BM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=1,
    V_tank=1,
    Mdotnom=5.28,
    p_ext=450000,
    Tstart=489.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-162,270},{-138,294}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    h_0=556000,
    pstart=150000)
    annotation (Placement(transformation(extent={{150,182},{196,228}})));

  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SBM_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=0,
        origin={17,279})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank_SF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=1,
    V_tank=1,
    Mdotnom=1.947,
    p_ext=150000,
    Tstart=489.15,
    pstart=150000)
    annotation (Placement(transformation(extent={{16,88},{40,112}})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump_TO_BM(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    eta_em=1,
    eta_is=1,
    epsilon_v=1,
    M_dot_start=5,
    X_pp0=1,
    V_dot_max=0.002646,
    hstart=479180)
    annotation (Placement(transformation(extent={{46,132},{26,152}})));

equation
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-169.5,-35},{-125.56,-35},{-125.56,2.94}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_SU.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (
      Line(
      points={{-142.2,-52.88},{-142.2,-12},{-139.42,-12},{-139.42,0.42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank1.port_2, Sens_BM_SU.InFlow) annotation (Line(
      points={{-58,82},{-34,82},{-34,83.12},{-32.2,83.12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_ORC_EX.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{-25.8,-56.88},{-10.9,-56.88},{-10.9,-56},{11,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_ORC_EX.OutFlow, TJ_ExpTank.port_1) annotation (Line(
      points={{-34.2,-56.88},{-36,-56.88},{-36,-56},{-56,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-185.5,47},{-172,47},{-172,36.54},{-158.32,36.54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-185.5,25},{-158.53,25},{-158.53,26.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-185.5,5},{-172,5},{-172,16.17},{-158.53,16.17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-185.5,-15},{-166,-15},{-166,6.72},{-158.32,6.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Sens_SF_SU.InFlow, TJ_ExpTank.port_2) annotation (Line(
      points={{-133.8,-52.88},{-106,-52.88},{-106,-56},{-68,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, TJ_ExpTank1.port_3) annotation (Line(
      points={{-79,38},{-86,38},{-86,64},{-64,64},{-64,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_3, Sens_ByPass_SF.InFlow) annotation (Line(
      points={{-62,-50},{-62,-36},{-40,-36},{-40,1.12},{-47.8,1.12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_ByPass_SF.OutFlow, valve1.InFlow) annotation (Line(
      points={{-56.2,1.12},{-70,1.12},{-70,20},{-50,20},{-50,38},{-61,38}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(solarField_Soltigua_Inc.OutFlow, dP.InFlow) annotation (Line(
      points={{-139.42,41.58},{-139.42,74},{-133,74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Sens_SF_EX.InFlow) annotation (Line(
      points={{-115,74},{-106,74},{-106,81.64},{-99.9,81.64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_EX.OutFlow, TJ_ExpTank1.port_1) annotation (Line(
      points={{-90.1,81.64},{-73.05,81.64},{-73.05,82},{-70,82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y,Efficiency. u) annotation (Line(
      points={{-95,226},{-112,226}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Efficiency.y,simpleBiomassBoiler. Q) annotation (Line(
      points={{-135,226},{-136,226},{-136,226.84},{-161.5,226.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.inlet, pump_BM.OutFlow) annotation (Line(
      points={{-168.16,200.66},{-168.16,157.4},{-119.6,157.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ1.port_3, valve.InFlow) annotation (Line(
      points={{-54,262},{-54,238},{-62,238},{-62,202},{-49,202}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, TJ2.port_3) annotation (Line(
      points={{-31,202},{-26,202},{-26,182},{-48,182},{-48,164}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_2, pump_BM.InFlow) annotation (Line(
      points={{-58,154},{-68,154},{-68,156},{-98,156},{-98,150.5},{-106.8,
          150.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, TJ1.port_1) annotation (Line(
      points={{-97,272},{-64,272}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, Tank_BM.InFlow) annotation (Line(
      points={{-169.24,235},{-169.24,271.92},{-161.76,271.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank_BM.OutFlow, dP1.InFlow) annotation (Line(
      points={{-138.24,271.92},{-127.12,271.92},{-127.12,272},{-115,272}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(TJ1.port_2, Sens_SBM_SU.InFlow) annotation (Line(
      points={{-44,272},{-18,272},{-18,271.8},{6.5,271.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_SBM_SU.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{27.5,271.8},{76,271.8},{76,205},{150.46,205}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_BM_SU.OutFlow, Tank_SF.InFlow) annotation (Line(
      points={{-23.8,83.12},{-6,83.12},{-6,89.92},{16.24,89.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank_SF.OutFlow, pump_TO_BM.InFlow) annotation (Line(
      points={{39.76,89.92},{60,89.92},{60,142.5},{43.2,142.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_TO_BM.OutFlow, TJ2.port_1) annotation (Line(
      points={{30.4,149.4},{-26,149.4},{-26,154},{-38,154}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,
            -220},{200,320}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-220,-220},{200,320}})));
end SolarField_Bypass_02;
