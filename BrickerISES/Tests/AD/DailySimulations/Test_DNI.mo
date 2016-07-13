within BrickerISES.Tests.AD.DailySimulations;
model Test_DNI
  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-194,-148},{-180,-134}})));
  Components.DNISources.AM_DNI Summer(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
  Components.DNISources.AM_DNI Spring(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSpring)
    annotation (Placement(transformation(extent={{-42,20},{-22,40}})));
  Components.DNISources.AM_DNI Winter(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysWinter)
    annotation (Placement(transformation(extent={{-38,-20},{-18,0}})));
  Components.DNISources.AM_DNI Autumn(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysAutumn)
    annotation (Placement(transformation(extent={{-40,-62},{-20,-42}})));
  annotation (experiment(StopTime=259200), __Dymola_experimentSetupOutput);
end Test_DNI;
