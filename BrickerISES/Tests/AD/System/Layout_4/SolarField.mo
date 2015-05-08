within BrickerISES.Tests.AD.System.Layout_4;
model SolarField

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
    Mdotnom=1.38,
    Tstart_inlet=423.15,
    Tstart_outlet=523.15,
    pstart=150000) annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-1,1})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{80,-74},{60,-54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=150000)
    annotation (Placement(transformation(extent={{62,56},{82,76}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
  Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
    annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-88,-52},{-78,-42}})));
  ParametrizedComponents.Pump_solar
                              pump(V_dot_max=0.0017)
    annotation (Placement(transformation(extent={{38,-66},{18,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{0,-58},{-12,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{14,46},{26,58}})));
equation
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-79.5,-25},{-56,-25},{-56,-13.28},{-20.32,-13.28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-79.5,-5},{-20.53,-5},{-20.53,-3.83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-79.5,15},{-36,15},{-36,6.67},{-20.53,6.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-79.5,37},{-48,37},{-48,16.54},{-20.32,16.54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-77.5,-47},{12.44,-47},{12.44,-17.06}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, sourceP.flange) annotation (Line(
      points={{35.2,-55.5},{48,-55.5},{48,-64},{60.6,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-1.42,21.58},{-1.42,49.12},{15.8,49.12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{24.2,49.12},{56,49.12},{56,66},{63.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
      points={{-1.8,-54.88},{6,-54.88},{6,-48.6},{22.4,-48.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
      points={{-10.2,-54.88},{-16,-54.88},{-16,-19.58},{-1.42,-19.58}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-120,-100},{100,100}})));
end SolarField;
