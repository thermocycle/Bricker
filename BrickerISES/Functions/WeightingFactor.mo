within BrickerISES.Functions;
function WeightingFactor
input Real t_max "Maximum value of the variable";
input Real t_min "Minimum value of the variable";
input Real Var "Variable";
input Real length;
output Real y "Weighting factor";
algorithm

y := smooth(1,noEvent(if Var < t_min then 0 elseif Var < t_min + length then
(0.5 - 0.5*cos((Var - t_min)*Modelica.Constants.pi/length)) elseif Var > t_max then
0 elseif Var > t_max - length then
  (0.5*cos((Var- t_max)*Modelica.Constants.pi/length))
 else
  1));

end WeightingFactor;
