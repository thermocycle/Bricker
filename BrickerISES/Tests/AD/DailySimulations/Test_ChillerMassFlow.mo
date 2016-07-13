within BrickerISES.Tests.AD.DailySimulations;
model Test_ChillerMassFlow
  Components.GeneralCombiTableModel.GeneralCombiTable generalCombiTable(
      redeclare package AmbientDataTable =
        BrickerISES.Components.GeneralCombiTableModel.Tables.WaterMassFlowDataTable_3Sept)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  annotation (experiment(StartTime=-5000, StopTime=86400),
      __Dymola_experimentSetupOutput);
end Test_ChillerMassFlow;
