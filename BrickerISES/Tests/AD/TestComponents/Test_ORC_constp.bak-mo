within BrickerISES.Tests.AD.TestComponents;
model Test_ORC_constp
  replaceable package MediumSf =
      ThermoCycle.Media.Incompressible.IncompressibleCP.HighTemperature.Therminol_VP1;
  replaceable package MediumCf = ExternalMedia.Examples.WaterCoolProp;
  Components.ORC.ORCunit ORC(redeclare package MediumSf =                                 MediumSf,
      redeclare package MediumCf = MediumCf)
    annotation (Placement(transformation(extent={{-18,-2},{36,48}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_sf(redeclare
      package Medium =                                                                        MediumSf,
    Mdot_0=2.5,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-66,42},{-46,62}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_sf(redeclare package
      Medium =                                                                          MediumSf,
      p0=200000)
    annotation (Placement(transformation(extent={{-52,-22},{-72,-2}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP_cf(redeclare package
      Medium =                                                                          MediumCf,
      p0=100000)
    annotation (Placement(transformation(extent={{78,-10},{98,10}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot source_cf(redeclare
      package Medium =                                                                        MediumCf,
    Mdot_0=8.9,
    T_0=333.15)
    annotation (Placement(transformation(extent={{98,50},{78,70}})));
equation

  connect(sinkP_sf.flangeB, ORC.OutFlowSf) annotation (Line(
      points={{-53.6,-12},{-20,-12},{-20,15.7778},{-18.7714,15.7778}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORC.OutFlowCf, sinkP_cf.flangeB) annotation (Line(
      points={{36.7714,5.77778},{56,5.77778},{56,0},{79.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(source_sf.flangeB, ORC.InFlowSf) annotation (Line(
      points={{-47,52},{-18,52},{-18,32.4444},{-18.7714,32.4444}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(source_cf.flangeB, ORC.InFlowCf) annotation (Line(
      points={{79,60},{56,60},{56,42.4444},{36.7714,42.4444}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORC_constp;
