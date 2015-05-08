within BrickerISES.Tests.AD.TestComponents.BiomassSystem_VP1;
model Test_2
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66, p0=
        450000)
    annotation (Placement(transformation(extent={{70,-148},{90,-128}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66, p0=
        400000)
    annotation (Placement(transformation(extent={{-226,-208},{-246,-188}})));
Components.Valve_lin             valve1(
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
                annotation (Placement(transformation(extent={{-144,-148},{-124,
            -128}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    Mdot_0=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p=100000,
    T_0=533.15)
    annotation (Placement(transformation(extent={{-228,-122},{-208,-102}})));
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
    annotation (Placement(transformation(extent={{-182,-412},{-140,-342}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=25)
    annotation (Placement(transformation(extent={{-268,-388},{-248,-368}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-268,-356},{-248,-336}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-260,-310},{-240,-290}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=1000)
    annotation (Placement(transformation(extent={{-268,-422},{-248,-402}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-266,-460},{-246,-440}})));
 Components.Valve_lin             valve3(
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.5e-05,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-66,-370})));
  Modelica.Blocks.Sources.Constant const4(k=0.04)
    annotation (Placement(transformation(extent={{-110,-374},{-100,-364}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{-26,-296},{-6,-276}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.6,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{38,-448},{18,-428}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP3(
    h=0,
    A=5e3,
    k=2.96E+07,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
         annotation (Placement(transformation(extent={{-152,-300},{-132,-280}})));
Components.Valve_lin             valve2(
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.6923,
    Afull=5.20006e-05,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
                annotation (Placement(transformation(extent={{-16,-228},{-36,
            -208}})));
equation
  connect(sourceMdot1.flangeB, valve1.InFlow) annotation (Line(
      points={{-209,-112},{-174,-112},{-174,-138},{-143,-138}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, sinkP.flangeB) annotation (Line(
      points={{-209,-112},{-126,-112},{-126,-108},{-10,-108},{-10,-144},{40,
          -144},{40,-138},{71.6,-138}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(step.y,solarCollectorIncSchott. DNI) annotation (Line(
      points={{-247,-412},{-220,-412},{-220,-388.136},{-179.9,-388.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y,solarCollectorIncSchott. Defocusing) annotation (
      Line(
      points={{-245,-450},{-198,-450},{-198,-401.818},{-179.667,-401.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{19,-438},{-156.8,-438},{-156.8,-412.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve3.InFlow,solarCollectorIncSchott. InFlow) annotation (Line(
      points={{-66,-379},{-66,-438},{-156.8,-438},{-156.8,-412.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y,valve3. cmd) annotation (Line(
      points={{-99.5,-369},{-92,-369},{-92,-370},{-74,-370}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve3.OutFlow,sensTp1. InFlow) annotation (Line(
      points={{-66,-361},{-66,-292},{-23,-292},{-23,-290.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y,solarCollectorIncSchott. Theta) annotation (Line(
      points={{-247,-346},{-222,-346},{-222,-361.091},{-179.667,-361.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y,solarCollectorIncSchott. Tamb) annotation (Line(
      points={{-247,-378},{-220,-378},{-220,-375.091},{-179.667,-375.091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y,solarCollectorIncSchott. v_wind) annotation (Line(
      points={{-239,-300},{-218,-300},{-218,-347.727},{-179.2,-347.727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, dP3.InFlow) annotation (Line(
      points={{-154,-342.636},{-158,-342.636},{-158,-290},{-151,-290}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP3.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-133,-290},{-98,-290},{-98,-292},{-23,-292},{-23,-290.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve2.InFlow, sensTp1.OutFlow) annotation (Line(
      points={{-17,-218},{10,-218},{10,-220},{50,-220},{50,-290.8},{-9,-290.8}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(valve2.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{-35,-218},{-126,-218},{-126,-198},{-227.6,-198}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{-125,-138},{-84,-138},{-84,-218},{-126,-218},{-126,-198},{-227.6,
          -198}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, sensTp1.OutFlow) annotation (Line(
      points={{71.6,-138},{50,-138},{50,-290.8},{-9,-290.8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-320,-460},{200,40}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-320,-460},{200,40}})));
end Test_2;
