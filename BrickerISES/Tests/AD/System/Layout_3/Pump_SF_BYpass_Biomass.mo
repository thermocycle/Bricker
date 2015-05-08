within BrickerISES.Tests.AD.System.Layout_3;
model Pump_SF_BYpass_Biomass

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=150000,
    h=610851)
    annotation (Placement(transformation(extent={{116,60},{136,80}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-142,36},{-132,46}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-146,14},{-136,24}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-148,-4},{-138,6}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-148,-20},{-138,-10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-140,-46},{-130,-36}})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{-38,-76},{-58,-56}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_SU(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-68,-66},{-92,-42}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_EX(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-90,68},{-72,86}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_SF_EX(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-62,80},{-48,66}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_SF_SU(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-2,-72},{-22,-52}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.14,
    p=150000,
    T_0=438.15)
    annotation (Placement(transformation(extent={{112,-72},{92,-52}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_OUT(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{78,66},{90,78}})));
  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{-25,-25},{25,25}},
        rotation=90,
        origin={-93,19})));
  ParametrizedComponents.BioMassSystem bioMassSystem(
    redeclare model MediumHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence,
    V_dot_max=0.015,
    Unom_f=2000) annotation (Placement(transformation(
        extent={{25,30},{-25,-30}},
        rotation=90,
        origin={16,111})));

  Modelica.Blocks.Sources.Constant Q_biomass(k=1)
    annotation (Placement(transformation(extent={{94,120},{80,134}})));
  Modelica.Blocks.Sources.Constant M_dot_pump(k=1)
    annotation (Placement(transformation(extent={{94,86},{80,100}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-22,56},{-2,76}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{52,66},{72,86}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_BIO_SU(
                                                               redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-42,56},{-24,74}})));
equation
  connect(pump.OutFlow, sensTp_SF_SU.InFlow) annotation (Line(
      points={{-53.6,-58.6},{-70.8,-58.6},{-70.8,-59.76},{-71.6,-59.76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_SF_SU.port_3, TJ_SF_EX.port_3)                  annotation (
      Line(
      points={{-12,-52},{-54,-52},{-54,66},{-55,66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_SF_SU.port_1, sourceMdot.flangeB)          annotation (Line(
      points={{-2,-62},{93,-62}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensTp_SF_SU.OutFlow, solarField_series.InFlow) annotation (Line(
      points={{-88.4,-59.76},{-100,-59.76},{-100,-26},{-93.5,-26},{-93.5,
          -5.5}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(solarField_series.OutFlow, sensTp_SF_EX.InFlow) annotation (Line(
      points={{-93.5,43.5},{-93.5,72.68},{-87.3,72.68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-129.5,-41},{-112,-41},{-112,-24},{-77,-24},{-77,-2.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-137.5,-15},{-124,-15},{-124,2},{-116,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-137.5,1},{-130,1},{-130,13.25},{-116.25,13.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-135.5,19},{-128,19},{-128,25.75},{-116.25,25.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-131.5,41},{-128,41},{-128,37.5},{-116,37.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.InFlow, TJ_SF_SU.port_2) annotation (Line(
      points={{-40.8,-65.5},{-34,-65.5},{-34,-62},{-22,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Q_biomass.y, bioMassSystem.CombustionPowerCommand) annotation (
      Line(
      points={{79.3,127},{63.65,127},{63.65,125},{44.5,125}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bioMassSystem.PumpFlowfraction, M_dot_pump.y) annotation (Line(
      points={{44.5,105.5},{60,105.5},{60,93},{79.3,93}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp_SF_EX.OutFlow, TJ_SF_EX.port_1) annotation (Line(
      points={{-74.7,72.68},{-69.35,72.68},{-69.35,73},{-62,73}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensMdot.OutFlow, bioMassSystem.inlet) annotation (Line(
      points={{-8,62},{-5,62},{-5,86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensMdot1.OutFlow, sensTp_OUT.InFlow) annotation (Line(
      points={{66,72},{79.8,72},{79.8,69.12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_OUT.OutFlow, sinkP.flangeB) annotation (Line(
      points={{88.2,69.12},{117.6,69.12},{117.6,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bioMassSystem.outlet, sensMdot1.InFlow) annotation (Line(
      points={{35.8,85},{35.8,72},{58,72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_SF_EX.port_2, sensTp_BIO_SU.InFlow) annotation (Line(
      points={{-48,73},{-48,60.68},{-39.3,60.68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensTp_BIO_SU.OutFlow, sensMdot.InFlow) annotation (Line(
      points={{-26.7,60.68},{-16,60.68},{-16,62}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -120},{140,140}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-120,-120},{140,140}})));
end Pump_SF_BYpass_Biomass;
