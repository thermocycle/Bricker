within BrickerISES.Tests.AD.TestComponents;
model Test_SF

 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        455000)
    annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-196,12},{-176,32}})));
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
    Mdot_0=2.5,
    p=100000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{-20,-80},{-40,-60}})));

  Components.SF.SolarField_SoltiguaWall_Inc SF(
    Nt=4,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    steadystate_T_fl=true,
    steadystate_T_wall=true,
    Unom=1000,
    Mwall=26.64,
    cwall=480,
    Tstart_inlet_wall=163 + 10,
    Tstart_outlet_wall=203 + 10,
    N=5,
    Mdotnom=2.5,
    Ns=3,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-122,-22},{-92,32}})));

  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpOut(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-90,82},{-110,102}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpIn(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-68,-58},{-88,-38}})));
equation
  connect(booleanConstant.y, SF.Defocusing) annotation (Line(
      points={{-171,-50},{-164,-50},{-164,-48},{-138,-48},{-138,-14.1455},{
          -120.333,-14.1455}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(const1.y, SF.Theta) annotation (Line(
      points={{-173,54},{-152,54},{-152,16},{-130,16},{-130,17.2727},{-120.333,
          17.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, SF.Tamb) annotation (Line(
      points={{-175,22},{-160,22},{-160,6.47273},{-120.333,6.47273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, SF.DNI) annotation (Line(
      points={{-175,-12},{-160,-12},{-160,-3.59091},{-120.5,-3.59091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, SF.v_wind) annotation (Line(
      points={{-173,96},{-140,96},{-140,27.5818},{-120,27.5818}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SF.OutFlow, sensTpOut.InFlow) annotation (Line(
      points={{-102,31.5091},{-102,54},{-100,54},{-100,82.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpOut.InFlow, sinkP.flangeB) annotation (Line(
      points={{-100,82.6},{-82,82.6},{-82,80},{-8.4,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF.InFlow, sensTpIn.InFlow) annotation (Line(
      points={{-104,-22.4909},{-104,-57.4},{-78,-57.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpIn.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{-78,-57.4},{-70,-57.4},{-70,-58},{-66,-58},{-66,-76},{-38,-76},{
          -38,-70},{-39,-70}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-200,-120},{180,160}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-200,-120},{180,160}})));
end Test_SF;
