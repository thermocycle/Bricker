within BrickerISES.Tests.AD.TestComponents.ControlStrategy;
model Test_WinterStrategy
  Modelica.Blocks.Logical.Hysteresis HystHoursMorning(
    uLow=7,
    uHigh=20,
    pre_y_start=false)
    annotation (Placement(transformation(extent={{26,70},{40,84}})));
  Components.SourceComp.BrickerSource brickerSource1(
                                                    redeclare package
      AmbientDataTable =
        BrickerISES.Components.SourceComp.Tables.Summer_0807_1507)
    annotation (Placement(transformation(extent={{-70,12},{-50,32}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{54,54},{68,68}})));
  Modelica.Blocks.Logical.And and2
    annotation (Placement(transformation(extent={{80,36},{94,50}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=7)
    annotation (Placement(transformation(extent={{18,16},{38,36}})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{48,18},{62,32}})));
equation
  connect(brickerSource1.Hours, HystHoursMorning.u) annotation (Line(
      points={{-49.8,13.6},{-28,13.6},{-28,77},{24.6,77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HystHoursMorning.y, not1.u) annotation (Line(
      points={{40.7,77},{52.35,77},{52.35,61},{52.6,61}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y, and2.u1) annotation (Line(
      points={{68.7,61},{74,61},{74,43},{78.6,43}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(brickerSource1.Hours, lessThreshold.u) annotation (Line(
      points={{-49.8,13.6},{2,13.6},{2,26},{16,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lessThreshold.y, not2.u) annotation (Line(
      points={{39,26},{44,26},{44,25},{46.6,25}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not2.y, and2.u2) annotation (Line(
      points={{62.7,25},{78.6,25},{78.6,37.4}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Test_WinterStrategy;
