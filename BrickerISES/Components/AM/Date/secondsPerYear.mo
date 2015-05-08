within BrickerISES.Components.AM.Date;
function secondsPerYear
  input Integer year;
  output Real seconds;
algorithm
  if (isLeapYear(year)) then
    seconds := 366 * 24 * 60 * 60;
  else
    seconds := 365 * 24 * 60 * 60;
  end if;
end secondsPerYear;
