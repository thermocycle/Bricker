within BrickerISES.Tests.FA;
model TestSimpleBiomassBoilerSystem_MixedTank4Flange

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
    Tstart=353.15)
    annotation (Placement(transformation(extent={{-66,-74},{-12,-18}})));
  Modelica.Blocks.Sources.Constant const3(k=25 + 273.15)
    annotation (Placement(transformation(extent={{22,40},{32,50}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=10e-3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{68,-76},{48,-56}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=1)
    annotation (Placement(transformation(extent={{62,-48},{72,-38}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SENS_IN(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={8,-60})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SENS_IN1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={4,-38})));
  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(Tstart=
        323.15) annotation (Placement(transformation(extent={{42,34},{62,54}})));
equation
  connect(simpleBiomassSystem.PumpNominalFlowFraction, const.y) annotation (
      Line(
      points={{-33.06,-19.4},{-33.06,8.3},{-15,8.3},{-15,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Tamb, const1.y) annotation (Line(
      points={{-44.4,-19.4},{-44.4,7.3},{-51,7.3},{-51,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Q, const2.y) annotation (Line(
      points={{-54.12,-19.4},{-78.06,-19.4},{-78.06,42},{-77,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpFlowFraction.y, pump.flow_in) annotation (Line(
      points={{72.5,-43},{72.5,-51.5},{61.2,-51.5},{61.2,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.OutFlow, SENS_IN.InFlow) annotation (Line(
      points={{52.4,-58.6},{52.4,-64.8},{15,-64.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN.OutFlow, simpleBiomassSystem.inlet) annotation (Line(
      points={{1,-64.8},{-4.5,-64.8},{-4.5,-65.6},{-12,-65.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN1.InFlow, simpleBiomassSystem.outlet) annotation (Line(
      points={{-3,-42.8},{-3,-35.4},{-10.92,-35.4},{-10.92,-27.52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.Tamb, const3.y) annotation (Line(
      points={{40.6,44.6},{34.3,44.6},{34.3,45},{32.5,45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SENS_IN1.OutFlow, mixedTank4FlangeComplete.InFlow2) annotation (Line(
      points={{11,-42.8},{11,-20.4},{52,-20.4},{52,34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.OutFlow2, pump.InFlow) annotation (Line(
      points={{52,54.2},{52,60},{80,60},{80,-65.5},{65.2,-65.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoilerSystem_MixedTank4Flange;
