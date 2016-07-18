within BrickerISES.Sources;
model Data1Ds "Take the DNI values from a Table implemented in Modelica"

  extends Components.AM.BaseClass.AmbientConditionsSourcePartialModelSimplified;

  /* Package to select the appropriate table */
  replaceable package AmbientDataTable =
   BrickerISES.Components.AM.AmbientDataTables.BaseClass.AmbientDataTablePartialPackageSimplified
    constrainedby
    BrickerISES.Components.AM.AmbientDataTables.BaseClass.AmbientDataTablePartialPackageSimplified
                                         annotation(choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput OUTPUT annotation (Placement(
        transformation(extent={{94,-10},{114,12}}), iconTransformation(extent={{
            90,-12},{114,12}})));
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
  OutPut  = table.y[1];
  ghi  = 0;
  dhi  = 0;
  temp = 0;
  ws   = 0;
  wd   = 0;
  rh   = 0;
  atmp = 0;
  OUTPUT = OutPut;
//   ghi  = table.y[2];
//   dhi  = table.y[3];
//   temp = table.y[4];
//   ws   = table.y[5];
//   wd   = table.y[6];
//   rh   = table.y[7];
//   atmp = table.y[8];

//  (date[1], date[2], date[3],date[4], date[5], date[6]) = Utilities.NewDate(time, initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, 0);
//  (gmt[1], gmt[2], gmt[3], gmt[4], gmt[5], gmt[6]) = Utilities.NewDate(time, initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, timeZone);
//  (sunPos[1], sunPos[2], sunPos[3], sunPos[4]) = Utilities.CenerSP(gmt[1], gmt[2], gmt[3], gmt[4], gmt[5], gmt[6], longitude, latitude);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
                   Ellipse(extent={{-90,-84},{78,76}}, lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
                                   Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{-72,40},{68,-44}},
          lineColor={0,0,255},
          textString="DATA")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end Data1Ds;
