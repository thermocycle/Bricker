within BrickerISES.Tests.AD;
model Test_Expansion_Tank_OnePort

  Components.Tank.Expansion_Tank_One_Port Expansion_Tank(
    L_lstart=0.6,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    M_gas=4,
    H_D=2.5,
    V_tank=5,
    Tstart=313.15,
    pstart=200000,
    Mdotnom=2)
    annotation (Placement(transformation(extent={{-22,-20},{30,54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    p=200000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-80,-58},{-60,-38}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Mdot_0=1,
    h_0=167691,
    pstart=500000)
    annotation (Placement(transformation(extent={{68,-62},{88,-42}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensMdot(redeclare package
      Medium = CoolProp2Modelica.Media.WaterTPSI_FP)
    annotation (Placement(transformation(extent={{28,-58},{48,-38}})));
equation
  connect(sourceMdot.flangeB, Expansion_Tank.InFlow) annotation (Line(
      points={{-61,-48},{-46,-48},{-46,-50},{4,-50},{4,-19.26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, sensMdot.OutFlow) annotation (Line(
      points={{68.2,-52},{42,-52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensMdot.InFlow, Expansion_Tank.InFlow) annotation (Line(
      points={{34,-52},{24,-52},{24,-50},{4,-50},{4,-19.26}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})));
end Test_Expansion_Tank_OnePort;
