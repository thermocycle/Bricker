within BrickerISES.Components.AM.Date;
function isLeapYear
  input Integer year;
  output Boolean leapYear;
algorithm
if (mod(year, 400) == 0) then
  leapYear := true;
elseif (mod(year, 100) == 0) then
  leapYear := false;
elseif (mod(year, 4) == 0) then
  leapYear := true;
else
 leapYear := false;
 end if;
end isLeapYear;
