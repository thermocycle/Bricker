within BrickerISES.Components.AM.Date;
function daysInMonth "Days per month"
  input Integer year;
  input Integer month;
  output Integer days;
protected
 constant Integer[12] d = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
algorithm
 if ((month == 2) and
                     (isLeapYear(year))) then
   days := d[month] + 1;
 else
   days := d[month];
  end if;
end daysInMonth;
