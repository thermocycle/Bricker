within BrickerISES.Tests.AD.TestComponents;
model Test_SFL_CellLMTD

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.45,
    p=100000,
    T_0=447.15)
    annotation (Placement(transformation(extent={{-38,-74},{-18,-54}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000)
    annotation (Placement(transformation(extent={{18,70},{38,90}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-132,2},{-112,22}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-134,36},{-114,56}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-132,70},{-112,90}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,60},{-18,76}})));
  Components.SF.SF_SoltiguaL_CellLMTD sF_Soltigua_L(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Unom=1000,
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    Ns=3,
    Mwall=26.64,
    Mwf=20,
    Nt=4,
    pstart=100000,
    Tstart_inlet=447.15,
    Tstart_outlet=482.15)
    annotation (Placement(transformation(extent={{-28,-22},{6,30}})));
  Modelica.Blocks.Sources.Step step(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{-132,-36},{-112,-16}})));
equation

  connect(sourceMdot.flangeB, sF_Soltigua_L.InFlow) annotation (Line(
      points={{-19,-64},{-16,-64},{-16,-62},{-7.6,-62},{-7.6,-22.4727}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sF_Soltigua_L.OutFlow, sensTp.InFlow) annotation (Line(
      points={{-5.33333,29.5273},{-5.33333,60.48},{-12,60.48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, sF_Soltigua_L.Tamb) annotation (Line(
      points={{-111,12},{-100,12},{-100,5.41818},{-26.1111,5.41818}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, sF_Soltigua_L.Theta) annotation (Line(
      points={{-113,46},{-106,46},{-106,44},{-90,44},{-90,15.8182},{-26.1111,
          15.8182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, sF_Soltigua_L.v_wind) annotation (Line(
      points={{-111,80},{-100,80},{-100,76},{-62,76},{-62,25.7455},{-25.7333,
          25.7455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, sF_Soltigua_L.Defocusing) annotation (Line(
      points={{-97,-70},{-78,-70},{-78,-60},{-40,-60},{-40,-14.4364},{-26.1111,
          -14.4364}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(step.y, sF_Soltigua_L.DNI) annotation (Line(
      points={{-111,-26},{-56,-26},{-56,-4.27273},{-26.3,-4.27273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp.InFlow, sinkP.flangeB) annotation (Line(
      points={{-12,60.48},{-24,60.48},{-24,62},{-34,62},{-34,80},{19.6,80}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SFL_CellLMTD;
