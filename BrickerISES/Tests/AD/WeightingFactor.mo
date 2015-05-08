within BrickerISES.Tests.AD;
model WeightingFactor
replaceable package Medium = CoolProp2Modelica.Media.WaterTPSI_FP;
parameter Real length = 0.01;
parameter Real Var = 0.495;
parameter Real t_max = 0.5;
Real y;

equation
y = 0.5*cos((Var - t_max)*Modelica.Constants.pi/length);

end WeightingFactor;
