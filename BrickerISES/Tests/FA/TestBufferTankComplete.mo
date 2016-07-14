within BrickerISES.Tests.FA;
model TestBufferTankComplete

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=0.5,
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    T_0=573.15)
    annotation (Placement(transformation(extent={{-72,-94},{-52,-74}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));

  Components.Tank.BufferTankComplete bufferTankComplete(Vtot=1)
    annotation (Placement(transformation(extent={{-48,-12},{14,50}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP1(redeclare
      package Medium = ThermoCycle.Media.Therminol66, p0=863885)
    annotation (Placement(transformation(extent={{60,66},{40,86}})));
equation
  connect(sourceMdot.flangeB, bufferTankComplete.InFlow) annotation (Line(
      points={{-53,-84},{-36,-84},{-36,-12},{-17,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, bufferTankComplete.Tamb) annotation (Line(
      points={{-79,20},{-66,20},{-66,20.86},{-52.34,20.86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceP1.flange, bufferTankComplete.OutFlow) annotation (Line(
      points={{40.6,76},{12,76},{12,50.62},{-17,50.62}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end TestBufferTankComplete;
