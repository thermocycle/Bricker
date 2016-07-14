within BrickerISES.Tests.FA;
model TestSimpleBiomassBoiler
  Modelica.Blocks.Sources.Constant Q(k=100000)
    annotation (Placement(transformation(extent={{-104,36},{-84,56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=1,
    T_0=353.15) annotation (Placement(transformation(extent={{80,8},{60,28}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{-46,6},{-66,26}})));
  Components.Biomass.Flow1DIncHeatInput hx1DIncBiomass1(
    V_sf=0.01,
    Tstart_inlet_sf=373.15,
    Tstart_outlet_sf=373.15)
    annotation (Placement(transformation(extent={{48,-76},{16,-42}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=0.003)
    annotation (Placement(transformation(extent={{-16,-88},{10,-62}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(redeclare package
      Medium = ThermoCycle.Media.Therminol66, T_0=373.15)
    annotation (Placement(transformation(extent={{-92,-84},{-72,-64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP1(redeclare
      package Medium = ThermoCycle.Media.Therminol66, p0=863885)
    annotation (Placement(transformation(extent={{78,-66},{58,-46}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-38,-68},{-18,-48}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    V=0.01,
    redeclare model MediumHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence,
    Tstart=323.15)
    annotation (Placement(transformation(extent={{-30,-14},{32,48}})));

equation
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-72.6,-74},{-72,-74},{-72,-74.35},{-12.36,-74.35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, pump.flow_in) annotation (Line(
      points={{-17,-58},{-7.16,-58},{-7.16,-64.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.OutFlow, hx1DIncBiomass1.inlet_fl2) annotation (Line(
      points={{4.28,-65.38},{11.14,-65.38},{11.14,-56.62},{16,-56.62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP1.flange, hx1DIncBiomass1.outlet_fl2) annotation (Line(
      points={{58.6,-56},{46,-56},{46,-56.96},{47.68,-56.96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Q.y, hx1DIncBiomass1.u) annotation (Line(
      points={{-83,46},{-83,-20},{32,-20},{32,-45.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-83,46},{-46,46},{-46,40.25},{-15.12,40.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, simpleBiomassBoiler.inlet) annotation (Line(
      points={{61,18},{42,18},{42,28.78},{32.62,28.78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, simpleBiomassBoiler.outlet) annotation (Line(
      points={{-47.6,16},{-34,16},{-34,26.92},{-30,26.92}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoiler;
