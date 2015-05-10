within BrickerISES.Tests.AD;
model Test_Water
replaceable package Medium = ThermoCycle.Media.Water;

parameter Modelica.SIunits.Pressure p = 2e5;
parameter Modelica.SIunits.Temperature T = 40+273.15;

  Medium.ThermodynamicState fluidState;
equation
  fluidState = Medium.setState_pT(p,T);

end Test_Water;
