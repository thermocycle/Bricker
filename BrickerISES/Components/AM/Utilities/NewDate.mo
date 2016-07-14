within BrickerISES.Components.AM.Utilities;
function NewDate
   input Real elapsedtime;
   input Integer initialyear;
   input Integer initialmonth;
   input Integer initialday;
   input Integer initialhour;
   input Integer initialminute;
   input Real initialsecond;
   input Integer timezone;
   output Real newyear;
   output Real newmonth;
   output Real newday;
   output Real newhour;
   output Real newminute;
   output Real newsecond;
protected
   parameter Real[12] daysinmonth = {31,28,31,30,31,30,31,31,30,31,30,31};
   Real aux;
   Real aux2;
algorithm
   aux:=elapsedtime / 86400;
   newday:=floor(aux);
   aux:=elapsedtime - newday * 86400;
   aux:=aux / 3600;
   newhour:=floor(aux);
   aux:=elapsedtime - newday * 86400 - newhour * 3600;
   aux:=aux / 60;
   newminute:=floor(aux);
   aux:=elapsedtime - newday * 86400 - newhour * 3600 - newminute * 60;
   newsecond:=aux + initialsecond;
   aux2:=0;
   if newsecond >= 60 then
     newsecond:=newsecond - 60;
     aux2:=1;
   end if;
   newminute:=newminute + initialminute + aux2;
   aux2:=0;
   if newminute >= 60 then
     newminute:=newminute - 60;
     aux2:=1;
   end if;
   newhour:=initialhour + newhour + aux2 + timezone;
   aux2:=0;
   if newhour >= 24 then
     newhour:=newhour - 24;
     aux2:=1;
   elseif newhour < 0 then
     newhour := newhour + 24;
     aux2 := -1;
   end if;
   newday:=initialday + newday + aux2;
   newmonth:=initialmonth;
   newyear:=initialyear;
   if (newday <= 0) then
     newmonth := newmonth - 1;
     if (newmonth <= 0) then
       newmonth := 12;
       newyear := newyear - 1;
     end if;
     newday := newday + daysinmonth[integer(newmonth)];
   end if;

   while (newday > daysinmonth[integer(newmonth)]) loop
     newday:=newday - daysinmonth[integer(newmonth)];
     newmonth:=newmonth + 1;
     if newmonth > 12 then
       newmonth:=1;
       newyear:=newyear + 1;
     end if;
     aux2:=1;
   end while;
end NewDate;
