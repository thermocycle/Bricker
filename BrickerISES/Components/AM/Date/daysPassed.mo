within BrickerISES.Components.AM.Date;
function daysPassed
  "Days passed since beginning of year not including current day"
  input Integer year;
  input Integer month;
  input Integer day;
   output Integer passed;
algorithm
 passed := 0;
 for i in 1:month-1 loop
   passed := passed + daysInMonth(year, i);
 end for;
 passed := passed + day - 1;
end daysPassed;
