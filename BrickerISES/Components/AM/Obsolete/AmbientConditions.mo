within BrickerISES.Components.AM.Obsolete;
model AmbientConditions
  parameter Integer initialYear =   2008;
  parameter Integer initialMonth =  1;
  parameter Integer initialDay =    1;
  parameter Integer initialHour =   0;
  parameter Integer initialMinute = 0;
  parameter Real    initialSecond = 0;
  parameter String  filename =      "amr.dat";

  parameter Integer timeZone = 8;
  parameter Real longitude =   -114.976;
  parameter Real latitude =    35.8083;

  output SI.Irradiance dni "Direct Normal Insolation (W/m2)";
  output SI.Irradiance ghi "Direct Normal Insolation (W/m2)";
  output SI.Irradiance dhi "Direct Normal Insolation (W/m2)";
  output SI.Temperature temp "Ambient temperature (K)";
  output SI.Velocity ws "Wind speed (m/s)";
  output SI.Angle wd "Wind direction (from N to E)";
  output Real rh "Relative Humidity (%)";
  output SI.Pressure atmp "Atmospheric pressure (Pa)";
  output Real sunPos[4]
    "Sun Position [zenith, declination, hourangle, azimuth]";
  output Real date[6] "Date [year, month, day, hour, minute, second]";

protected
  AmbientConditionsTable conditions = AmbientConditionsTable(initialYear, initialMonth, initialDay, initialHour, initialMinute, initialSecond, filename, timeZone, longitude, latitude);

equation
  (dni, ghi, dhi, temp, ws, wd, rh, atmp, date, sunPos) = interpolateAmbientConditions(conditions, time);
end AmbientConditions;
