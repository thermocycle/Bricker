within BrickerISES.Tests.AD.System.Layout_4.Simplified_Loop;
model Loop_v1

  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-68,8})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{-22,-56},{-42,-36}})));
  ParametrizedComponents.OpenTank openTank
    annotation (Placement(transformation(extent={{-52,46},{-32,66}})));
  ParametrizedComponents.SimpleBiomassBoiler_Parallel
    simpleBiomassBoiler_Parallel
    annotation (Placement(transformation(extent={{26,34},{6,54}})));
  ParametrizedComponents.Evaporator evaporator annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={57,9})));
  Modelica.Blocks.Sources.Constant const(k=335000)
    annotation (Placement(transformation(extent={{-4,60},{4,68}})));
  Modelica.Blocks.Sources.Constant v_wind(k=0)
    annotation (Placement(transformation(extent={{-100,32},{-92,40}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-104,12},{-96,20}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-106,-8},{-98,0}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-106,-30},{-98,-22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=1.9,
    p=3500000,
    T_0=408.15)
    annotation (Placement(transformation(extent={{74,-42},{94,-22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=3500000)
    annotation (Placement(transformation(extent={{86,46},{98,54}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-102,-52},{-92,-42}})));
equation
  connect(solarField_series.OutFlow, openTank.InFlow) annotation (Line(
      points={{-81.4626,15.4949},{-81.4626,47.6},{-51.8,47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, solarField_series.InFlow) annotation (Line(
      points={{-37.6,-38.6},{-37.6,-28},{-53.4626,-28},{-53.4626,13.6283}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(v_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-91.6,36},{-86,36},{-86,-1.30505},{-79.4263,-1.30505}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-95.6,16},{-92,16},{-92,-1.61616},{-74.0808,-1.61616}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-97.6,-4},{-94,-4},{-94,-1.61616},{-68.4808,-1.61616}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-97.6,-26},{-90,-26},{-90,-1.77172},{-63.2626,-1.77172}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassBoiler_Parallel.Q) annotation (Line(
      points={{4.4,64},{21.2,64},{21.2,51.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler_Parallel.outlet, evaporator.inlet_fl2)
    annotation (Line(
      points={{26,47.2},{51,47.2},{51,18.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(evaporator.outlet_fl2, pump.InFlow) annotation (Line(
      points={{51.2,-0.8},{51.2,-45.5},{-24.8,-45.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, evaporator.outlet_fl1) annotation (Line(
      points={{86.96,50},{76,50},{76,38},{62,38},{62,19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-91.5,-47},{-57.7899,-47},{-57.7899,-1.61616}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(evaporator.inlet_fl1, sourceMdot.flangeB) annotation (Line(
      points={{62,-1},{62,-8},{98,-8},{98,-32},{93,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, simpleBiomassBoiler_Parallel.inlet) annotation (
     Line(
      points={{-32.2,47.6},{-22.1,47.6},{-22.1,47.8},{5.8,47.8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Loop_v1;
