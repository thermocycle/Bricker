within BrickerISES.Components.AM;
model Ambient "Model the ambient condition"
  import SI = Modelica.SIunits;

  encapsulated record Date
    Real year;
    Real month;
    Real day;
    Real hour;
    Real minute;
    Real second;
  end Date;

  encapsulated record SunPosition
    Real zenith;
    Real declination;
    Real hourangle;
    Real azimuth;
  end SunPosition;

  // BUG: OpenModelica parameter assignment problem with external objects
  final parameter Integer initialYear =   2008;//Do not change while using AmbientConditions_Table or AmbientConditions_File
  parameter Integer initialMonth =  6;
  parameter Integer initialDay =    21;
  parameter Integer initialHour =   0;
  parameter Integer initialMinute = 0;
  parameter Real    initialSecond = 0;

  parameter Integer timeZone = 8;
  parameter Real longitude =   -114.97555;
  parameter Real latitude =    35.8083;

  output SI.Irradiance dni "Direct Normal Insolation (W/m2)";
  output SI.Irradiance ghi "Global Horizontal Insolation (W/m2)";
  output SI.Irradiance dhi "Diffuse Horizontal Insolation (W/m2)";
  output SI.Temperature temperature "Ambient temperature (K)";
  output SI.Velocity windSpeed "Wind speed (m/s)";
  output SI.Angle windDirection "Wind direction (from N to E)";
  output Real relativeHumidity "Relative Humidity (%)";
  output SI.Pressure pressure "Atmospheric pressure (Pa)";

  output SunPosition sun
    "Sun Position [zenith, declination, hourangle, azimuth]";
  output Date date "Local Date [year, month, day, hour, minute, second]";

  replaceable model AmbientConditionsSource =
      BrickerISES.Components.AM.AmbientConditions_Table constrainedby
    BrickerISES.Components.AM.BaseClass.AmbientConditionsSourcePartialModel
                                              annotation(choicesAllMatching=true);

protected
  AmbientConditionsSource ambient(final initialYear =   initialYear,
                                  final initialMonth =  initialMonth,
                                  final initialDay =    initialDay,
                                  final initialHour =   initialHour,
                                  final initialMinute = initialMinute,
                                  final initialSecond = initialSecond,
                                  final longitude =     longitude,
                                  final latitude =      latitude,
                                  final timeZone =      timeZone);

equation
  dni = if noEvent(sun.zenith < BrickerISES.Constants.pi/2) then max(ambient.dni,
    0) else 0;
  ghi              = max(ambient.ghi,0);
  dhi              = max(ambient.dhi,0);
  temperature      = ambient.temp;
  windSpeed        = max(ambient.ws,0);
  windDirection    = ambient.wd;
  relativeHumidity = min(max(ambient.rh,0),100);
  pressure         = max(ambient.atmp,0);

  sun.zenith      = ambient.sunPos[1];
  sun.declination = ambient.sunPos[2];
  sun.hourangle   = ambient.sunPos[3];
  sun.azimuth     = ambient.sunPos[4];

  date.year   = ambient.date[1];
  date.month  = ambient.date[2];
  date.day    = ambient.date[3];
  date.hour   = ambient.date[4];
  date.minute = ambient.date[5];
  date.second = ambient.date[6];
end Ambient;
