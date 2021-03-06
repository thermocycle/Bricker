within BrickerISES.Tests.AD.TestComponents;
model Test_SFL_AirCell

 ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.45,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{-40,-96},{-20,-76}})));
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        455000)
    annotation (Placement(transformation(extent={{18,70},{38,90}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-132,2},{-112,22}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-134,36},{-114,56}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-132,70},{-112,90}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpOut(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,60},{-26,80}})));
  Components.SF.SF_SoltiguaL_AirCell SF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Nt=4,
    Mwall=26.64,
    cwall=480,
    Unom=1000,
    Mdotnom=2.5,
    Tstart_inlet_wall=163 + 10,
    Tstart_outlet_wall=203 + 10,
    steadystate_T_wall=true,
    Ns=1,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-40,-32},{2,28}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpIn(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{32,-54},{12,-34}})));
  Modelica.Blocks.Sources.Step step1(
    startTime=200,
    height=0,
    offset=970)
    annotation (Placement(transformation(extent={{-132,-32},{-112,-12}})));
equation

  connect(booleanConstant.y, SF.Defocusing) annotation (Line(
      points={{-97,-70},{-90,-70},{-90,-64},{-82,-64},{-82,-32},{-37.6667,-32},
          {-37.6667,-23.2727}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(const.y, SF.Tamb) annotation (Line(
      points={{-111,12},{-96,12},{-96,2},{-37.6667,2},{-37.6667,-0.363636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, SF.Theta) annotation (Line(
      points={{-113,46},{-86,46},{-86,12},{-37.6667,12},{-37.6667,11.6364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, SF.v_wind) annotation (Line(
      points={{-111,80},{-96,80},{-96,74},{-70,74},{-70,23.0909},{-37.2,23.0909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sensTpOut.InFlow, SF.OutFlow) annotation (Line(
      points={{-16,60.6},{-6,60.6},{-6,40},{-16,40},{-16,27.4545},{-12,27.4545}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(sourceMdot.flangeB, sensTpIn.InFlow) annotation (Line(
      points={{-21,-86},{10,-86},{10,-66},{48,-66},{48,-53.4},{22,-53.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpOut.InFlow, sinkP.flangeB) annotation (Line(
      points={{-16,60.6},{-20,60.6},{-20,60},{-36,60},{-36,80},{19.6,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.InFlow, sensTpIn.InFlow) annotation (Line(
      points={{-14.8,-32.5455},{-14.8,-53.4},{22,-53.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(step1.y, SF.DNI) annotation (Line(
      points={{-111,-22},{-82,-22},{-82,-10},{-37.9,-10},{-37.9,-11.5455}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-100},{100,100}})));
end Test_SFL_AirCell;
