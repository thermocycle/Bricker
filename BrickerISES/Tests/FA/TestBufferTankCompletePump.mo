within BrickerISES.Tests.FA;
model TestBufferTankCompletePump

  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));

  Components.Tank.BufferTankComplete bufferTankComplete(Vtot=1)
    annotation (Placement(transformation(extent={{-48,-12},{14,50}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=3e-3)
    annotation (Placement(transformation(extent={{-58,-68},{-38,-48}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP Source(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    p0=115794,
    T_0=573.15)
    annotation (Placement(transformation(extent={{-88,-68},{-68,-48}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=1)
    annotation (Placement(transformation(extent={{-72,-34},{-62,-24}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP Sink(redeclare package
      Medium = ThermoCycle.Media.Therminol66, p0=863885)
    annotation (Placement(transformation(extent={{48,58},{28,78}})));
equation
  connect(const.y, bufferTankComplete.Tamb) annotation (Line(
      points={{-79,20},{-66,20},{-66,20.86},{-52.34,20.86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.OutFlow, bufferTankComplete.InFlow) annotation (Line(
      points={{-42.4,-50.6},{-42.4,-31.3},{-17,-31.3},{-17,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Source.flange, pump.InFlow) annotation (Line(
      points={{-68.6,-58},{-62,-58},{-62,-57.5},{-55.2,-57.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bufferTankComplete.OutFlow, Sink.flange) annotation (Line(
      points={{-17,50.62},{5.5,50.62},{5.5,68},{28.6,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pumpFlowFraction.y, pump.flow_in) annotation (Line(
      points={{-61.5,-29},{-61.5,-39.5},{-51.2,-39.5},{-51.2,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end TestBufferTankCompletePump;
