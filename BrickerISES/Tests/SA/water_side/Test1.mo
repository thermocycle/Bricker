within BrickerISES.Tests.SA.water_side;
model Test1
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-46,102},{-82,126}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-68,-8},{-104,16}})));
  Modelica.Blocks.Sources.Constant Qeva(k=-486000)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-23,103})));
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
    annotation (Placement(transformation(extent={{-28,10},{10,46}})));
  Modelica.Blocks.Sources.Constant Qcond(k=387000)
    annotation (Placement(transformation(extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-3,103})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{78,78},{42,102}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{52,-76},{16,-100}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot_oil(
    UseT=true,
    Mdot_0=15,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=90,
        origin={-144,82})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                        annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-42,-52})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-52,72})));
  Modelica.Blocks.Sources.Constant m_oil(k=3.12)
    annotation (Placement(transformation(extent={{-108,106},{-118,116}})));
  Modelica.Blocks.Sources.Constant Tin_oil(k=225 + 273.15)
    annotation (Placement(transformation(extent={{-108,84},{-118,94}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_water(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={159,-63})));
  Modelica.Blocks.Sources.Constant Tin_water1(
                                             k=60 + 273.15)
    annotation (Placement(transformation(extent={{306,-36},{296,-26}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP2(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={116,38})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(redeclare package
      Medium =         ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{288,-108},{252,-74}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot(redeclare package Medium = ThermoCycle.Media.Water, Mdot_0=10.4)
    annotation (Placement(transformation(extent={{108,-28},{80,0}})));
equation
  connect(Mflow_oil.port_a,sourceMdot_oil. flangeB) annotation (Line(
      points={{-52,84},{-88,84},{-88,69.4},{-144,69.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.InletEvap,Mflow_oil. port_b) annotation (Line(
      points={{-28,42.4},{-42,42.4},{-42,60},{-52,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_oil.port_a,Temp_HEX_oil_inlet. port) annotation (Line(
      points={{-52,84},{-52,102},{-64,102}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.OutletEvap,sinkP1. flangeB) annotation (Line(
      points={{-28,34},{-42,34},{-42,-43.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_Mdot,m_oil. y) annotation (Line(
      points={{-135.6,90.4},{-128,90.4},{-128,111},{-118.5,111}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_T,Tin_oil. y) annotation (Line(
      points={{-135.6,82.28},{-128,82.28},{-128,89},{-118.5,89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qcond.y, ORCunitHex.QcondORC) annotation (Line(
      points={{-3,97.5},{-3,72},{-6.78333,72},{-6.78333,46.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qeva.y, ORCunitHex.QevapORC) annotation (Line(
      points={{-23,97.5},{-23,72},{-18.5,72},{-18.5,46.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, ORCunitHex.OutletEvap) annotation (Line(
      points={{-86,-8},{-86,-18},{-52,-18},{-52,34},{-28,34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet.port, ORCunitHex.InletCond) annotation (Line(
      points={{34,-76},{34,-42},{8.1,-42},{8.1,14.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond, Temp_HEX_water_outlet.port) annotation (Line(
      points={{8.1,24},{12,24},{12,52},{60,52},{60,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP2.flangeB, ORCunitHex.Outletcond) annotation (Line(
      points={{107.6,38},{94,38},{94,40},{28,40},{28,24},{8.1,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, Mflow_water.port_a) annotation (Line(
      points={{253.08,-91},{159,-91},{159,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tin_water1.y, sourceP.in_T) annotation (Line(
      points={{295.5,-31},{269.64,-31},{269.64,-75.36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump_Mdot.inlet, Mflow_water.port_b) annotation (Line(
      points={{104.08,-13.3},{159,-13.3},{159,-46}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.outlet, ORCunitHex.InletCond) annotation (Line(
      points={{86.16,-3.64},{52,-3.64},{52,14.8},{8.1,14.8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-180,-120},{360,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent=
           {{-180,-120},{360,120}})));
end Test1;
