within BrickerISES.Tests.AD.TestComponents.ControlStrategy;
model Test_Sources
  Components.SourceComp.BrickerSource brickerSource(redeclare package
      AmbientDataTable = BrickerISES.Components.SourceComp.Tables.Summer_0707)
    annotation (Placement(transformation(extent={{-36,28},{22,-22}})));
  annotation (experiment(StopTime=86400), __Dymola_experimentSetupOutput);
end Test_Sources;
