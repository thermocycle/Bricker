within BrickerISES.Tests.AD.TestComponents;
model Test_ORC
  replaceable package MediumSf =
    ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
  replaceable package MediumCf = ExternalMedia.Examples.WaterCoolProp;
  Components.ORC.ORCunit ORC(redeclare package MediumSf =                                 MediumSf,
      redeclare package MediumCf = MediumCf)
    annotation (Placement(transformation(extent={{-18,-2},{38,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_sf(redeclare
      package Medium =                                                                        MediumSf,
    Mdot_0=2.6,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-74,70},{-54,90}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_sf(redeclare package
      Medium =                                                                          MediumSf,
      p0=400000)
    annotation (Placement(transformation(extent={{-70,-12},{-90,8}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_cf(redeclare package
      Medium =                                                                          MediumCf,
      p0=100000)
    annotation (Placement(transformation(extent={{78,-10},{98,10}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_cf(redeclare
      package Medium =                                                                        MediumCf,
    Mdot_0=8.9,
    T_0=333.15)
    annotation (Placement(transformation(extent={{98,50},{78,70}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-28,-6},{-48,14}})));
equation

  connect(ORC.OutFlowCf, sinkP_cf.flangeB) annotation (Line(
      points={{38.8,7.64444},{56,7.64444},{56,0},{79.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(source_sf.flangeB, ORC.InFlowSf) annotation (Line(
      points={{-55,80},{-18,80},{-18,40.7111},{-18.8,40.7111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(source_cf.flangeB, ORC.InFlowCf) annotation (Line(
      points={{79,60},{56,60},{56,53.1111},{38.8,53.1111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.OutFlowSf, sensTp.InFlow) annotation (Line(
      points={{-18.8,20.0444},{-18.8,-0.8},{-31,-0.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP_sf.flangeB) annotation (Line(
      points={{-45,-0.8},{-50,-0.8},{-50,-2},{-71.6,-2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORC;
