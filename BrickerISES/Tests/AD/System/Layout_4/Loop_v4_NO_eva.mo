within BrickerISES.Tests.AD.System.Layout_4;
model Loop_v4_NO_eva

  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-72,0})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{42,-52},{22,-32}})));
  ParametrizedComponents.Evaporator evaporator annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={57,9})));
  Modelica.Blocks.Sources.Constant const(k=1)
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
  ParametrizedComponents.Pump_solar
                              pump1
    annotation (Placement(transformation(extent={{-44,-48},{-64,-28}})));
  Components.Biomass.SimpleBiomassSystemCombustionDynamic
    simpleBiomassSystemCombustionDynamic(redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Qcombustion_Nominal=335000)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={12,70})));
  Modelica.Blocks.Sources.Constant const2(k=1.6)
    annotation (Placement(transformation(extent={{34,86},{42,94}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-10,-44},{-22,-32}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank1(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-32,58},{-20,46}})));
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
  connect(simpleBiomassSystemCombustionDynamic.outlet, evaporator.inlet_fl2)
    annotation (Line(
      points={{18.6,59.6},{38,59.6},{38,46},{51,46},{51,18.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(evaporator.outlet_fl2, pump.InFlow) annotation (Line(
      points={{51.2,-0.8},{51.2,-41.5},{39.2,-41.5}},
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
  connect(solarField_series.InFlow, pump1.OutFlow) annotation (Line(
      points={{-72.28,-13.72},{-72.28,-30.6},{-59.6,-30.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-91.5,-47},{-80,-47},{-80,-20},{-63.04,-20},{-63.04,-12.04}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(solarField_series.OutFlow, TJ_ExpTank1.port_1) annotation (Line(
      points={{-72.28,13.72},{-72.28,52},{-32,52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank1.port_2, simpleBiomassSystemCombustionDynamic.inlet)
    annotation (Line(
      points={{-20,52},{5,52},{5,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, TJ_ExpTank.port_1) annotation (Line(
      points={{26.4,-34.6},{2,-34.6},{2,-38},{-10,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_2, pump1.InFlow) annotation (Line(
      points={{-22,-38},{-34,-38},{-34,-37.5},{-46.8,-37.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_3, TJ_ExpTank1.port_3) annotation (Line(
      points={{-16,-32},{-16,0},{-26,0},{-26,46}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Loop_v4_NO_eva;
