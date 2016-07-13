within BrickerISES.Tests.AD.TestComponents;
model Test_HX_Lumped

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=4.8,
    p=400000,
    T_0=354.15) annotation (Placement(transformation(extent={{22,36},{42,56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000)
    annotation (Placement(transformation(extent={{-64,46},{-44,66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=3.9,
    p=100000,
    T_0=340.15)
    annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.Water, p0=100000)
    annotation (Placement(transformation(extent={{48,-30},{68,-10}})));

  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-52,4},{-72,24}})));
  Components.HX_singlephase hX_singlephase_II(
    redeclare package MediumPs = ThermoCycle.Media.Water,
    redeclare package MediumSs =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    M_wall=35,
    MdotNom_ps=3.9,
    MdotNom_ss=4.8,
    A_ps=6.4,
    A_ss=6.4,
    U_ps=2500,
    U_ss=3000,
    p_ps_start=100000,
    T_ps_su_start=340.15,
    T_ps_ex_start=343.15,
    p_ss_start=400000,
    T_ss_su_start=354.15,
    T_ss_ex_start=347.15)
    annotation (Placement(transformation(extent={{-30,-32},{0,8}})));
equation

  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-69,9.2},{-82,9.2},{-82,56},{-62.4,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hX_singlephase_II.InFlowPs) annotation (Line(
      points={{-67,-20},{-56,-20},{-56,-12.4},{-31.5,-12.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hX_singlephase_II.OutFlowPs, sinkP1.flangeB) annotation (Line(
      points={{1.5,-12.4},{30,-12.4},{30,-20},{49.6,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, hX_singlephase_II.InFlowSs) annotation (Line(
      points={{41,46},{48,46},{48,44},{52,44},{52,6},{-1.5,6},{-1.5,2.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hX_singlephase_II.OutFlowSs, sensTp.InFlow) annotation (Line(
      points={{-28.5,-26.8},{-28.5,-36},{-46,-36},{-46,9.2},{-55,9.2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
                    graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_HX_Lumped;
