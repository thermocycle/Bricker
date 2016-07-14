within BrickerISES.Components.AM.Date;
function secondsPassed "Seconds passed since beginning of year"
  input Integer year;
  input Integer month;
  input Integer day;
  input Integer hour;
  input Integer minute;
  input Real second;
  output Real passed;
protected
  Real days;
algorithm
 days := daysPassed(year, month, day);
 passed := days * 60 * 60 * 24;
 passed := passed + hour * 60 * 60;
 passed := passed + minute * 60;
 passed := passed + second;
end secondsPassed;
