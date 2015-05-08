within BrickerISES.Components.AM;
model FixedAmbient

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

  parameter Integer initialYear =   2008;
  parameter Integer initialMonth =  7;
  parameter Integer initialDay =    8;
  parameter Integer initialHour =   0;
  parameter Integer initialMinute = 0;
  parameter Real    initialSecond = 0;

  parameter Integer timeZone = 2;
  parameter Real longitude =   -5.59;
  parameter Real latitude =    37.23;

  parameter SI.Irradiance dni = 800 "Direct Normal Insolation (W/m2)";
  parameter SI.Irradiance ghi = 0 "Global Horizontal Insolation (W/m2)";
  parameter SI.Irradiance dhi = 0 "Diffuse Horizontal Insolation (W/m2)";
  parameter SI.Temperature temperature = 293.15 "Ambient temperature (K)";
  parameter SI.Velocity windSpeed = 0 "Wind speed (m/s)";
  parameter SI.Angle windDirection = 0 "Wind direction (from N to E)";
  parameter Real relativeHumidity = 15 "Relative Humidity (%)";
  parameter SI.Pressure pressure = 101325 "Atmospheric pressure (Pa)";

  output SunPosition sun
    "Sun Position [zenith, declination, hourangle, azimuth]";
  output Date date "Local Date [year, month, day, hour, minute, second]";

equation
  sun.zenith      = 0;
  sun.declination = 0;
  sun.hourangle   = 0;
  sun.azimuth     = 0;

  date.year   = 0;
  date.month  = 0;
  date.day    = 0;
  date.hour   = 0;
  date.minute = 0;
  date.second = 0;

end FixedAmbient;
