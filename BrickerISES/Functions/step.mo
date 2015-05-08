within BrickerISES.Functions;
function step
  "Approximation of a general step, such that the characteristic is continuous and differentiable"
  input Real x;
  input Real y1 "Result for x > 0";
  input Real y2 "Result for x < 0";
  input Real x_small(min=0) = 1e-5
    "Approximation of step for -x_small <= x <= x_small";
  output Real y;
algorithm
  y := smooth(1, if x >  x_small then y1 else
                 if x < -x_small then y2 else
                 if x_small > 0 then (x/x_small)*((x/x_small)^2 - 3)*(y2-y1)/4 + (y1+y2)/2 else (y1+y2)/2);
end step;
