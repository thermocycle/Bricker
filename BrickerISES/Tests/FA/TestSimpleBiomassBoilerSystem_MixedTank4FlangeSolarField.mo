within BrickerISES.Tests.FA;
model TestSimpleBiomassBoilerSystem_MixedTank4FlangeSolarField

  Modelica.Blocks.Sources.Constant Q_Control(k=1)
    annotation (Placement(transformation(extent={{-12,-32},{-32,-12}})));
  Modelica.Blocks.Sources.Constant Tamb(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-74,-30},{-54,-10}})));
  Modelica.Blocks.Sources.Constant Q(k=1e6)
    annotation (Placement(transformation(extent={{-110,-56},{-90,-36}})));
  Components.Biomass.SimpleBiomassSystem simpleBiomassSystem(
    OversizePump=1,
    V_ExpTank=1,
    V=3,
    A_f=100,
    A_b=100,
    M_wall=100,
    pstart_f=200000,
    Tstart=373.15)
    annotation (Placement(transformation(extent={{-54,-62},{-28,-36}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=10e-3)
    annotation (Placement(transformation(extent={{68,-76},{48,-56}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=0.2)
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
        origin={6,-30})));
  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(Tstart=
        323.15) annotation (Placement(transformation(extent={{28,6},{56,38}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=8e-3)
    annotation (Placement(transformation(extent={{8,-2},{-12,18}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction1(k=1)
    annotation (Placement(transformation(extent={{18,14},{8,24}})));
  Components.SolarField solarField(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Np=2,
    Mdotnom=1.5,
    Ns=3,
    Unom=2000,
    Tstart_inlet=573.15,
    Tstart_outlet=573.15,
    pstart=100000,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Constant)
    annotation (Placement(transformation(extent={{-52,28},{-12,68}})));

  Modelica.Blocks.Sources.BooleanStep Defocusing(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-96,26},{-76,46}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-34,82},{-44,90}})));
  Modelica.Blocks.Sources.Constant const5(k=0)
    annotation (Placement(transformation(extent={{-58,80},{-48,90}})));
  Modelica.Blocks.Sources.Step DNI(
    height=-1000,
    offset=1000,
    startTime=1000)
    annotation (Placement(transformation(extent={{60,80},{50,88}})));
  Modelica.Blocks.Sources.Constant const3(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-12,86},{-2,96}})));
  Modelica.Blocks.Sources.Constant const1(k=0) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-1,71})));
equation
  connect(simpleBiomassSystem.Tamb, Tamb.y) annotation (Line(
      points={{-43.6,-36.65},{-43.6,-24.7},{-53,-24.7},{-53,-20}},
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
      points={{1,-64.8},{-4.5,-64.8},{-4.5,-58.1},{-28,-58.1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN1.InFlow, simpleBiomassSystem.outlet) annotation (Line(
      points={{-1,-34.8},{-1,-41.4},{-27.48,-41.4},{-27.48,-40.42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SENS_IN1.OutFlow, mixedTank4FlangeComplete.InFlow2) annotation (Line(
      points={{13,-34.8},{13,-20.4},{42,-20.4},{42,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.OutFlow2, pump.InFlow) annotation (Line(
      points={{42,38.32},{42,60},{80,60},{80,-65.5},{65.2,-65.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Q_Control.y, simpleBiomassSystem.PumpNominalFlowFraction) annotation (
     Line(
      points={{-33,-22},{-36,-22},{-36,-36.65},{-38.14,-36.65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Defocusing.y, solarField.Defocusing) annotation (Line(
      points={{-75,36},{-66,36},{-66,35},{-50,35}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump2.OutFlow, solarField.InFlow) annotation (Line(
      points={{-7.6,15.4},{-70,15.4},{-70,50.4},{-51.2,50.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.InFlow1, pump2.InFlow) annotation (Line(
      points={{28.56,12.08},{28.56,8.5},{5.2,8.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField.OutFlow, mixedTank4FlangeComplete.OutFlow1) annotation (
      Line(
      points={{-13.2,50.4},{20,50.4},{20,33.52},{28.56,33.52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Theta.y, solarField.Theta) annotation (Line(
      points={{-44.5,86},{-44,86},{-44,66.3},{-38.3,66.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, solarField.v_wind) annotation (Line(
      points={{-47.5,85},{-47.5,77.5},{-46.2,77.5},{-46.2,66.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField.Tamb, const3.y) annotation (Line(
      points={{-31.5,66.3},{-31.5,82},{4,82},{4,91},{-1.5,91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.Tamb, const3.y) annotation (Line(
      points={{26.04,22.96},{26.04,90},{4,90},{4,91},{-1.5,91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpFlowFraction1.y, pump2.flow_in) annotation (Line(
      points={{7.5,19},{4.75,19},{4.75,16},{1.2,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Q, Q.y) annotation (Line(
      points={{-48.28,-36.65},{-62,-36.65},{-62,-46},{-89,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarField.DNI) annotation (Line(
      points={{-6.5,71},{-15.25,71},{-15.25,66.4},{-24.4,66.4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoilerSystem_MixedTank4FlangeSolarField;
