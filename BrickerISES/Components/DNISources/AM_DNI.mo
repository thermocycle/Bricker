within BrickerISES.Components.DNISources;
model AM_DNI "Take the DNI values from a Table implemented in Modelica"

  extends AM.BaseClass.AmbientConditionsSourcePartialModelSimplified;

  /* Package to select the appropriate table */
  replaceable package AmbientDataTable =
   BrickerISES.Components.AM.AmbientDataTables.BaseClass.AmbientDataTablePartialPackageSimplified
    constrainedby
    BrickerISES.Components.AM.AmbientDataTables.BaseClass.AmbientDataTablePartialPackageSimplified
                                         annotation(choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput DNI
  annotation (Placement(transformation(extent={{94,-10},{114,12}}),
        iconTransformation(extent={{90,-12},{114,12}})));
 /* Define the table as a CombiTable1Ds from the Modelica Standard library*/
protected
  Modelica.Blocks.Tables.CombiTable1Ds table(final tableOnFile = false,
                                             final table =       AmbientDataTable.table,
                                             final fileName =    "NoName",
                                             final tableName =   "ambient",
                                             final columns =     2:3,
                                             final smoothness =  Modelica.Blocks.Types.Smoothness.ContinuousDerivative);

equation
/* Define the input values for the CombiTable1Ds */
table.u = time;

/* Define the output variables based on the table values*/
  dni  = table.y[1];
  ghi  = 0;
  dhi  = 0;
  temp = 0;
  ws   = 0;
  wd   = 0;
  rh   = 0;
  atmp = 0;
  DNI = dni;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
                   Ellipse(extent={{-90,-84},{78,76}}, lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
                                   Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{-72,40},{68,-44}},
          lineColor={0,0,255},
          textString="DNI"),
        Text(
          extent={{-40,106},{36,60}},
          lineColor={0,0,255},
          textString="AMBIENT DATA",
          textStyle={TextStyle.Bold})}));
end AM_DNI;
