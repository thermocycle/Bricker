within BrickerISES.Tests.AD.TestComponents;
model Test_SF_Wall

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.45,
    p=100000,
    T_0=447.15)
    annotation (Placement(transformation(extent={{-38,-74},{-18,-54}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=100000)
    annotation (Placement(transformation(extent={{18,70},{38,90}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-132,2},{-112,22}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-134,36},{-114,56}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-132,70},{-112,90}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{-132,-70},{-112,-50}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,60},{-26,80}})));
  Components.SF.SolarField_SoltiguaWall_Inc solarField_SoltiguaWall_Inc_II(
    N=4,
    Ns=3,
    Mdotnom=2,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    steadystate_T_fl=true,
    steadystate_T_wall=true,
    Unom=1000,
    Tstart_inlet_wall=151 + 10,
    Tstart_outlet_wall=209 + 10,
    Mwall=26.64,
    cwall=480,
    TotalDefocusing=false,
    Def=25,
    Nt=4,
    pstart=100000,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15)
    annotation (Placement(transformation(extent={{-66,-32},{-14,14}})));

  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{-132,-34},{-112,-14}})));
equation

  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-23,65.2},{-32,65.2},{-32,88},{6,88},{6,80},{19.6,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc_II.InFlow, sourceMdot.flangeB)
    annotation (Line(
      points={{-34.8,-32.4182},{-34.8,-42},{-2,-42},{-2,-64},{-19,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc_II.OutFlow, sensTp.InFlow) annotation (
      Line(
      points={{-31.3333,13.5818},{-31.3333,28},{-6,28},{-6,65.2},{-9,65.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarField_SoltiguaWall_Inc_II.v_wind) annotation (Line(
      points={{-111,80},{-100,80},{-100,66},{-62.5333,66},{-62.5333,10.2364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarField_SoltiguaWall_Inc_II.Tamb) annotation (Line(
      points={{-111,12},{-96,12},{-96,-10},{-78,-10},{-78,-7.74545},{-63.1111,
          -7.74545}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_SoltiguaWall_Inc_II.Defocusing)
    annotation (Line(
      points={{-111,-60},{-82,-60},{-82,-25.3091},{-63.1111,-25.3091}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarField_SoltiguaWall_Inc_II.Theta, const1.y) annotation (Line(
      points={{-63.1111,1.45455},{-76,1.45455},{-76,46},{-113,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarField_SoltiguaWall_Inc_II.DNI) annotation (Line(
      points={{-111,-24},{-111,-16.3182},{-63.4,-16.3182}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SF_Wall;
