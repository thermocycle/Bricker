within Bricker.Tests.FA;
model TestMassFlowMultiplier
  Components.MassFlowMultiplier massFlowMultiplier(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Np=3,
    pstart=100000)
    annotation (Placement(transformation(extent={{-18,-8},{2,12}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(Mdot_0=0.5, redeclare
      package Medium =
        ThermoCycle.Media.Therminol66,
    T_0=573.15)
    annotation (Placement(transformation(extent={{26,24},{46,44}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Therminol66)
    annotation (Placement(transformation(extent={{-72,4},{-52,24}})));
equation
  connect(sourceMdot.flangeB, massFlowMultiplier.OutFlow) annotation (Line(
      points={{45,34},{24,34},{24,2.1},{2,2.1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, massFlowMultiplier.InFlow) annotation (Line(
      points={{-70.4,14},{-46,14},{-46,2},{-18,2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestMassFlowMultiplier;
