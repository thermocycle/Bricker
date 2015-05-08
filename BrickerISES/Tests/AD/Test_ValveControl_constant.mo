within BrickerISES.Tests.AD;
model Test_ValveControl_constant
  Components.Tank.ValveControl valveControl(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Var_Max=0.5,
    Var_Min=0,
    Mdot_start=2,
    Length=0.01,
    p_su_start=700000,
    T_su_start=313.15,
    DELTAp_start=30000) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=-90,
        origin={-7,-4})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    p0=700000,
    T_0=313.15,
    UseT=true)
    annotation (Placement(transformation(extent={{-72,48},{-52,68}})));
  Modelica.Blocks.Sources.Step step(
    offset=0.3,
    startTime=20,
    height=0) annotation (Placement(transformation(extent={{36,22},{56,42}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    h=167691,
    p0=670000)
    annotation (Placement(transformation(extent={{30,-62},{50,-42}})));
equation
  connect(sourceP.flange, valveControl.InFlow) annotation (Line(
      points={{-52.6,58},{-7,58},{-7,13.1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(step.y, valveControl.ExternalInput) annotation (Line(
      points={{57,32},{64,32},{64,-4},{4.2,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP.flangeB, valveControl.OutFlow) annotation (Line(
      points={{31.6,-52},{-7,-52},{-7,-21.1}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end Test_ValveControl_constant;
