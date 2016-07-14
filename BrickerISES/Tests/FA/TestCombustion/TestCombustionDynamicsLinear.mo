within BrickerISES.Tests.FA.TestCombustion;
model TestCombustionDynamicsLinear
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=10,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    T=10) annotation (Placement(transformation(extent={{-22,-2},{-2,18}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1,
    outMax=10,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));
  Components.Biomass.CombustionDynamic.LinearPowerCombustion
    linearPowerCombustion
    annotation (Placement(transformation(extent={{2,36},{-18,56}})));
  Components.Biomass.CombustionDynamic.FirstorderPowerCombustion
    firstorderPowerCombustion
    annotation (Placement(transformation(extent={{0,66},{-20,86}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping
    annotation (Placement(transformation(extent={{-12,-84},{8,-64}})));
  Components.Biomass.CombustionDynamic.LinearPowerCombustion
    linearPowerCombustion1(Qcombustion_start=1e5, Qcombustion_Nominal=5e6)
    annotation (Placement(transformation(extent={{40,20},{20,40}})));
  Components.Biomass.CombustionDynamic.FirstorderPowerCombustion
    firstorderPowerCombustion1(Qcombustion_start=1e5)
    annotation (Placement(transformation(extent={{40,80},{20,100}})));
equation
  connect(firstOrder.u, const.y) annotation (Line(
      points={{-24,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limIntegrator.u, const.y) annotation (Line(
      points={{-16,-40},{-32,-40},{-32,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearPowerCombustion.Modulation, const.y) annotation (Line(
      points={{-18.6,46},{-34,46},{-34,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstorderPowerCombustion.Modulation, const.y) annotation (Line(
      points={{-20.6,76},{-28,76},{-28,50},{-34,50},{-34,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(criticalDamping.u, const.y) annotation (Line(
      points={{-14,-74},{-22,-74},{-22,-40},{-32,-40},{-32,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearPowerCombustion1.Modulation, const.y) annotation (Line(
      points={{19.4,30},{-34,30},{-34,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstorderPowerCombustion1.Modulation, const.y) annotation (Line(
      points={{19.4,90},{-34,90},{-34,8},{-49,8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=2500),
    __Dymola_experimentSetupOutput);
end TestCombustionDynamicsLinear;
