within BrickerISES.Components.AM;
model AmbientConditions_File "Take the ambient condition from a text file"
  extends BaseClass.AmbientConditionsSourcePartialModel;

  parameter Integer fileInitialYear = initialYear;
  parameter Integer fileInitialMonth = initialMonth;
  parameter Integer fileInitialDay = initialDay;
  parameter Integer fileInitialHour = initialHour;
  parameter Integer fileInitialMinute = initialMinute;
  parameter Real    fileInitialSecond = initialSecond;

  parameter String fileName =  "AMR-Sevilla-Modelica.txt";

protected
  Modelica.Blocks.Tables.CombiTable1Ds table(final tableOnFile = true,
                                             final table =       [0, 0, 0, 0, 0, 0, 0, 0, 0],
                                             final fileName =    fileName,
                                             final tableName =   "ambient",
                                             final columns =     2:9,
                                             final smoothness =  Modelica.Blocks.Types.Smoothness.ContinuousDerivative);

  final parameter Real timeOffset = Date.timeDifference(fileInitialYear, fileInitialMonth, fileInitialDay, fileInitialHour, fileInitialMinute, fileInitialSecond,
                                                        initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond,
                                                        false);

equation
  assert( timeOffset >= 0, "Simulation time outside ambient data table limits: Check the initial date and simulation time");

  table.u = time + timeOffset;

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

end AmbientConditions_File;
