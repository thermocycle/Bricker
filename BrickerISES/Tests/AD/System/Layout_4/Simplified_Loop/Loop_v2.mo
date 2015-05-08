within BrickerISES.Tests.AD.System.Layout_4.Simplified_Loop;
model Loop_v2

  ParametrizedComponents.SolarField_series solarField_series annotation (
      Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-68,8})));
  ParametrizedComponents.Pump_solar
                              pump
    annotation (Placement(transformation(extent={{-22,-56},{-42,-36}})));
  ParametrizedComponents.OpenTank openTank(Tstart=461.15)
    annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
  ParametrizedComponents.SimpleBiomassBoiler_Parallel
    simpleBiomassBoiler_Parallel
    annotation (Placement(transformation(extent={{10,46},{-10,66}})));
  ParametrizedComponents.Evaporator evaporator annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={21,11})));
  Modelica.Blocks.Sources.Constant const(k=335000)
    annotation (Placement(transformation(extent={{-18,82},{-10,90}})));
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
    annotation (Placement(transformation(extent={{78,-28},{64,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=3500000)
    annotation (Placement(transformation(extent={{56,66},{68,74}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-102,-52},{-92,-42}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(k=0.0033)
    annotation (Placement(transformation(extent={{-74,56},{-64,66}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(h=0.2)
    annotation (Placement(transformation(extent={{12,-48},{2,-38}})));
equation
  connect(pump.OutFlow, solarField_series.InFlow) annotation (Line(
      points={{-37.6,-38.6},{-37.6,-28},{-68.28,-28},{-68.28,-5.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(v_wind.y, solarField_series.v_wind) annotation (Line(
      points={{-91.6,36},{-86,36},{-86,18.36},{-80.88,18.36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_series.Theta) annotation (Line(
      points={{-95.6,16},{-92,16},{-92,11.78},{-81.02,11.78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_series.Tamb) annotation (Line(
      points={{-97.6,-4},{-94,-4},{-94,4.78},{-81.02,4.78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_series.DNI) annotation (Line(
      points={{-97.6,-26},{-90,-26},{-90,-1.52},{-80.88,-1.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler_Parallel.outlet, evaporator.inlet_fl2)
    annotation (Line(
      points={{10,59.2},{15,59.2},{15,20.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, evaporator.outlet_fl1) annotation (Line(
      points={{56.96,70},{26,70},{26,21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_series.Defocusing) annotation (Line(
      points={{-91.5,-47},{-59.04,-47},{-59.04,-4.04}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, simpleBiomassBoiler_Parallel.inlet) annotation (
     Line(
      points={{-32.2,61.6},{-32.2,59.8},{-10.2,59.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, simpleBiomassBoiler_Parallel.Q) annotation (Line(
      points={{-9.6,86},{5.2,86},{5.2,63.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(evaporator.inlet_fl1, sourceMdot.flangeB) annotation (Line(
      points={{26,1},{26,-21},{64.7,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, openTank.InFlow) annotation (Line(
      points={{-64.5,61},{-58.25,61},{-58.25,61.6},{-51.8,61.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_series.OutFlow, dP.InFlow) annotation (Line(
      points={{-68.28,21.72},{-68.28,38},{-82,38},{-82,61},{-73.5,61}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(evaporator.outlet_fl2, dP1.InFlow) annotation (Line(
      points={{15.2,1.2},{15.2,-43},{11.5,-43}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, pump.InFlow) annotation (Line(
      points={{2.5,-43},{-10.75,-43},{-10.75,-45.5},{-24.8,-45.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Loop_v2;
