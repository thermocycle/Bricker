within Bricker.Tests.FA;
model TestAmbient

  Components.ExternalAmbient.AmbientData ambientData(
    initialDay=21,
    initialMonth=03,
    redeclare model AmbientConditionsSource =
        StephanieLibrary.AM.AmbientConditions_Table (redeclare package
          AmbientDataTable =
            StephanieLibrary.AM.AmbientDataTables.AmbientDataTable_SEGS_2008_03_21_to_27))
    annotation (Placement(transformation(extent={{-20,18},{0,38}})));
  annotation (experiment(StopTime=600000), __Dymola_experimentSetupOutput);
end TestAmbient;
