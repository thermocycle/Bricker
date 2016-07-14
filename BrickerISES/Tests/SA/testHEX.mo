within BrickerISES.Tests.SA;
model testHEX
  BrickerISES.Components.ORC.HEX hEX(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model Medium2HeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
    Unom=1000,
    Tstart_inlet=498.15,
    Tstart_outlet=498.15) annotation (Placement(transformation(
        extent={{-23,-21},{23,21}},
        rotation=90,
        origin={-53,-3})));
  Modelica.Blocks.Sources.Constant mflow(k=3.12)
    annotation (Placement(transformation(extent={{112,58},{102,68}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    UseT=true,
    Mdot_0=15,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{-14,14},{14,-14}},
        rotation=90,
        origin={32,74})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-22,-38})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HE(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=-90,
        origin={-45,71})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-98,40},{-134,64}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-106,-64},{-142,-40}})));
  Modelica.Blocks.Sources.Constant Tin(k=225 + 273.15)
    annotation (Placement(transformation(extent={{112,82},{102,92}})));
  Modelica.Blocks.Sources.Constant QHEX(k=-486000)
    annotation (Placement(transformation(extent={{-152,0},{-142,10}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,13; 2000,13; 2001,15;
        8000,15; 8001,15; 9000,15])
    annotation (Placement(transformation(extent={{328,26},{314,40}})));
equation
  connect(Tin.y, sourceMdot1.in_T) annotation (Line(
      points={{101.5,87},{58,87},{58,73.72},{40.4,73.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mflow.y, sourceMdot1.in_Mdot) annotation (Line(
      points={{101.5,63},{90,63},{90,65.6},{40.4,65.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(QHEX.y, hEX.u) annotation (Line(
      points={{-141.5,5},{-88,5},{-88,-3},{-69.8,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, hEX.outlet_fl2) annotation (Line(
      points={{-22,-46.4},{-22,-58},{-55.52,-58},{-55.52,-25.54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_outlet1.port, hEX.outlet_fl2) annotation (Line(
      points={{-124,-64},{-84,-64},{-84,-25.54},{-55.52,-25.54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_HE.port_b, hEX.inlet_fl2) annotation (Line(
      points={{-45,54},{-45,36},{-55.94,36},{-55.94,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Mflow_HE.port_a, sourceMdot1.flangeB) annotation (Line(
      points={{-45,88},{-45,98},{32,98},{32,86.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_HEX_water_inlet1.port, hEX.inlet_fl2) annotation (Line(
      points={{-116,40},{-116,20},{-55.94,20}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-160,-120},{220,120}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={
            {-160,-120},{220,120}})));
end testHEX;
