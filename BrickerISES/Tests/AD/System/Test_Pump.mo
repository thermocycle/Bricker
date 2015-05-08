within BrickerISES.Tests.AD.System;
model Test_Pump

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=438.15)
    annotation (Placement(transformation(extent={{-74,-16},{-54,4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       150000)
    annotation (Placement(transformation(extent={{50,-18},{70,2}})));
  ParametrizedComponents.Pump_solar pump_solar(PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF)
    annotation (Placement(transformation(extent={{-20,-12},{0,8}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
equation
  connect(sourceP.flange, pump_solar.InFlow) annotation (Line(
      points={{-54.6,-6},{-36,-6},{-36,0},{-17.2,0},{-17.2,-1.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_solar.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-4.4,5.4},{14,5.4},{14,-8},{51.6,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, pump_solar.flow_in) annotation (Line(
      points={{-19,50},{-16,50},{-16,6},{-13.2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end Test_Pump;
