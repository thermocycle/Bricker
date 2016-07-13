within BrickerISES.Tests.AD.TestComponents;
model TestAmbient
  Components.DNISources.AM_DNI Winter(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysWinter)
    annotation (Placement(transformation(extent={{-56,20},{-36,40}})));
  Components.DNISources.AM_DNI Spring(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSpring)
    annotation (Placement(transformation(extent={{-56,-20},{-36,0}})));
  Components.DNISources.AM_DNI Summer(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-58,-58},{-38,-38}})));
  Components.DNISources.AM_DNI Autumn(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysAutumn)
    annotation (Placement(transformation(extent={{-58,-94},{-38,-74}})));
  Components.Chiller.TempertureHx_su tempertureHx_su
    annotation (Placement(transformation(extent={{2,44},{22,64}})));
end TestAmbient;
