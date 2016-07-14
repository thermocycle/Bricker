within BrickerISES.Functions;
function SmoothStep
  "Smoothstep: performs smooth Hermite interpolation between 0 and 1"
//Returns 0.0 if x <= edge0 and 1.0 if x >= edge1 and performs smooth Hermite interpolation between 0 and 1 when edge0 < x < edge1
  input Real edge0;
  input Real edge1;
  input Real xInput;
  output Real u;
protected
  Real x;
algorithm
    x := min(1,max(0,(xInput - edge0)/(edge1 - edge0)));
    u:= x*x*(3 - 2*x);
end SmoothStep;
