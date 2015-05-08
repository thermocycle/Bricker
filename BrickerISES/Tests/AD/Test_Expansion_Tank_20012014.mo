within BrickerISES.Tests.AD;
model Test_Expansion_Tank_20012014

  Components.Tank.Expansion_Tank Expansion_Tank(
    L_lstart=0.6,
    Mdotnom=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    H_D=2,
    V_tank=10,
    Tstart=313.15,
    pstart=200000,
    M_gas=0.001)
    annotation (Placement(transformation(extent={{-34,-14},{18,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Mdot_0=10,
    p=200000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    Mdot_0=2,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    h_0=167691,
    pstart=400000)
    annotation (Placement(transformation(extent={{68,-38},{88,-18}})));
equation
  connect(sourceMdot.flangeB, Expansion_Tank.InFlow) annotation (Line(
      points={{-71,20},{-52.76,20},{-52.76,-9.56},{-34,-9.56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Expansion_Tank.OutFlow, sinkMdot.flangeB) annotation (Line(
      points={{17.48,-10.3},{34,-10.3},{34,-28},{68.2,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_Expansion_Tank_20012014;
