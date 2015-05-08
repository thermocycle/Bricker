within BrickerISES.Tests.AD.System.Layout_4.Simplified_Loop;
model Loop_v3

  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-72,0})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{36,-58},{16,-38}})));
  ParametrizedComponents.Evaporator evaporator annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={57,9})));
  Modelica.Blocks.Sources.Constant const(k=335000)
    annotation (Placement(transformation(extent={{8,90},{16,98}})));
  Modelica.Blocks.Sources.Constant v_wind(k=0)
    annotation (Placement(transformation(extent={{-106,20},{-98,28}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-106,6},{-98,14}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-106,-8},{-98,0}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-108,-26},{-100,-18}})));
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
  Components.Tank.MixedTank4FlangeComplete mixedTank4FlangeComplete(
      redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-34,-2},{-14,18}})));
  ParametrizedComponents.Pump_solar
                              pump1
    annotation (Placement(transformation(extent={{-44,-48},{-64,-28}})));
  ParametrizedComponents.OpenTank openTank1
    annotation (Placement(transformation(extent={{-64,28},{-52,38}})));
  Modelica.Blocks.Sources.Constant const1(k=335000)
    annotation (Placement(transformation(extent={{-54,4},{-46,12}})));
  Components.Biomass.SimpleBiomassSystemCombustionDynamic
    simpleBiomassSystemCombustionDynamic(redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={12,70})));
  Modelica.Blocks.Sources.Constant const2(k=335000)
    annotation (Placement(transformation(extent={{34,86},{42,94}})));
equation
  connect(v_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-97.6,24},{-86,24},{-86,10.36},{-84.88,10.36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-97.6,10},{-92,10},{-92,3.78},{-85.02,3.78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-97.6,-4},{-94,-4},{-94,-3.22},{-85.02,-3.22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-99.6,-22},{-90,-22},{-90,-9.52},{-84.88,-9.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP.flangeB, evaporator.outlet_fl1) annotation (Line(
      points={{86.96,50},{76,50},{76,38},{62,38},{62,19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(evaporator.inlet_fl1, sourceMdot.flangeB) annotation (Line(
      points={{62,-1},{62,-8},{98,-8},{98,-32},{93,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.InFlow1, pump1.InFlow) annotation (Line(
      points={{-33.6,1.8},{-38,1.8},{-38,-32},{-46.8,-32},{-46.8,-37.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_series.OutFlow, openTank1.InFlow) annotation (Line(
      points={{-72.28,13.72},{-72.28,28.8},{-63.88,28.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank1.OutFlow, mixedTank4FlangeComplete.OutFlow1) annotation (
     Line(
      points={{-52.12,28.8},{-46,28.8},{-46,15.2},{-33.6,15.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.InFlow2, pump.OutFlow) annotation (Line(
      points={{-24,-2},{-24,-40.6},{20.4,-40.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mixedTank4FlangeComplete.OutFlow2,
    simpleBiomassSystemCombustionDynamic.inlet) annotation (Line(
      points={{-24,18.2},{-24,60},{5,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassSystemCombustionDynamic.outlet, evaporator.inlet_fl2)
    annotation (Line(
      points={{18.6,59.6},{38,59.6},{38,46},{51,46},{51,18.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(evaporator.outlet_fl2, pump.InFlow) annotation (Line(
      points={{51.2,-0.8},{51.2,-47.5},{33.2,-47.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassSystemCombustionDynamic.CombustionPowerCommand)
    annotation (Line(
      points={{16.4,94},{22,94},{22,86},{21.5,86},{21.5,75.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystemCombustionDynamic.PumpNominalFlowFraction,
    const2.y) annotation (Line(
      points={{21.5,67.8},{52,67.8},{52,90},{42.4,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, mixedTank4FlangeComplete.Tamb) annotation (Line(
      points={{-45.6,8},{-38,8},{-38,8.6},{-35.4,8.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField_series.InFlow, pump1.OutFlow) annotation (Line(
      points={{-72.28,-13.72},{-72.28,-30.6},{-59.6,-30.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-91.5,-47},{-80,-47},{-80,-20},{-63.04,-20},{-63.04,-12.04}},
      color={255,0,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Loop_v3;
