within BrickerISES.Tests.FA;
model TestSimpleBiomassBoilerSystem_MixedTank

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-36,60},{-16,80}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-72,58},{-52,78}})));
  Modelica.Blocks.Sources.Constant const2(k=1e6)
    annotation (Placement(transformation(extent={{-98,32},{-78,52}})));
  Components.Biomass.SimpleBiomassSystem simpleBiomassSystem(
    OversizePump=1,
    V_ExpTank=1,
    V=3,
    A_f=100,
    A_b=100,
    M_wall=100,
    pstart_f=200000,
    Tstart=373.15)
    annotation (Placement(transformation(extent={{-42,-42},{12,14}})));
  Modelica.Blocks.Sources.Constant const3(k=25 + 273.15)
    annotation (Placement(transformation(extent={{118,24},{138,44}})));
  Components.Tank.BufferTankComplete bufferTankComplete(Vtot=1, Tstart=373.15)
    annotation (Placement(transformation(extent={{88,0},{26,62}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=10e-3)
    annotation (Placement(transformation(extent={{68,-80},{48,-60}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=1)
    annotation (Placement(transformation(extent={{62,-48},{72,-38}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SENS_IN(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={32,-28})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SENS_IN1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={28,-6})));
equation
  connect(simpleBiomassSystem.PumpNominalFlowFraction, const.y) annotation (
      Line(
      points={{-9.06,12.6},{-9.06,40.3},{-15,40.3},{-15,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Tamb, const1.y) annotation (Line(
      points={{-20.4,12.6},{-20.4,39.3},{-51,39.3},{-51,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Q, const2.y) annotation (Line(
      points={{-30.12,12.6},{-54.06,12.6},{-54.06,42},{-77,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpFlowFraction.y, pump.flow_in) annotation (Line(
      points={{72.5,-43},{72.5,-51.5},{61.2,-51.5},{61.2,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.InFlow, bufferTankComplete.OutFlow) annotation (Line(
      points={{65.2,-69.5},{92,-69.5},{92,72},{57,72},{57,62.62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, SENS_IN.InFlow) annotation (Line(
      points={{52.4,-62.6},{52.4,-32.8},{39,-32.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN.OutFlow, simpleBiomassSystem.inlet) annotation (Line(
      points={{25,-32.8},{19.5,-32.8},{19.5,-33.6},{12,-33.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN1.InFlow, simpleBiomassSystem.outlet) annotation (Line(
      points={{21,-10.8},{21,-3.4},{13.08,-3.4},{13.08,4.48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN1.OutFlow, bufferTankComplete.InFlow) annotation (Line(
      points={{35,-10.8},{44.5,-10.8},{44.5,0},{57,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, bufferTankComplete.Tamb) annotation (Line(
      points={{139,34},{116,34},{116,32.86},{92.34,32.86}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoilerSystem_MixedTank;
