within BrickerISES.Components.AM;
model AmbientConditions_External

  extends AmbientConditionsSourcePartialModel;
  parameter String  filename =      "amr.dat";

class AmbientConditionsTable
  extends ExternalObject;

  function constructor
    input Integer startYear;
    input Integer startMonth;
    input Integer startDay;
    input Integer startHour;
    input Integer startMinute;
    input Real    startSecond;
    input String  filename;
    input Integer timeZone;
    input Real    longitude;
    input Real    latitude;
    output AmbientConditionsTable conditions;
    external "C" conditions=  initAmbientConditions(startYear, startMonth, startDay, startHour, startMinute, startSecond, filename, timeZone, longitude, latitude) annotation(Library="AmbientConditions");
    //annotation(Library="AmbientConditions", LibraryDirectory="file:///$(STEPHANIELIBRARY_EXTERNAL)");
  end constructor;

  function destructor
    input AmbientConditionsTable conditions;
    external "C" clearAmbientConditions(conditions) annotation(Library="AmbientConditions");
  end destructor;
end AmbientConditionsTable;

function interpolateAmbientConditions
  input AmbientConditionsTable conditions;
  input Real t;
  output Real dni;
  output Real ghi;
  output Real dhi;
  output Real temp;
  output Real ws;
  output Real wd;
  output Real rh;
  output Real atmp;
  output Real date[6];
  output Real sunPos[4];

  external "C" interpolateAmbientConditions(conditions, t, dni, ghi, dhi, temp, ws, wd, rh, atmp, date, sunPos) annotation(Library="AmbientConditions");
end interpolateAmbientConditions;

protected
  AmbientConditionsTable conditions = AmbientConditionsTable(initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, filename, timeZone, longitude, latitude);

equation
  (dni, ghi, dhi, temp, ws, wd, rh, atmp, date, sunPos) = interpolateAmbientConditions(conditions, time);

  //Check this!! Just added to balance the model. If gmt is required, proper calculation should be added.
  gmt = date;

end AmbientConditions_External;
