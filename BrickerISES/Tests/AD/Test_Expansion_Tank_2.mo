within BrickerISES.Tests.AD;
model Test_Expansion_Tank_2

  Components.Tank.Expansion_Tank Expansion_Tank(
    L_lstart=0.6,
    Mdotnom=3,
    H_D=2,
    V_tank=10,
    M_gas=4,
    redeclare package Medium = CoolProp2Modelica.Media.WaterIF95_FP,
    Tstart=313.15,
    pstart=200000)
    annotation (Placement(transformation(extent={{-14,2},{38,76}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=3,
    redeclare package Medium = CoolProp2Modelica.Media.WaterIF95_FP,
    p=200000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-84,8},{-64,28}})));
equation
  connect(sourceMdot.flangeB, Expansion_Tank.InFlow) annotation (Line(
      points={{-65,18},{-52.76,18},{-52.76,6.44},{-14,6.44}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})));
end Test_Expansion_Tank_2;
