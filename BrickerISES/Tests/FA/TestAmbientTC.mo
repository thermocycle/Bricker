within BrickerISES.Tests.FA;
model TestAmbientTC "Text ambient customized for ThermoCycle Library"

  Components.ExternalAmbientTC.AmbientData ambientData(
    initialMonth=03,
    initialDay=21,
    redeclare model AmbientConditionsSource =
        Bricker.Components.AM.AmbientConditions_Table (redeclare package
          AmbientDataTable =
            Bricker.Components.AM.AmbientDataTables.AmbientDataTable_SEGS_2008_03_21_to_27),
    trackingAxisOrientation=1.5)
    annotation (Placement(transformation(extent={{-20,18},{0,38}})));

  annotation (experiment(StopTime=600000), __Dymola_experimentSetupOutput);
end TestAmbientTC;
