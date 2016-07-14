within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration.SingleComponents;
model _SF_L_ByPass

  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-68,26},{-60,34}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-68,40},{-60,48}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-68,56},{-60,64}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    p=100000,
    T_0=436.15)
    annotation (Placement(transformation(extent={{60,-34},{40,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000)
    annotation (Placement(transformation(extent={{50,66},{70,86}})));
  Modelica.Blocks.Sources.Constant Tamb1(k=800)
    annotation (Placement(transformation(extent={{-68,8},{-60,16}})));
BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF
    annotation (Placement(transformation(extent={{-18,8},{18,50}})));
equation
  connect(SF.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{3.6,7.61818},{3.6,-24},{41,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.OutFlow, sinkP.flangeB) annotation (Line(
      points={{6,49.6182},{8,49.6182},{8,82},{51.6,82},{51.6,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y, SF.v_wind) annotation (Line(
      points={{-59.6,60},{-48,60},{-48,50},{-15.6,50},{-15.6,46.5636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-59.6,44},{-50,44},{-50,42},{-34,42},{-34,38},{-16,38},{-16,
          38.5455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-59.6,30},{-50,30},{-50,32},{-16,32},{-16,30.1455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb1.y, SF.DNI) annotation (Line(
      points={{-59.6,12},{-44,12},{-44,22.3182},{-16.2,22.3182}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end _SF_L_ByPass;
