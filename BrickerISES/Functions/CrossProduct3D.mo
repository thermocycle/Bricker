within BrickerISES.Functions;
function CrossProduct3D "Cross product for 3D vectors"
  input Real[3] v1;
  input Real[3] v2;
  output Real[3] crossProduct;
algorithm
    crossProduct:={-v1[3] * v2[2] + v1[2] * v2[3], v1[3] * v2[1] - v1[1] * v2[3], -v1[2] * v2[1] + v1[1] * v2[2]};
end CrossProduct3D;
