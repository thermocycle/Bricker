within BrickerISES.Functions;
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
