within BrickerISES.Tests.SA;
model testORC_HEX_model
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    UseT=true,
    redeclare package Medium = ThermoCycle.Media.Water,
    Mdot_0=10.4,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{-14,14},{14,-14}},
        rotation=90,
        origin={90,-84})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_water(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={31,-29})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,78},{-82,102}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-94,-32},{-130,-8}})));
  Modelica.Blocks.Sources.Constant Tin_water(k=60 + 273.15)
    annotation (Placement(transformation(extent={{138,-58},{128,-48}})));
  Modelica.Blocks.Sources.Constant Qeva(k=-486000)
    annotation (Placement(transformation(extent={{-38,52},{-28,62}})));
  BrickerISES.Components.ORC.ORCunitHex ORCunitHex(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model HeatTransferModelEva =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    UnomEva=1000,
    redeclare model HeatTransferModelCond =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    UnomCond=1000,
    Cond(redeclare model Medium2HeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant),
    Eva(redeclare model Medium2HeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant),
    redeclare package MediumWat = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{-38,0},{0,36}})));
  Modelica.Blocks.Sources.Constant Qcond(k=387000)
    annotation (Placement(transformation(extent={{6,52},{-4,62}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{150,68},{114,92}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{106,-56},{70,-32}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP2(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={72,76})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot_oil(
    UseT=true,
    Mdot_0=15,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=90,
        origin={-154,72})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                        annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-66,-56})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-64,42})));
  Modelica.Blocks.Sources.Constant m_oil(k=3.12)
    annotation (Placement(transformation(extent={{-118,96},{-128,106}})));
  Modelica.Blocks.Sources.Constant Tin_oil(k=225 + 273.15)
    annotation (Placement(transformation(extent={{-118,74},{-128,84}})));
  Modelica.Blocks.Sources.TimeTable m_water(table=[0,10.4; 400,10.4; 500,14;
        1000,14])
    annotation (Placement(transformation(extent={{142,-96},{128,-82}})));
equation
  connect(Qeva.y, ORCunitHex.QevapORC) annotation (Line(
      points={{-27.5,57},{-27.5,56},{-24.32,56},{-24.32,33.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qcond.y, ORCunitHex.QcondORC) annotation (Line(
      points={{-4.5,57},{-12.54,57},{-12.54,33.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_water.port_a, sourceMdot1.flangeB) annotation (Line(
      points={{31,-46},{60,-46},{60,-71.4},{90,-71.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot1.in_T, Tin_water.y) annotation (Line(
      points={{98.4,-84.28},{114,-84.28},{114,-53},{127.5,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, Temp_HEX_water_inlet.port) annotation (Line(
      points={{90,-71.4},{90,-56},{88,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond, sinkP2.flangeB) annotation (Line(
      points={{0,32.04},{34,32.04},{34,36},{72,36},{72,67.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet.port, sinkP2.flangeB) annotation (Line(
      points={{132,68},{110,68},{110,67.6},{72,67.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_oil.port_a, sourceMdot_oil.flangeB) annotation (Line(
      points={{-64,54},{-98,54},{-98,59.4},{-154,59.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.InletEvap, Mflow_oil.port_b) annotation (Line(
      points={{-38,28.8},{-52,28.8},{-52,30},{-64,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_oil.port_a, Temp_HEX_oil_inlet.port) annotation (Line(
      points={{-64,54},{-64,78}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.OutletEvap, sinkP1.flangeB) annotation (Line(
      points={{-38,5.04},{-52,5.04},{-52,-47.6},{-66,-47.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, Temp_HEX_oil_outlet.port) annotation (Line(
      points={{-66,-47.6},{-88,-47.6},{-88,-32},{-112,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_Mdot, m_oil.y) annotation (Line(
      points={{-145.6,80.4},{-138,80.4},{-138,101},{-128.5,101}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_T, Tin_oil.y) annotation (Line(
      points={{-145.6,72.28},{-138,72.28},{-138,79},{-128.5,79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_water.port_b, ORCunitHex.InletCond) annotation (Line(
      points={{31,-12},{18,-12},{18,6.12},{0,6.12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sourceMdot1.in_Mdot, m_water.y) annotation (Line(
      points={{98.4,-92.4},{112,-92.4},{112,-89},{127.3,-89}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-160,-120},{220,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-160,-120},{220,120}})));
end testORC_HEX_model;
