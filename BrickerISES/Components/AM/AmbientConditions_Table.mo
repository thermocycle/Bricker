within BrickerISES.Components.AM;
model AmbientConditions_Table
  "Take the ambient condition from a Table implemented in Modelica"

  extends BaseClass.AmbientConditionsSourcePartialModel;

  /* Package to select the appropriate table */
  replaceable package AmbientDataTable =
      BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_NSO_2008_06_21
    constrainedby
    BrickerISES.Components.AM.AmbientDataTables.AmbientDataTablePartialPackage
                                         annotation(choicesAllMatching=true);

 /* Define the table as a CombiTable1Ds from the Modelica Standard library*/
protected
  Modelica.Blocks.Tables.CombiTable1Ds table(final tableOnFile = false,
                                             final table =       AmbientDataTable.table,
                                             final fileName =    "NoName",
                                             final tableName =   "ambient",
                                             final columns =     2:9,
                                             final smoothness =  Modelica.Blocks.Types.Smoothness.ContinuousDerivative);

final parameter Real timeOffset = Date.timeDifference(AmbientDataTable.initialYear, AmbientDataTable.initialMonth, AmbientDataTable.initialDay, AmbientDataTable.initialHour, AmbientDataTable.initialMinute, AmbientDataTable.initialSecond,
                                                        initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond,
                                                        false);
final parameter Real maxTime = AmbientDataTable.table[size(AmbientDataTable.table,1),1];

equation
  assert( timeOffset >= 0 and ( time + timeOffset)  < maxTime, "Simulation time outside ambient data table limits: Check the initial date and simulation time");

  table.u = time + timeOffset;

  /* Define the output variables based on the table values*/
  dni  = table.y[1];
  ghi  = table.y[2];
  dhi  = table.y[3];
  temp = table.y[4];
  ws   = table.y[5];
  wd   = table.y[6];
  rh   = table.y[7];
  atmp = table.y[8];

  (date[1], date[2], date[3],date[4], date[5], date[6]) = Utilities.NewDate(time, initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, 0);
  (gmt[1], gmt[2], gmt[3], gmt[4], gmt[5], gmt[6]) = Utilities.NewDate(time, initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, timeZone);
  (sunPos[1], sunPos[2], sunPos[3], sunPos[4]) = Utilities.CenerSP(gmt[1], gmt[2], gmt[3], gmt[4], gmt[5], gmt[6], longitude, latitude);

end AmbientConditions_Table;
