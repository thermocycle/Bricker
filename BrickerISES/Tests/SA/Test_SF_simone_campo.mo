within BrickerISES.Tests.SA;
model Test_SF_simone_campo

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=20,
    Ns=10,
    Tstart_inlet=423.15,
    Tstart_outlet=423.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-34,-28},{8,42}})));

  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-120,54},{-100,74}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    offset=0,
    height=1500)
    annotation (Placement(transformation(extent={{-120,-42},{-100,-22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=15e-3)
    annotation (Placement(transformation(extent={{22,-52},{2,-32}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={24,92})));
 BrickerISES.Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    CheckValve=true,
    Afull=4e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={54,64})));
  Modelica.Fluid.Sensors.Temperature temperature_IN(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,-58},{-26,-38}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=10) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,88})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=500,
    offset=0.004,
    duration=150,
    height=0.95) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={64,28})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={20,52})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-42,70},{-22,90}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={24,74})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={36,-46})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,0})));
equation
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-99,64},{-56,64},{-56,34},{-31.2,34},{-31.2,36.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-99,30},{-64,30},{-64,22.9091},{-31.6667,22.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-99,2},{-68,2},{-68,8.90909},{-31.6667,8.90909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-99,-32},{-56,-32},{-56,-4.13636},{-31.9,-4.13636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-97,-70},{-68,-70},{-68,-17.8182},{-31.6667,-17.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{6.4,-34.6},{7.2,-34.6},{7.2,-28.6364},{-8.8,-28.6364}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_IN.port, solarCollectorIncSchott.InFlow) annotation (
      Line(
      points={{-36,-58},{-28,-58},{-28,-54},{-4,-54},{-4,-28.6364},{-8.8,
          -28.6364}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ramp.y, ValveSF.cmd) annotation (Line(
      points={{64,39},{64,46},{54,46},{54,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-6,41.3636},{6,41.3636},{6,46.6},{20,46.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{63,64},{86,64},{86,79}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveSF.OutFlow, DpSF.OutFlow) annotation (Line(
      points={{45,64},{20,64},{20,57.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT.port, DpSF.InFlow) annotation (Line(
      points={{-32,70},{-20,70},{-20,56},{10,56},{10,46.6},{20,46.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensMdot1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{21.6,76.4},{24,76.4},{24,83.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensMdot1.InFlow, DpSF.OutFlow) annotation (Line(
      points={{21.6,71.6},{21.6,64},{20,64},{20,57.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, pump.InFlow) annotation (Line(
      points={{31.8,-43.12},{25.9,-43.12},{25.9,-41.5},{19.2,-41.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{40.2,-43.12},{86,-43.12},{86,79}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowRate.port_a, sourceMdot.flangeB) annotation (Line(
      points={{42,-10},{46,-10},{46,-42},{48,-42},{48,-44},{86,-43.12},{86,79}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(massFlowRate.port_b, DpSF.InFlow) annotation (Line(
      points={{42,10},{40,10},{40,24},{20,24},{20,46.6}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF_simone_campo;
