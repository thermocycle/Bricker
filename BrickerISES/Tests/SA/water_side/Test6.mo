within BrickerISES.Tests.SA.water_side;
model Test6
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-82,102},{-118,126}})));
  Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-104,-8},{-140,16}})));
  Modelica.Blocks.Sources.Constant Qeva(k=-486000)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-59,103})));
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
    redeclare package MediumWat = ThermoCycle.Media.Water,
    TstartEva_inlet=498.15,
    TstartEva_outlet=498.15,
    pstartCond=400000,
    TstartCond_inlet=333.15,
    TstartCond_outlet=343.15)
    annotation (Placement(transformation(extent={{-64,10},{-26,46}})));
  Modelica.Blocks.Sources.Constant Qcond(k=387000)
    annotation (Placement(transformation(extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-39,103})));
  Modelica.Fluid.Sensors.Temperature Temp_ORC_cond_outlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{42,78},{6,102}})));
  Modelica.Fluid.Sensors.Temperature Temp_ORC_cond_inlet(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{16,-76},{-20,-100}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot_oil(
    UseT=true,
    Mdot_0=15,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=333.15) annotation (Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=90,
        origin={-180,84})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                        annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-78,-52})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_oil(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-88,72})));
  Modelica.Blocks.Sources.Constant m_oil(k=3.12)
    annotation (Placement(transformation(extent={{-144,106},{-154,116}})));
  Modelica.Blocks.Sources.Constant Tin_oil(k=225 + 273.15)
    annotation (Placement(transformation(extent={{-144,84},{-154,94}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_cond(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=0,
        origin={103,-7})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot(redeclare package Medium = ThermoCycle.Media.Water, Mdot_0=10.4)
    annotation (Placement(transformation(extent={{52,-26},{24,2}})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_chiller(redeclare package Medium =
        ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=180,
        origin={259,159})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump_Mdot
    pump_Mdot2(
              redeclare package Medium = ThermoCycle.Media.Water, Mdot_0=
        10.41)
    annotation (Placement(transformation(extent={{14,-14},{-14,14}},
        rotation=-90,
        origin={206,68})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    UseT=true,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=0.01,
    p=100000,
    T_0=341.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,144})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    h=140e3)                            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={106,82})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                 annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=0,
        origin={150,143})));
  Modelica.Blocks.Sources.Constant Qeva1(k=225 + 273)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={125,203})));
  BrickerISES.Components.HX_singlephase HxOilWater(
    redeclare package MediumSs =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    A_ps=6.4,
    A_ss=6.4,
    U_ps=2500,
    U_ss=3000,
    steadystate_T_wall=true,
    redeclare package MediumPs = ThermoCycle.Media.Water,
    T_wall_fixed=false,
    MdotNom_ss=0.01,
    M_ps=2,
    MdotNom_ps=10.4,
    M_ss=2,
    p_ps_start=400000,
    T_ps_su_start=342.15,
    T_ps_ex_start=343.15,
    p_ss_start=100000,
    T_ss_su_start=348.15,
    T_ss_ex_start=343.15) annotation (Placement(transformation(
        extent={{-18,23},{18,-23}},
        rotation=90,
        origin={208,113})));
  Modelica.Fluid.Sensors.MassFlowRate Mflow_recirculation(redeclare package
      Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
        extent={{17,-19},{-17,19}},
        rotation=-90,
        origin={215,19})));
  BrickerISES.Components.ORC.HEX Ad_chiller(
    redeclare package Medium = ThermoCycle.Media.Water,
    pstart=400000,
    Tstart_inlet=343.15,
    Tstart_outlet=333.15) annotation (Placement(transformation(
        extent={{-15,14},{15,-14}},
        rotation=90,
        origin={320,95})));
  BrickerISES.Components.ORC.HEX Cooling_tower(
    redeclare package Medium = ThermoCycle.Media.Water,
    pstart=400000,
    Tstart_inlet=333.15,
    Tstart_outlet=333.15) annotation (Placement(transformation(
        extent={{-17,-14},{17,14}},
        rotation=-90,
        origin={322,29})));
  Modelica.Blocks.Sources.Constant Qeva2(k=-387000)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={357,119})));
  Modelica.Fluid.Sensors.Temperature Temp_in_chiller(redeclare package Medium
      = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{210,172},{174,196}})));
  Modelica.Fluid.Sensors.Temperature Temp_out_chiller(redeclare package Medium
      =        ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{316,74},{280,98}})));
  Modelica.Fluid.Sensors.Temperature Temp_out_cooling_tower(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{396,-10},{360,14}})));
  ThermoCycle.Components.Units.ControlSystems.PID pID_pump(
    PVmin=0,
    PVmax=440,
    Td=0,
    Ti=0.2,
    CSstart=1,
    CSmin=10.41,
    CSmax=15,
    Kp=0.1) annotation (Placement(transformation(
        extent={{9.5,7.5},{-9.5,-7.5}},
        rotation=-90,
        origin={257.5,-36.5})));
  Modelica.Blocks.Sources.Constant const5(k=60 + 273)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={237,-107})));
  ThermoCycle.Components.Units.ControlSystems.PID pID_HEX(
    PVmin=0,
    PVmax=440,
    Td=0,
    Ti=0.2,
    CSstart=1,
    CSmax=4,
    Kp=0.1,
    CSmin=1) annotation (Placement(transformation(
        extent={{9.5,7.5},{-9.5,-7.5}},
        rotation=180,
        origin={25.5,189.5})));
  Modelica.Blocks.Sources.Constant const1(k=68.89 + 273)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-25,191})));
  Modelica.Fluid.Sensors.Temperature Temp_water_junction(redeclare package
      Medium = ThermoCycle.Media.Water)
    annotation (Placement(transformation(extent={{266,88},{230,112}})));
  BrickerISES.Components.Control.WatTBa watTBa
    annotation (Placement(transformation(extent={{428,22},{372,82}})));
  Modelica.Blocks.Sources.Constant Qeva3(k=-1)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={391,143})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium = ThermoCycle.Media.Water,
    V_tank=5,
    p_ext=400000,
    Tstart=333.15,
    pstart=400000,
    L_lstart=0.7,
    Mdotnom=10.4)
    annotation (Placement(transformation(extent={{276,-16},{296,4}})));
equation
  connect(Mflow_oil.port_a,sourceMdot_oil. flangeB) annotation (Line(
      points={{-88,84},{-124,84},{-124,71.4},{-180,71.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.InletEvap,Mflow_oil. port_b) annotation (Line(
      points={{-64,42.4},{-78,42.4},{-78,60},{-88,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_oil.port_a,Temp_HEX_oil_inlet. port) annotation (Line(
      points={{-88,84},{-88,102},{-100,102}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.OutletEvap,sinkP1. flangeB) annotation (Line(
      points={{-64,34},{-78,34},{-78,-43.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_Mdot,m_oil. y) annotation (Line(
      points={{-171.6,92.4},{-164,92.4},{-164,111},{-154.5,111}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot_oil.in_T,Tin_oil. y) annotation (Line(
      points={{-171.6,84.28},{-164,84.28},{-164,89},{-154.5,89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qcond.y, ORCunitHex.QcondORC) annotation (Line(
      points={{-39,97.5},{-39,72},{-42.7833,72},{-42.7833,46.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qeva.y, ORCunitHex.QevapORC) annotation (Line(
      points={{-59,97.5},{-59,72},{-54.5,72},{-54.5,46.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Temp_HEX_oil_outlet.port, ORCunitHex.OutletEvap) annotation (Line(
      points={{-122,-8},{-122,-18},{-88,-18},{-88,34},{-64,34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Temp_ORC_cond_inlet.port, ORCunitHex.InletCond) annotation (Line(
      points={{-2,-76},{-2,-42},{-27.9,-42},{-27.9,14.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond, Temp_ORC_cond_outlet.port) annotation (Line(
      points={{-27.9,24},{-24,24},{-24,54},{24,54},{24,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.outlet, ORCunitHex.InletCond) annotation (Line(
      points={{30.16,-1.64},{16,-1.64},{16,14.8},{-27.9,14.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot.inlet, Mflow_cond.port_b) annotation (Line(
      points={{48.08,-11.3},{78,-11.3},{78,-7},{86,-7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ORCunitHex.Outletcond, pump_Mdot2.inlet) annotation (Line(
      points={{-27.9,24},{14,24},{14,48},{206.7,48},{206.7,57.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
      points={{115,144},{115,143},{143,143}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.in_T, Qeva1.y) annotation (Line(
      points={{105.8,150},{106,150},{106,197.5},{125,197.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump_Mdot2.outlet, HxOilWater.InFlowPs) annotation (Line(
      points={{216.36,75.84},{214,75.84},{214,93.2},{207.54,93.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowPs, Mflow_chiller.port_a) annotation (Line(
      points={{207.54,132.8},{208,132.8},{208,158},{226,158},{226,159},{242,
          159}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_HEX_water.port_b, HxOilWater.InFlowSs) annotation (Line(
      points={{157,143},{224.56,143},{224.56,129.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HxOilWater.OutFlowSs, sinkP.flangeB) annotation (Line(
      points={{190.98,96.8},{106,96.8},{106,90.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump_Mdot2.inlet, Mflow_recirculation.port_b) annotation (Line(
      points={{206.7,57.92},{214,57.92},{214,36},{215,36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_chiller.port_b, Ad_chiller.inlet_fl2) annotation (Line(
      points={{276,159},{322,159},{322,110},{321.96,110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Cooling_tower.outlet_fl2, Ad_chiller.outlet_fl2) annotation (Line(
      points={{323.68,45.66},{324,45.66},{324,80.3},{321.68,80.3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation.port_a, Mflow_cond.port_a) annotation (Line(
      points={{215,2},{215,-7},{120,-7}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Ad_chiller.u, Qeva2.y) annotation (Line(
      points={{331.2,95},{358,95},{358,113.5},{357,113.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mflow_chiller.port_a, Temp_in_chiller.port) annotation (Line(
      points={{242,159},{218,159},{218,172},{192,172}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Ad_chiller.outlet_fl2, Temp_out_chiller.port) annotation (Line(
      points={{321.68,80.3},{310,80.3},{310,74},{298,74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Cooling_tower.inlet_fl2, Temp_out_cooling_tower.port) annotation (
      Line(
      points={{323.96,12},{344,12},{344,-10},{378,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pID_pump.CS, pump_Mdot2.flow_in) annotation (Line(
      points={{257.5,-26.43},{257.5,63.52},{217.2,63.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, pID_pump.SP) annotation (Line(
      points={{237,-101.5},{237,-88.75},{254.5,-88.75},{254.5,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID_pump.PV, Temp_out_chiller.T) annotation (Line(
      points={{260.5,-46},{260.5,-88},{278,-88},{278,86},{285.4,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, pID_HEX.SP) annotation (Line(
      points={{-19.5,191},{-3.75,191},{-3.75,192.5},{16,192.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID_HEX.PV, Temp_in_chiller.T) annotation (Line(
      points={{16,186.5},{6,186.5},{6,184},{4,184},{4,168},{166,168},{166,184},
          {179.4,184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID_HEX.CS, sourceMdot.in_Mdot) annotation (Line(
      points={{35.57,189.5},{100,189.5},{100,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HxOilWater.InFlowPs, Temp_water_junction.port) annotation (Line(
      points={{207.54,93.2},{222,93.2},{222,88},{248,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(watTBa.Qres, Cooling_tower.u) annotation (Line(
      points={{370.88,56.2},{348,56.2},{348,29},{333.2,29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qeva2.y, watTBa.Qbuilding) annotation (Line(
      points={{357,113.5},{357,98},{430.52,98},{430.52,75.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(watTBa.Qhx, HxOilWater.Q_hx) annotation (Line(
      points={{430.24,29.2},{436,29.2},{436,-106},{168,-106},{168,126},{
          196.04,126},{196.04,125.24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qcond.y, watTBa.QORC) annotation (Line(
      points={{-39,97.5},{-39,72},{4,72},{4,-64},{486,-64},{486,52},{430.24,
          52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qeva3.y, watTBa.ControlSignal) annotation (Line(
      points={{391,137.5},{391,114},{405.04,114},{405.04,80.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Cooling_tower.inlet_fl2, Tank1.OutFlow) annotation (Line(
      points={{323.96,12},{302,12},{302,-14.4},{295.8,-14.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Mflow_recirculation.port_a, Tank1.InFlow) annotation (Line(
      points={{215,2},{238,2},{238,-14.4},{276.2,-14.4}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-200,-160},{460,300}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-200,
            -160},{460,300}})));
end Test6;
