within BrickerISES.Tests.AD.System.Layout_3;
model Pump_SF

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=438.15)
    annotation (Placement(transformation(extent={{78,-72},{58,-52}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       150000)
    annotation (Placement(transformation(extent={{62,56},{82,76}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-92,-6},{-82,4}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-88,-52},{-78,-42}})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{36,-66},{16,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{0,-58},{-12,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{14,46},{26,58}})));
  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{-23,-23},{23,23}},
        rotation=90,
        origin={-23,7})));
equation
  connect(pump.InFlow, sourceP.flange) annotation (Line(
      points={{33.2,-55.5},{48,-55.5},{48,-62},{58.6,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{24.2,49.12},{56,49.12},{56,66},{63.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
      points={{-1.8,-54.88},{6,-54.88},{6,-48.6},{20.4,-48.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_series.InFlow, sensTp.OutFlow) annotation (Line(
      points={{-23.46,-15.54},{-23.46,-54.88},{-10.2,-54.88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_series.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-23.46,29.54},{-23.46,49.12},{15.8,49.12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-79.5,37},{-68,37},{-68,24.02},{-44.16,24.02}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-79.5,15},{-44.39,15},{-44.39,13.21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-81.5,-1},{-70,-1},{-70,1.71},{-44.39,1.71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-79.5,-25},{-68,-25},{-68,-8.64},{-44.16,-8.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-77.5,-47},{-64,-47},{-64,-30},{-8.28,-30},{-8.28,-12.78}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Pump_SF;
