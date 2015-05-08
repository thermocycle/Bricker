within BrickerISES.Tests.AD.TestComponents.SimpleValve;
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
        450000)
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
    offset=1000)
    annotation (Placement(transformation(extent={{-194,-22},{-174,-2}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-192,-60},{-172,-40}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{98,-46},{78,-26}})));
 BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Afull=2.5e-05,
    UseNom=true,
    CheckValve=true,
    Xopen=1,
    DELTAp_nom=100000)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-6,32})));

  Modelica.Blocks.Sources.Constant const2(k=0.04)
    annotation (Placement(transformation(extent={{-50,28},{-40,38}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{34,106},{54,126}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96E+07)
         annotation (Placement(transformation(extent={{-72,102},{-52,122}})));
equation
  connect(const3.y,solarCollectorIncSchott. v_wind) annotation (Line(
      points={{-173,96},{-148,96},{-148,58},{-121.2,58},{-121.2,56.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y,solarCollectorIncSchott. Theta) annotation (Line(
      points={{-173,54},{-148,54},{-148,42.9091},{-121.667,42.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y,solarCollectorIncSchott. Tamb) annotation (Line(
      points={{-173,22},{-148,22},{-148,28.9091},{-121.667,28.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-173,-12},{-148,-12},{-148,15.8636},{-121.9,15.8636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-171,-50},{-140,-50},{-140,2.18182},{-121.667,2.18182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{79,-36},{-98.8,-36},{-98.8,-8.63636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{-6,23},{-6,-36},{-98.8,-36},{-98.8,-8.63636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, valve.cmd) annotation (Line(
      points={{-39.5,33},{-32,33},{-32,32},{-14,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{51,111.2},{74,111.2},{74,110},{79.6,110}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-6,41},{-6,110},{37,110},{37,111.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP3.InFlow) annotation (Line(
      points={{-96,61.3636},{-96,112},{-71,112}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP3.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-53,112},{-30,112},{-30,110},{37,110},{37,111.2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-200,-120},{180,160}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-200,-120},{180,160}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_SF_ByPass;
