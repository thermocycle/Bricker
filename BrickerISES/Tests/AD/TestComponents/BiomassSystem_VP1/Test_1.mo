within BrickerISES.Tests.AD.TestComponents.BiomassSystem_VP1;
model Test_1
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=19,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-70,-122},{-28,-52}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=25)
    annotation (Placement(transformation(extent={{-156,-98},{-136,-78}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-156,-66},{-136,-46}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-148,-20},{-128,0}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=1000)
    annotation (Placement(transformation(extent={{-156,-132},{-136,-112}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-154,-170},{-134,-150}})));
 Components.Valve_lin             valve3(
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.5e-05,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={46,-80})));
  Modelica.Blocks.Sources.Constant const4(k=0.04)
    annotation (Placement(transformation(extent={{2,-84},{12,-74}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{86,-6},{106,14}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.6,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{150,-158},{130,-138}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    h=0,
    A=5e3,
    k=2.96E+07,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
         annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66, p0=
        450000)
    annotation (Placement(transformation(extent={{180,128},{200,148}})));
Components.Valve_lin             valve(
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.6923,
    Afull=5.20006e-05,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
                annotation (Placement(transformation(extent={{96,62},{76,82}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66, p0=
        400000)
    annotation (Placement(transformation(extent={{14,68},{-6,88}})));
equation
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-135,-122},{-108,-122},{-108,-98.1364},{-67.9,-98.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-133,-160},{-86,-160},{-86,-111.818},{-67.6667,-111.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{131,-148},{-44.8,-148},{-44.8,-122.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{46,-89},{46,-148},{-44.8,-148},{-44.8,-122.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y,valve3. cmd) annotation (Line(
      points={{12.5,-79},{20,-79},{20,-80},{38,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve3.OutFlow,sensTp1. InFlow) annotation (Line(
      points={{46,-71},{46,-2},{89,-2},{89,-0.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y,solarCollectorIncSchott. Theta) annotation (Line(
      points={{-135,-56},{-110,-56},{-110,-71.0909},{-67.6667,-71.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y,solarCollectorIncSchott. Tamb) annotation (Line(
      points={{-135,-88},{-108,-88},{-108,-85.0909},{-67.6667,-85.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y,solarCollectorIncSchott. v_wind) annotation (Line(
      points={{-127,-10},{-106,-10},{-106,-57.7273},{-67.2,-57.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP3.InFlow) annotation (Line(
      points={{-42,-52.6364},{-46,-52.6364},{-46,0},{-39,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP3.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-21,0},{14,0},{14,-2},{89,-2},{89,-0.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{103,-0.8},{150,-0.8},{150,138},{181.6,138}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, sinkP.flangeB) annotation (Line(
      points={{95,72},{150,72},{150,138},{181.6,138}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, valve.OutFlow) annotation (Line(
      points={{12.4,78},{30,78},{30,80},{44,80},{44,72},{77,72}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-180,-200},{220,160}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-180,-200},{220,160}})));
end Test_1;
