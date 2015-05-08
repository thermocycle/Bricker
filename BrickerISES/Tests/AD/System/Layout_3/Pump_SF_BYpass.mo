within BrickerISES.Tests.AD.System.Layout_3;
model Pump_SF_BYpass

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=425342,
    p0=150000)
    annotation (Placement(transformation(extent={{94,58},{114,78}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-94,10},{-84,20}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-96,-8},{-86,2}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-96,-24},{-86,-14}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-88,-50},{-78,-40}})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{8,-72},{-12,-52}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_SU(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-16,-70},{-40,-46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_EX(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-26,64},{-8,82}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_SF_EX(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{32,74},{46,60}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_SF_SU(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{60,-70},{40,-50}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.14,
    p=150000,
    T_0=438.15)
    annotation (Placement(transformation(extent={{112,-72},{92,-52}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_OutFlow(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{64,64},{76,76}})));
  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{-25,-25},{25,25}},
        rotation=90,
        origin={-41,15})));
equation
  connect(pump.OutFlow, sensTp_SF_SU.InFlow) annotation (Line(
      points={{-7.6,-54.6},{-18.8,-54.6},{-18.8,-63.76},{-19.6,-63.76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_SF_EX.OutFlow, TJ_SF_EX.port_1)         annotation (Line(
      points={{-10.7,68.68},{2.1,68.68},{2.1,67},{32,67}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, TJ_SF_SU.port_2)          annotation (Line(
      points={{5.2,-61.5},{23.6,-61.5},{23.6,-60},{40,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_SF_SU.port_3, TJ_SF_EX.port_3)                  annotation (
      Line(
      points={{50,-50},{40,-50},{40,60},{39,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_SF_SU.port_1, sourceMdot.flangeB)          annotation (Line(
      points={{60,-60},{76,-60},{76,-62},{93,-62}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_SF_EX.port_2, sensTp_OutFlow.InFlow)         annotation (Line(
      points={{46,67},{56,67},{56,67.12},{65.8,67.12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensTp_OutFlow.OutFlow, sinkP.flangeB) annotation (Line(
      points={{74.2,67.12},{85.1,67.12},{85.1,68},{95.6,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_SF_SU.OutFlow, solarField_series.InFlow) annotation (Line(
      points={{-36.4,-63.76},{-48,-63.76},{-48,-30},{-41.5,-30},{-41.5,-9.5}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(solarField_series.OutFlow, sensTp_SF_EX.InFlow) annotation (Line(
      points={{-41.5,39.5},{-41.5,68.68},{-23.3,68.68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-77.5,-45},{-60,-45},{-60,-28},{-25,-28},{-25,-6.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-85.5,-19},{-72,-19},{-72,-2},{-64,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-85.5,-3},{-78,-3},{-78,9.25},{-64.25,9.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-83.5,15},{-76,15},{-76,21.75},{-64.25,21.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-79.5,37},{-76,37},{-76,33.5},{-64,33.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Pump_SF_BYpass;
