within BrickerISES.Tests.FA;
model TestNoThermalResistance
  parameter Integer N=10;
  //Tstart_inlet=402.157968,
  //Tstart_outlet=357.76567852)
  //Tstart_inlet=353.82,
  //Tstart_outlet=316.91)
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceWF1(
    h_0=470523,
    UseT=true,
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Mdot_0=1,
    p=100000,
    T_0=418.15)
    annotation (Placement(transformation(extent={{-90,62},{-70,82}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkPFluid1(redeclare
      package Medium = ThermoCycle.Media.Therminol66, p0=100000)
    annotation (Placement(transformation(extent={{74,50},{94,70}})));
  ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc flow1DimInc(
    redeclare package Medium = ThermoCycle.Media.Therminol66,
    Unom=1000,
    Mdotnom=3,
    steadystate=false,
    A=1,
    N=N,
    pstart=100000,
    Tstart_inlet=418.15,
    Tstart_outlet=418.15,
    redeclare model Flow1DimIncHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal)
    annotation (Placement(transformation(extent={{-16,76},{8,52}})));
  ThermoCycle.Components.HeatFlow.Walls.MetalWall metalWall(
    N=N,
    steadystate_T_wall=false,
    Aext=2,
    Aint=1,
    M_wall=10,
    c_wall=4000,
    Tstart_wall_1=418.15,
    Tstart_wall_end=418.15)
    annotation (Placement(transformation(extent={{-22,30},{-2,50}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-66,-90},{-58,-82}})));
  Modelica.Blocks.Math.BooleanToInteger booleanToInteger
    annotation (Placement(transformation(extent={{-44,-90},{-34,-80}})));
  Components.AbsorberSoltiguaWall absorberSoltigua(
    N=N,
    S=10,
    Dext_t=0.04)
    annotation (Placement(transformation(extent={{-42,-18},{-12,12}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-88,34},{-68,54}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-92,-24},{-72,-4}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-90,6},{-70,26}})));
  Modelica.Blocks.Sources.Constant const3(k=1000)
    annotation (Placement(transformation(extent={{-88,-48},{-68,-28}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-104,-88},{-84,-68}})));
equation
  connect(flow1DimInc.InFlow, sourceWF1.flangeB) annotation (Line(
      points={{-14,64},{-42,64},{-42,72},{-71,72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DimInc.OutFlow, sinkPFluid1.flangeB) annotation (Line(
      points={{6,63.9},{42,63.9},{42,60},{75.6,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(metalWall.Wall_int, flow1DimInc.Wall_int) annotation (Line(
      points={{-12,43},{-12,50.5},{-4,50.5},{-4,59}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(not1.y, booleanToInteger.u) annotation (Line(
      points={{-57.6,-86},{-44,-86},{-44,-85},{-45,-85}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(absorberSoltigua.Focusing, booleanToInteger.y) annotation (Line(
      points={{-42,-15.9},{-33.5,-15.9},{-33.5,-85}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(absorberSoltigua.wall_int, metalWall.Wall_ext) annotation (Line(
      points={{-13.5,-3},{-13.5,19.5},{-12.2,19.5},{-12.2,37}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(absorberSoltigua.v_wind, const.y) annotation (Line(
      points={{-40.35,9.75},{-40.35,25.875},{-67,25.875},{-67,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absorberSoltigua.Theta, const2.y) annotation (Line(
      points={{-40.35,3.75},{-55.175,3.75},{-55.175,16},{-69,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, absorberSoltigua.Tamb) annotation (Line(
      points={{-71,-14},{-56,-14},{-56,-1.8},{-40.5,-1.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, absorberSoltigua.DNI) annotation (Line(
      points={{-67,-38},{-54,-38},{-54,-7.65},{-40.05,-7.65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, not1.u) annotation (Line(
      points={{-83,-78},{-76,-78},{-76,-86},{-66.8,-86}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end TestNoThermalResistance;
