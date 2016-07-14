within BrickerISES.Tests.FA;
model TestSolarFieldPumpTankClosed
  Components.SolarField solarField(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Ns=10,
    Np=2,
    Unom=1500,
    Mdotnom=1.5,
    Tstart_inlet=373.15,
    Tstart_outlet=373.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-30,-18},{10,22}})));

  Modelica.Blocks.Sources.BooleanStep Defocusing(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-46,-26},{-36,-16}})));
  Modelica.Blocks.Sources.Step DNI(
    height=-1000,
    offset=1000,
    startTime=300) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={18,80})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-12,80})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-44,80})));
  Modelica.Blocks.Sources.Constant v_wind(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-74,80})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{-60,-6},{-40,14}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=1)
    annotation (Placement(transformation(extent={{-80,28},{-70,38}})));
  Components.Tank.BufferTankComplete bufferTankComplete
    annotation (Placement(transformation(extent={{-72,-64},{-44,-36}})));
  Components.Source_pInc source_pInc(redeclare package Medium =
        ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{-86,-26},{-72,-12}})));
equation
  connect(pumpFlowFraction.y, pump.flow_in) annotation (Line(
      points={{-69.5,33},{-69.5,23.5},{-53.2,23.5},{-53.2,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.OutFlow, solarField.InFlow) annotation (Line(
      points={{-44.4,11.4},{-37.2,11.4},{-37.2,4.4},{-29.2,4.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Defocusing.y, solarField.Defocusing) annotation (Line(
      points={{-35.5,-21},{-32.75,-21},{-32.75,-11},{-28,-11}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(bufferTankComplete.InFlow, solarField.OutFlow) annotation (Line(
      points={{-58,-64},{26,-64},{26,4.4},{8.8,4.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarField.DNI) annotation (Line(
      points={{18,69},{8,69},{8,20.4},{-2.4,20.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField.Tamb) annotation (Line(
      points={{-12,69},{-10,69},{-10,20.3},{-9.5,20.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField.Theta) annotation (Line(
      points={{-44,69},{-16,69},{-16,20.3},{-16.3,20.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(v_wind.y, solarField.v_wind) annotation (Line(
      points={{-74,69},{-52,69},{-52,54},{-30,54},{-30,20.2},{-24.2,20.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bufferTankComplete.OutFlow, source_pInc.flangeB) annotation (Line(
      points={{-58,-35.72},{-66,-35.72},{-66,-19},{-72.56,-19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(source_pInc.flangeB, pump.InFlow) annotation (Line(
      points={{-72.56,-19},{-66.28,-19},{-66.28,4.5},{-57.2,4.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tamb.y, bufferTankComplete.Tamb) annotation (Line(
      points={{-12,69},{-100,69},{-100,-49.16},{-73.96,-49.16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestSolarFieldPumpTankClosed;
