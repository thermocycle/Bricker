within BrickerISES.Tests.AD;
model Test_Expansion_Tank_OnePort_Min_Pressure_Charging_Valve

 BrickerISES.Components.Tank.Expansion_Tank_One_Port_Min_Pressure Expansion_Tank(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    H_D=2.5,
    V_tank=5,
    Mdotnom=2,
    L_lstart=0,
    Tstart=313.15,
    pstart=700000,
    p_min_tank=700000,
    T_gas=313.15)
    annotation (Placement(transformation(extent={{-22,-20},{30,54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Mdot_0=2,
    p=700000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-82,-76},{-62,-56}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot(redeclare package
      Medium = CoolProp2Modelica.Media.WaterTPSI_FP)
    annotation (Placement(transformation(extent={{28,-74},{48,-54}})));
  Components.Tank.ValveControl valveControl(
    Var_Max=0.5,
    Var_Min=0,
    Length=0.01,
    Mdot_start=2,
    redeclare package Medium = CoolProp2Modelica.Media.WaterIF95_FP,
    p_su_start=700000,
    T_su_start=313.15,
    DELTAp_start=30000) annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=-90,
        origin={1,-49})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    p0=700000,
    h=167691)
    annotation (Placement(transformation(extent={{98,-78},{118,-58}})));
equation
  connect(sourceMdot.flangeB, valveControl.InFlow) annotation (Line(
      points={{-63,-66},{-36,-66},{-36,-70},{1,-70},{1,-60.7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valveControl.OutFlow, Expansion_Tank.InFlow) annotation (Line(
      points={{1,-37.3},{1,-28},{4,-28},{4,-19.26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valveControl.InFlow, sensMdot.InFlow) annotation (Line(
      points={{1,-60.7},{0,-70},{34,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Expansion_Tank.Level, valveControl.ExternalInput) annotation (Line(
      points={{29.48,39.2},{44,39.2},{44,-49},{11.4,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensMdot.OutFlow, sinkP.flangeB) annotation (Line(
      points={{42,-68},{99.6,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})));
end Test_Expansion_Tank_OnePort_Min_Pressure_Charging_Valve;
