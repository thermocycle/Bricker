within BrickerISES.Components.AM.Date;
function timeDifference "Calculate time difference in seconds"
  input Integer year1;
  input Integer month1;
  input Integer day1;
  input Integer hour1;
  input Integer minute1;
  input Real    second1;
  input Integer year2;
  input Integer month2;
  input Integer day2;
  input Integer hour2;
  input Integer minute2;
  input Real    second2;
  input Boolean leapYears;
  output Real difference;
protected
  Real time1;
  Real time2;
  Integer y1;
  Integer y2;
  Real s;
algorithm
  if (leapYears == true) then
    y1 := year1;
    y2 := year2;
  else
    y1 := 1;
    y2 := 1;
  end if;
time1 := secondsPerYear(y1) - secondsPassed(y1, month1, day1, hour1, minute1, second1);
time2 := secondsPassed(y2, month2, day2, hour2, minute2, second2);

  difference := time1 + time2;

if (year1 == year2) then
 difference := difference - secondsPerYear(y1);
elseif (year1 < year2) then
 for i in year1 + 1 : year2 - 1 loop
   if (leapYears == true) then
     s := secondsPerYear(i);
   else
     s := secondsPerYear(y1);
   end if;
  difference := difference + s;
 end for;
elseif (year1 > year2) then
 for i in year2:year1 loop
   if (leapYears == true) then
     s := secondsPerYear(i);
   else
     s := secondsPerYear(y1);
   end if;
  difference := difference - s;
 end for;
  end if;
end timeDifference;
