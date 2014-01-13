within Bricker;
package Functions "functions for AM"

function polyEval
    "Evaluate a poynomial of the form: y = c[1] + c[2] * x + c[3] * x^2 + .. + c[N] * x^(N-1)"
  input Real x;
  input Real c[:];
  output Real y;
algorithm
  y := c[1];
  for i in 2:size(c,1) loop
    y := y + c[i] * x^(i - 1);
  end for;
  annotation(derivative(zeroDerivative = c) = polyEval_der);
end polyEval;

function polyEval_der
    "Derivative of a poynomial of the form: y = c[1] + c[2] * x + c[3] * x^2 + .. + c[N] * x^(N-1)"
  input Real x;
  input Real c[:];
  input Real der_x;
  output Real der_y;
algorithm
  der_y := c[2] * der_x;
  for i in 3:size(c,1) loop
    der_y := der_y + (i - 1) * c[i] * x^(i - 2) * der_x;
  end for;
end polyEval_der;

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

function HomotopyFactor
    "Returns the current homotopy factor for the given transition range and transition variable - homotopy factor varies between 1 and zero"
  input Real transitionVariable "homotopy transition variable";
  input Real transitionRangeLowerLimit
      "If transition variable is below that limit the homotopy factor equals 1 -> in transition region smooth transition between 1 and zero";
  input Real transitionRangeUpperLimit
      "If transition variable is above that limit the homotopy factor equals 0 -> in transition region smooth transition between 1 and zero";
  output Real homotopyFactor "either 1, zero or smooth transition between them";
algorithm

   // regFun3_Only_y input/output:
   // input Real x "Abscissa value";                              -> transitionVariable
   // input Real x0 "Lower abscissa value";                       -> transitionRangeLowerLimit
   // input Real x1 "Upper abscissa value";                       -> transitionRangeUpperLimit
   // input Real y0 "Ordinate value at lower abscissa value";     -> 1 (below transition range homotopy factor equals 1)
   // input Real y1 "Ordinate value at upper abscissa value";     -> 0 (above transition range homotopy factor equals 0)
   // input Real y0d "Derivative at lower abscissa value";        -> 0 (horizontal tangent)
   // input Real y1d "Derivative at upper abscissa value";        -> 0 (horizontal tangent)

  homotopyFactor := smooth(1, if transitionVariable < transitionRangeLowerLimit then 1 else
                              if transitionVariable > transitionRangeUpperLimit then 0 else
                              StephanieLibrary.Fluid.Utilities.regFun3_Only_y(transitionVariable,transitionRangeLowerLimit,transitionRangeUpperLimit,1,0,0,0));

end HomotopyFactor;

function HomotopyFactorZeroOne
    "Returns the current homotopy factor for the given transition range and transition variable - homotopy factor varies between zero and 1 - inverse behavior of the above"
  input Real transitionVariable "homotopy transition variable";
  input Real transitionRangeLowerLimit
      "If transition variable is below that limit the homotopy factor equals 0 -> in transition region smooth transition between 1 and zero";
  input Real transitionRangeUpperLimit
      "If transition variable is above that limit the homotopy factor equals 1 -> in transition region smooth transition between 1 and zero";
  output Real homotopyFactor "either 1, zero or smooth transition between them";
algorithm

   // regFun3_Only_y input/output:
   // input Real x "Abscissa value";                              -> transitionVariable
   // input Real x0 "Lower abscissa value";                       -> transitionRangeLowerLimit
   // input Real x1 "Upper abscissa value";                       -> transitionRangeUpperLimit
   // input Real y0 "Ordinate value at lower abscissa value";     -> 1 (below transition range homotopy factor equals 1)
   // input Real y1 "Ordinate value at upper abscissa value";     -> 0 (above transition range homotopy factor equals 0)
   // input Real y0d "Derivative at lower abscissa value";        -> 0 (horizontal tangent)
   // input Real y1d "Derivative at upper abscissa value";        -> 0 (horizontal tangent)

  homotopyFactor := smooth(1, if transitionVariable < transitionRangeLowerLimit then 0 else
                              if transitionVariable > transitionRangeUpperLimit then 1 else
                              StephanieLibrary.Fluid.Utilities.regFun3_Only_y(transitionVariable,transitionRangeLowerLimit,transitionRangeUpperLimit,0,1,0,0));

end HomotopyFactorZeroOne;

function HomotopyFactorOneZeroOne
    "Extended homotopy factor with symmetric smooth transitons between 1 - zero - 1 where the zero section length als well as the lengths of the smooth transition ranges are function inputs"
  input Real transitionVariable "homotopy transition variable";
  input Real transitionRangeCenter
      "symmetric center of zero zone and overall symmetric center of 1 - zero -1 transition";
  input Real zeroLength "length of zero section";
  input Real overallLength "overall transition length";
  output Real homotopyFactor;
  protected
  Real x0_left;
  Real x1_left;
  Real y0_left;
  Real y1_left;
  Real y0d_left;
  Real y1d_left;
  Real x0_right;
  Real x1_right;
  Real y0_right;
  Real y1_right;
  Real y0d_right;
  Real y1d_right;
algorithm
   x0_left := transitionRangeCenter - overallLength/2;
   x1_left := transitionRangeCenter - zeroLength/2;
   y0_left := 1;
   y1_left := 0;
   y0d_left := 0;
   y1d_left := 0;
   x0_right := transitionRangeCenter + zeroLength/2;
   x1_right := transitionRangeCenter + overallLength/2;
   y0_right := 0;
   y1_right := 1;
   y0d_right := 0;
   y1d_right := 0;

   homotopyFactor := smooth(1, if transitionVariable < x0_left then 1 else
                               if transitionVariable < x1_left then StephanieLibrary.Fluid.Utilities.regFun3_Only_y(transitionVariable,x0_left,x1_left,1,0,0,0) else
                               if transitionVariable < x0_right then 0 else
                               if transitionVariable < x1_right then StephanieLibrary.Fluid.Utilities.regFun3_Only_y(transitionVariable,x0_right,x1_right,0,1,0,0)
                               else 1);

end HomotopyFactorOneZeroOne;

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

function DotProduct3D "Dot product for 3D vectors"
  input Real[3] v1;
  input Real[3] v2;
  output Real dotProduct;
algorithm
    dotProduct:=v1[1]*v2[1] + v1[2]*v2[2] + v1[3]*v2[3];
end DotProduct3D;

function CrossProduct3D "Cross product for 3D vectors"
  input Real[3] v1;
  input Real[3] v2;
  output Real[3] crossProduct;
algorithm
    crossProduct:={-v1[3] * v2[2] + v1[2] * v2[3], v1[3] * v2[1] - v1[1] * v2[3], -v1[2] * v2[1] + v1[1] * v2[2]};
end CrossProduct3D;

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

end Functions;
