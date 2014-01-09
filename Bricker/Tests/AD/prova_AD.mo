within Bricker.Tests.AD;
model prova_AD
replaceable package Medium = CoolProp2Modelica.Media.WaterTPSI_FP;

parameter Modelica.SIunits.Pressure p = 15.17e5;
parameter Modelica.SIunits.Temperature T = 300+273.15;
  parameter Real x=2;
  Real y;
  Real z;
  Real k;

  Medium.ThermodynamicState fluidState;
equation
  fluidState = Medium.setState_pT(p,T);

y = x^2-x+1+30000000000000;

z = y;
k = 5;
end prova_AD;
