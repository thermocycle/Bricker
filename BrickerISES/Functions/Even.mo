within BrickerISES.Functions;
function Even
  "checks wether a given integer is even or odd numbered -> returns true for even and false or odd"
  input Integer number;
  output Boolean isEven;
protected
 Integer half;
 Integer aux_number;
algorithm

   half := integer(number/2);
   aux_number := half*2;

   if aux_number == number then
    isEven := true;
   else
    isEven := false;
   end if;

end Even;
