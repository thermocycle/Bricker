within BrickerISES.Tests.AD;
model Test_OpenTank

  Components.Tank.Open_Tank open_Tank(
    Mdotnom=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    H_D=2,
    V_tank=10,
    p_ext=200000,
    Tstart=313.15,
    pstart=200000,
    L_lstart=0.6)
    annotation (Placement(transformation(extent={{-26,-14},{26,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    p=200000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-80,12},{-60,32}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    h_0=167691,
    Mdot_0=3,
    pstart=400000)
    annotation (Placement(transformation(extent={{68,-38},{88,-18}})));
equation
  connect(sourceMdot.flangeB, open_Tank.InFlow) annotation (Line(
      points={{-61,22},{-58,22},{-58,0.06},{-26.52,0.06}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(open_Tank.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{25.48,-1.42},{34,-1.42},{34,-24},{68.2,-24},{68.2,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}}), graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})));
end Test_OpenTank;
