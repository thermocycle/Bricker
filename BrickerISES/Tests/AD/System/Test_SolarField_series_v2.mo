within BrickerISES.Tests.AD.System;
model Test_SolarField_series_v2

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Mdotnom=1.65,
    Ns=6,
    Nt=2,
    Unom=500,
    N=2,
    Tstart_inlet=429.15,
    Tstart_outlet=538.15,
    pstart=150000,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry)
                   annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-3,1})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=429.15)
    annotation (Placement(transformation(extent={{82,-74},{62,-54}})));
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
    annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-88,-52},{-78,-42}})));
  ParametrizedComponents.Pump_solar
                              pump(V_dot_max=0.0034)
    annotation (Placement(transformation(extent={{36,-66},{16,-46}})));
equation
  connect(solarField_Soltigua_Inc.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-3.42,21.58},{-3.42,50},{63.6,50},{63.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-79.5,-25},{-56,-25},{-56,-13.28},{-22.32,-13.28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-79.5,-5},{-22.53,-5},{-22.53,-3.83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-79.5,15},{-36,15},{-36,6.67},{-22.53,6.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-79.5,37},{-48,37},{-48,16.54},{-22.32,16.54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-77.5,-47},{10.44,-47},{10.44,-17.06}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.InFlow, pump.OutFlow) annotation (Line(
      points={{-3.42,-19.58},{-3.42,-48.6},{20.4,-48.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, sourceP.flange) annotation (Line(
      points={{33.2,-55.5},{48,-55.5},{48,-64},{62.6,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_SolarField_series_v2;
