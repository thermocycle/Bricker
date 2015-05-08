within BrickerISES.Tests.AD.TestComponents.BiomassSystem.ORC_Cycle;
model _ORC

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=2.5,
    p=100000,
    T_0=513.15)
    annotation (Placement(transformation(extent={{-74,40},{-54,60}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=2500000)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  Components.ORC.ORC_5kWe_R245fa_v5 oRC_5kWe_R245fa_v5_1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP)
    annotation (Placement(transformation(extent={{16,-2},{36,18}})));
equation
  connect(sourceMdot1.flangeB, oRC_5kWe_R245fa_v5_1.InFlowORC) annotation (Line(
      points={{-55,50},{23.5,50},{23.5,15.9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRC_5kWe_R245fa_v5_1.OutFlowORC, sinkP1.flangeB) annotation (Line(
      points={{23.4,3.4},{23.4,-20},{-6,-20},{-6,-50},{31.6,-50}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end _ORC;
