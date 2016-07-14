within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    N=5,
    Ns=3,
    Nt=4,
    Mdotnom=2.5,
    Unom=1000,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-50,-22},{-8,48}})));

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    p=100000,
    T_0=436.15)
    annotation (Placement(transformation(extent={{-54,-70},{-34,-50}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       100000)
    annotation (Placement(transformation(extent={{2,76},{22,96}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-136,-2},{-116,18}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-136,26},{-116,46}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-136,60},{-116,80}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=900)
    annotation (Placement(transformation(extent={{-136,-36},{-116,-16}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-134,-74},{-114,-54}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-22,66},{-42,86}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{28,-76},{48,-56}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{30,-44},{50,-24}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{34,-16},{54,4}})));
  Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{94,-114},{110,-100}})));
  Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{50,18},{32,34}})));
  Components.SF.SolarField_SoltiguaWall_Inc             solarField_SoltiguaWall_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Mwall=60,
    Ns=3,
    Nt=4,
    Unom=1000,
    Mdotnom=2.5,
    N=5,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=477.15,
    Tstart_inlet_wall=443.15,
    Tstart_outlet_wall=443.15)
    annotation (Placement(transformation(extent={{94,-76},{130,-32}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
    annotation (Placement(transformation(extent={{36,-150},{54,-132}})));
  Modelica.Blocks.Sources.Constant Tamb1(k=900)
    annotation (Placement(transformation(extent={{32,-116},{52,-96}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    p=100000,
    T_0=436.15)
    annotation (Placement(transformation(extent={{110,-154},{130,-134}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       100000)
    annotation (Placement(transformation(extent={{166,-8},{186,12}})));
equation
  connect(sourceMdot.flangeB, solarCollectorIncSchott.InFlow) annotation (
      Line(
      points={{-35,-60},{-24.8,-60},{-24.8,-22.6364}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-115,70},{-92,70},{-92,42},{-47.2,42},{-47.2,42.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-115,36},{-92,36},{-92,28.9091},{-47.6667,28.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-115,8},{-92,8},{-92,14.9091},{-47.6667,14.9091}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-115,-26},{-92,-26},{-92,1.86364},{-47.9,1.86364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-113,-64},{-84,-64},{-84,-11.8182},{-47.6667,-11.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-25,71.2},{-12,71.2},{-12,56},{-22,56},{-22,47.3636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-39,71.2},{-48,71.2},{-48,94},{-10,94},{-10,86},{3.6,86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_Wind.y,solarField_SoltiguaWall_Inc. v_wind) annotation (Line(
      points={{55,-6},{66,-6},{66,-20},{96.4,-20},{96.4,-35.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y,solarField_SoltiguaWall_Inc. Theta) annotation (Line(
      points={{51,-34},{62,-34},{62,-44},{96,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y,solarField_SoltiguaWall_Inc. Tamb) annotation (Line(
      points={{49,-66},{58,-66},{58,-54},{96,-54},{96,-52.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y,solarField_SoltiguaWall_Inc. Defocusing) annotation (
      Line(
      points={{54.9,-141},{82,-141},{82,-70},{96,-70},{96,-69.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.T,hysteresis. u) annotation (Line(
      points={{34.7,26},{6,26},{6,-136},{18,-136},{18,-141},{34.2,-141}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature_OUT_SF.port,solarField_SoltiguaWall_Inc. OutFlow)
    annotation (Line(
      points={{41,18},{102,18},{102,0},{118,0},{118,-32.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tamb1.y,solarField_SoltiguaWall_Inc. DNI) annotation (Line(
      points={{53,-106},{66,-106},{66,-104},{76,-104},{76,-61},{95.8,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.InFlow, sourceMdot1.flangeB)
    annotation (Line(
      points={{115.6,-76.4},{115.6,-98},{150,-98},{150,-144},{129,-144}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc.OutFlow, sinkP1.flangeB) annotation (
      Line(
      points={{118,-32.4},{118,2},{167.6,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(temperature_IN_SF.port, sourceMdot1.flangeB) annotation (Line(
      points={{102,-114},{104,-114},{104,-120},{128,-120},{128,-98},{150,-98},
          {150,-144},{129,-144}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-160},{180,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-160},{180,100}})));
end Test_SF;
