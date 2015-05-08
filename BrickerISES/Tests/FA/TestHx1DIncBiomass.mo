within BrickerISES.Tests.FA;
model TestHx1DIncBiomass
  Components.Biomass.Flow1DIncHeatInput hx1DIncBiomass(
    V_sf=0.01,
    Tstart_inlet_sf=373.15,
    Tstart_outlet_sf=373.15)
    annotation (Placement(transformation(extent={{38,-16},{-28,46}})));
  Modelica.Blocks.Sources.Constant Q(k=100000)
    annotation (Placement(transformation(extent={{-104,36},{-84,56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=3,
    T_0=373.15)
    annotation (Placement(transformation(extent={{-68,8},{-48,28}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{56,8},{76,28}})));
  Components.Biomass.Flow1DIncHeatInput hx1DIncBiomass1(
    V_sf=0.01,
    Tstart_inlet_sf=373.15,
    Tstart_outlet_sf=373.15)
    annotation (Placement(transformation(extent={{42,-94},{-24,-32}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=0.003)
    annotation (Placement(transformation(extent={{-70,-82},{-44,-56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(redeclare package
      Medium = ThermoCycle.Media.Therminol66, T_0=373.15)
    annotation (Placement(transformation(extent={{-98,-76},{-78,-56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP1(redeclare
      package Medium = ThermoCycle.Media.Therminol66, p0=863885)
    annotation (Placement(transformation(extent={{78,-66},{58,-46}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-84,-50},{-64,-30}})));
equation
  connect(Q.y, hx1DIncBiomass.u) annotation (Line(
      points={{-83,46},{-4,46},{-4,39.8},{5,39.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hx1DIncBiomass.inlet_fl2, sourceMdot.flangeB) annotation (Line(
      points={{-28,19.34},{-38,19.34},{-38,18},{-49,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DIncBiomass.outlet_fl2, sinkP1.flangeB) annotation (Line(
      points={{37.34,18.72},{47.67,18.72},{47.67,18},{57.6,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-78.6,-66},{-72,-66},{-72,-68.35},{-66.36,-68.35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, pump.flow_in) annotation (Line(
      points={{-63,-40},{-61.16,-40},{-61.16,-58.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.OutFlow, hx1DIncBiomass1.inlet_fl2) annotation (Line(
      points={{-49.72,-59.38},{-42.86,-59.38},{-42.86,-58.66},{-24,-58.66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP1.flange, hx1DIncBiomass1.outlet_fl2) annotation (Line(
      points={{58.6,-56},{46,-56},{46,-59.28},{41.34,-59.28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Q.y, hx1DIncBiomass1.u) annotation (Line(
      points={{-83,46},{-83,-20},{9,-20},{9,-38.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestHx1DIncBiomass;
