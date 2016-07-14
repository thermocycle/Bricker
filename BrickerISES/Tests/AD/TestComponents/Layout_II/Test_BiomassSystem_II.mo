within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_BiomassSystem_II

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       400000)  annotation (Placement(transformation(extent={{126,52},{146,72}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.9,
    p=450000,
    T_0=471.15)
    annotation (Placement(transformation(extent={{152,-62},{132,-42}})));
  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    CheckValve=true,
    Xopen=0.344,
    Mdot_nom=0.93,
    Afull=9.88372e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,0})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    UseHomotopy=true,
    k=2.93032e+07,
    DELTAp_start=50000)
         annotation (Placement(transformation(extent={{40,52},{60,72}})));
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
        origin={-98.5,0.5})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-156,8},{-142,22}})));
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
    annotation (Placement(transformation(extent={{-36,-62},{-56,-42}})));
  Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{52,-60},{32,-40}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-2,-6},{18,14}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-108,74},{-80,96}})));
  Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{90,78},{104,90}})));
equation
  connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
      points={{133,-52},{80,-52},{80,-9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-141.3,15},{-134,15},{-134,0.5},{-120.5,0.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-102.35,-20},{-102.35,-44.6},{-51.6,-44.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.InFlow, Mflow_BmRecirculation.port_a) annotation (Line(
      points={{41,62},{20,62},{20,60},{-18,60},{-18,4},{-2,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, MflowSfToBm.port_a) annotation (Line(
      points={{133,-52},{52,-52},{52,-50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
      points={{32,-50},{-4,-50},{-4,-51.5},{-38.8,-51.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
      points={{18,4},{18,-44},{14,-44},{14,-51.5},{-38.8,-51.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
      points={{59,62},{80,62},{80,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{59,62},{127.6,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMSysOut.port, sinkP.flangeB) annotation (Line(
      points={{97,78},{98,78},{98,62},{127.6,62}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, Mflow_BmRecirculation.port_a)
    annotation (Line(
      points={{-101.8,20.59},{-101.8,50},{-18,50},{-18,4},{-2,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_BMout.port, Mflow_BmRecirculation.port_a) annotation (Line(
      points={{-94,74},{-94,50},{-18,50},{-18,4},{-2,4}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -140},{160,120}}), graphics), Icon(coordinateSystem(extent={{-160,-140},
            {160,120}})));
end Test_BiomassSystem_II;
