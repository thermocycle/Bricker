within BrickerISES.Functions;
function DotProduct3D "Dot product for 3D vectors"
  input Real[3] v1;
  input Real[3] v2;
  output Real dotProduct;
algorithm
    dotProduct:=v1[1]*v2[1] + v1[2]*v2[2] + v1[3]*v2[3];
end DotProduct3D;
