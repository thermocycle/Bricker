within BrickerISES.Functions;
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
