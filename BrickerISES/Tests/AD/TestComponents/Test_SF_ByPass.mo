within BrickerISES.Tests.AD.TestComponents;
model Test_SF_ByPass

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=19,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-124,-8},{-82,62}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        455000)
    annotation (Placement(transformation(extent={{78,100},{98,120}})));
  Modelica.Blocks.Sources.Constant const(k=25)
    annotation (Placement(transformation(extent={{-194,12},{-174,32}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-194,44},{-174,64}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-194,86},{-174,106}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=970)
    annotation (Placement(transformation(extent={{-196,-22},{-176,-2}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-192,-60},{-172,-40}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{98,-46},{78,-26}})));

  Modelica.Blocks.Sources.Constant const2(k=0.04)
    annotation (Placement(transformation(extent={{-40,36},{-30,46}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{36,116},{56,136}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07)
         annotation (Placement(transformation(extent={{-66,98},{-46,118}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.42718e-05,
    CheckValve=true)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={8,28})));

equation
  connect(const3.y,solarCollectorIncSchott. v_wind) annotation (Line(
      points={{-173,96},{-130,96},{-130,54},{-121.2,54},{-121.2,56.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y,solarCollectorIncSchott. Theta) annotation (Line(
      points={{-173,54},{-138,54},{-138,42.9091},{-121.667,42.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y,solarCollectorIncSchott. Tamb) annotation (Line(
      points={{-173,22},{-142,22},{-142,28.9091},{-121.667,28.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-175,-12},{-130,-12},{-130,15.8636},{-121.9,15.8636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-171,-50},{-142,-50},{-142,2.18182},{-121.667,2.18182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{79,-36},{-98.8,-36},{-98.8,-8.63636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP.InFlow) annotation (Line(
      points={{-96,61.3636},{-96,108},{-65,108}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-47,108},{-6,108},{-6,110},{46,110},{46,116.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{8,19},{8,-36},{-98.8,-36},{-98.8,-8.63636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, valve.cmd) annotation (Line(
      points={{-29.5,41},{-20,41},{-20,28},{0,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.OutFlow, sensTp.InFlow) annotation (Line(
      points={{8,37},{8,110},{46,110},{46,116.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, sinkP.flangeB) annotation (Line(
      points={{46,116.6},{54,116.6},{54,118},{58,118},{58,110},{79.6,110}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-200,-120},{180,160}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-200,-120},{180,160}})));
end Test_SF_ByPass;
