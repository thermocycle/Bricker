within BrickerISES.Components.AM.Utilities;
function JulianDay
   input Integer year;
   input Integer month;
   input Integer day;
   input Integer hours;
   input Integer minutes;
   input Real seconds;
   output Real julianday;
protected
   Real decimalhours;
   Real aux1;
   Real aux2;
   Integer intaux1;
   Integer intaux2;
algorithm
   decimalhours:=hours + (minutes + seconds / 60) / 60;
   intaux1:=integer((month - 14) / 12);
   intaux2:=integer((1461 * (year + 4800 + intaux1)) / 4 + (367 * (month - 2 - 12 * intaux1)) / 12 - (3 * (year + 4900 + intaux1)) / 100 / 4 + day - 32075);
   julianday:=intaux2 - 0.5 + decimalhours / 24;
end JulianDay;
