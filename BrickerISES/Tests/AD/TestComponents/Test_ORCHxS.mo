within BrickerISES.Tests.AD.TestComponents;
model Test_ORCHxS

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{-94,18},{-74,38}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        350000)
    annotation (Placement(transformation(extent={{-44,-94},{-24,-74}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{12,28},{0,40}})));
  Modelica.Blocks.Sources.Constant const1(k=2.5)
    annotation (Placement(transformation(extent={{-20,60},{-32,72}})));

  Components.ORC.ORCunitHxS oRCunitHxS(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    MdotNom_wf=2.5,
    MdotNom_sf=2.6,
    Use_AU=false,
    A_wf=80,
    A_sf=80,
    U_wf=5000,
    U_sf=1000,
    p_wf_start=2500000,
    T_wf_su_start=333.15,
    T_wf_ex_start=403.15,
    p_sf_start=350000,
    T_sf_su_start=518.15,
    T_sf_ex_start=427.15,
    MdotWf=2.5,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{-40,-40},{-8,2}})));
equation
  connect(sourceMdot.flangeB, oRCunitHxS.InletSf) annotation (Line(
      points={{-75,28},{-62,28},{-62,-5},{-40.4571,-5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHxS.OutletSf, sinkP.flangeB) annotation (Line(
      points={{-40.9143,-33.4667},{-60,-33.4667},{-60,-84},{-42.4,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHxS.MdotWfORC) annotation (Line(
      points={{-32.6,66},{-40,66},{-40,28},{-28.1143,28},{-28.1143,0.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, oRCunitHxS.TWfORCSu) annotation (Line(
      points={{-0.6,34},{-10,34},{-10,32},{-16.6857,32},{-16.6857,0.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORCHxS;
