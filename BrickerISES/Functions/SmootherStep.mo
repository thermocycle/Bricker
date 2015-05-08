within BrickerISES.Functions;
function SmootherStep
  "Ken Perlin's proposed smoothstep fuction which has zero 1st and 2nd order derivatives at t=0 and t=1"
//Returns 0.0 if x <= edge0 and 1.0 if x >= edge1 and performs smooth Hermite interpolation between 0 and 1 when edge0 < x < edge1
  input Real edge0;
  input Real edge1;
  input Real xInput;
  output Real u;
protected
  Real x;
algorithm
    x := min(1,max(0,(xInput - edge0)/(edge1 - edge0)));
    u:= x*x*x*(x*(x*6 - 15) + 10);
end SmootherStep;
