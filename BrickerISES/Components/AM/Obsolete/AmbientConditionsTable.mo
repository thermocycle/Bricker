within BrickerISES.Components.AM.Obsolete;
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
