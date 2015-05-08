within BrickerISES.Tests.AD.System;
model PressureDropSolarField
  // model to translate the pressure drop relation of the Soltigua datasheet into the linear and the quadratic term required by the pressure drop model of ThermoCycle
  // From Soltigua PTMx DataSheet  Take the most conservative relation
// DP = 0.0010*Q^2 + 0.0046*Q where Q is the volume flow in lt/min

replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;

parameter Real AA = 0.0046
    "Linear parameter for the pressure drop relation of Soltigua datasheet";
parameter Real BB = 0.001
    "Quadratic parameter for the pressure drop relation of Soltigua datasheet";

//Real Dp_dataSheet;

Real Kv "parameter for the linear pressure drop of the Thermocycle model";

//Real Area "parameter for the quadratic pressure drop of the Thermocycle model";
parameter Modelica.SIunits.MassFlowRate M_dot = 1.65 "Nominal mass flow";
parameter Modelica.SIunits.Temperature T_SF_su= 165+273.15;
parameter Modelica.SIunits.Temperature T_SF_ex= 265+273.15;
parameter Modelica.SIunits.Pressure p = 1e5;
parameter Modelica.SIunits.VolumeFlowRate V_nominal = 6.360/3600;
Medium.ThermodynamicState fluidState_SF_su;
Medium.ThermodynamicState fluidState_SF_ex;

Medium.Density rho_SF_su;
Medium.Density rho_SF_ex;
Medium.Density rho_SF_ave;
Modelica.SIunits.VolumeFlowRate V_dot_SF_su;
Modelica.SIunits.VolumeFlowRate V_dot_SF_ex;

Modelica.SIunits.MassFlowRate M_dot_nominal "Nominal mass flow";
equation
fluidState_SF_su = Medium.setState_pT(p,T_SF_su);
fluidState_SF_ex = Medium.setState_pT(p,T_SF_ex);

rho_SF_su = Medium.density(fluidState_SF_su);
rho_SF_ex = Medium.density(fluidState_SF_ex);

V_dot_SF_su = M_dot/rho_SF_su;
V_dot_SF_ex = M_dot/rho_SF_ex;

rho_SF_ave = (rho_SF_su + rho_SF_ex)/2;

Kv = 0.0046*10^(-3)/60;

M_dot_nominal = V_nominal * (rho_SF_su+rho_SF_ex)/2;

end PressureDropSolarField;
