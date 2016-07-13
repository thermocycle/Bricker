within BrickerISES.Tests.SA;
model Test_SF_simone_campo_Soltigua

  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-120,54},{-100,74}})));
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
    annotation (Placement(transformation(extent={{-44,-70},{-24,-50}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseT=true,
    Mdot_0=10,
    T_0=423.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,88})));
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
  BrickerISES.Components.SF.SolarField_SoltiguaWall_Inc solarField_SoltiguaWall_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=10,
    Mdotnom=1.5,
    steadystate_T_fl=true,
    steadystate_T_wall=true,
    Ns=4,
    Nt=3,
    pstart=100000,
    Tstart_inlet=423.15,
    Tstart_outlet=423.15,
    Tstart_inlet_wall=423.15,
    Tstart_outlet_wall=423.15)
    annotation (Placement(transformation(extent={{-48,-6},{-12,38}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={57,41})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1000,
    width=50,
    period=1000,
    nperiod=1,
    startTime=200)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    startTime=500,
    duration=150,
    height=-6,
    offset=11) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={118,76})));
  Modelica.Fluid.Sensors.Temperature temperature_MIX(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-12,72},{8,92}})));
equation

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
  connect(solarField_SoltiguaWall_Inc.InFlow, pump.OutFlow) annotation (Line(
      points={{-26.4,-6.4},{-26.4,-34.6},{6.4,-34.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_IN.port, pump.OutFlow) annotation (Line(
      points={{-34,-70},{-24,-70},{-24,-52},{-14,-52},{-14,-34.6},{6.4,-34.6}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(solarField_SoltiguaWall_Inc.OutFlow, DpSF.InFlow) annotation (Line(
      points={{-24,37.6},{-20,37.6},{-20,52},{10,52},{10,46.6},{20,46.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarField_SoltiguaWall_Inc.v_wind) annotation (Line(
      points={{-99,64},{-88,64},{-88,44},{-45.6,44},{-45.6,34.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarField_SoltiguaWall_Inc.Theta) annotation (Line(
      points={{-99,30},{-80,30},{-80,26},{-46,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarField_SoltiguaWall_Inc.Tamb) annotation (Line(
      points={{-99,2},{-84,2},{-84,12},{-46,12},{-46,17.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_SoltiguaWall_Inc.Defocusing)
    annotation (Line(
      points={{-97,-70},{-80,-70},{-80,-38},{-46,-38},{-46,0.4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(const2.y, ValveSF.cmd) annotation (Line(
      points={{57,46.5},{58,46.5},{58,56},{54,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, solarField_SoltiguaWall_Inc.DNI) annotation (Line(
      points={{-99,-30},{-86,-30},{-86,-8},{-46.2,-8},{-46.2,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ramp1.y, sourceMdot.in_Mdot) annotation (Line(
      points={{118,87},{92,87},{92,94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature_MIX.port, sensMdot1.InFlow) annotation (Line(
      points={{-2,72},{6,72},{6,70},{21.6,70},{21.6,71.6}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF_simone_campo_Soltigua;
