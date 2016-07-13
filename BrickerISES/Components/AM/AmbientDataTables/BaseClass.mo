within BrickerISES.Components.AM.AmbientDataTables;
package BaseClass
  partial package AmbientDataTablePartialPackage

    constant Integer initialYear;
    constant Integer initialMonth;
    constant Integer initialDay;
    constant Integer initialHour;
    constant Integer initialMinute;
    constant Real    initialSecond;
    constant Real[:,:] table;
                                 // time, dni, ghi, dhi, T, wind speed, wind direction, relative humidity, atmospheric pressure

  end AmbientDataTablePartialPackage;

  partial package AmbientDataTablePartialPackageSimplified

    constant Real[:,:] table;
                                 // time, dni, ghi, dhi, T, wind speed, wind direction, relative humidity, atmospheric pressure

  end AmbientDataTablePartialPackageSimplified;
end BaseClass;
