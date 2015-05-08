within BrickerISES.Tests.AD;
model Test_ORC_unit
  Components.ORC_Unit oRC_Unit(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    T_oil_ex=423.15,
    p_start=100000)
    annotation (Placement(transformation(extent={{-12,-4},{58,46}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.9472,
    p=100000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000)
    annotation (Placement(transformation(extent={{-82,-16},{-62,4}})));
equation
  connect(sourceMdot.flangeB, oRC_Unit.InFlow) annotation (Line(
      points={{-71,40},{-52,40},{-52,43.1503},{-10.7273,43.1503}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, oRC_Unit.OutFlow) annotation (Line(
      points={{-80.4,-6},{-90,-6},{-90,-40},{-48,-40},{-48,-30},{-11.3636,-30},
          {-11.3636,1.18135}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Test_ORC_unit;
