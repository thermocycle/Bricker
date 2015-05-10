within BrickerISES.Tests.AD;
model Test_Expansion_Tank_Second_Version_20012014
BrickerISES.Components.Tank.Expansion_Tank_MaxPressure Expansion_Tank(
    L_lstart=0.6,
    Mdotnom=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    H_D=2.5,
    V_tank=5,
    p_max_tank=500000,
    Tstart=313.15,
    pstart=200000)
    annotation (Placement(transformation(extent={{-34,-14},{18,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Mdot_0=2,
    p=500000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-98,-12},{-78,8}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    h_0=167691,
    Mdot_0=1,
    pstart=400000)
    annotation (Placement(transformation(extent={{70,-38},{90,-18}})));
equation
  connect(sourceMdot.flangeB, Expansion_Tank.InFlow) annotation (Line(
      points={{-79,-2},{-52.76,-2},{-52.76,-9.56},{-34,-9.56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Expansion_Tank.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{17.48,-10.3},{34,-10.3},{34,-28},{70.2,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_Expansion_Tank_Second_Version_20012014;
