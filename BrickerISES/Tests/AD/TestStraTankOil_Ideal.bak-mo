within BrickerISES.Tests.AD;
model TestStraTankOil_Ideal

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.7766,
    UseT=false,
    h_0=3.03e6,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p=400000)
    annotation (Placement(transformation(extent={{-92,14},{-72,34}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot( redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Mdot_0=2.7766,
    h_0=3.03e6,
    pstart=400000)
    annotation (Placement(transformation(extent={{-64,-78},{-84,-58}})));
  Modelica.Blocks.Sources.Constant const(k=30 + 273.15)
    annotation (Placement(transformation(extent={{-94,-24},{-74,-4}})));
  Components.Tank.StraTankIdeal straTankIdeal(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{-44,-56},{8,28}})));
equation
  connect(sourceMdot.flangeB, straTankIdeal.portHotSF) annotation (Line(
      points={{-73,24},{-64,24},{-64,23.38},{-40.36,23.38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, straTankIdeal.portColdSF) annotation (Line(
      points={{-64.2,-68},{-56,-68},{-56,-52.22},{-39.84,-52.22}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=3600, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestStraTankOil_Ideal;
