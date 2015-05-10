within BrickerISES.Tests.AD.System;
model Test_R245fa
replaceable package Medium = ThermoCycle.Media.R245fa_CP;

parameter Modelica.SIunits.Pressure p_su_eva = 8e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_su_eva = 60 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.VolumeFlowRate V_su= 10/3600;

parameter Modelica.SIunits.Pressure p_ex_pump = 1.5e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_ex_solBio = 236 + 273.15
    "Temperature at the outlet of solar collector";

parameter Real Xpp = 30/50;
Medium.ThermodynamicState fluidState_su "FluidState at pump inlet";
Medium.ThermodynamicState fluidState_ex
    "FluidState at the outlet of Sol+Biomass";

Medium.SpecificEnthalpy h_su;
Medium.Density rho_su;
Modelica.SIunits.VolumeFlowRate V_dot_max;
Modelica.SIunits.MassFlowRate M_dot;
Modelica.SIunits.SpecificHeatCapacity Cp_ave;
Modelica.SIunits.SpecificHeatCapacity Cp_su;
Modelica.SIunits.SpecificHeatCapacity Cp_ex;

Modelica.SIunits.Power Q_thermal_to_ORC;

equation
  /* Inlet pump fluid properties */
  fluidState_su = Medium.setState_pT(p_su_pump,T_su_pump);
  h_su = Medium.specificEnthalpy(fluidState_su);
  rho_su = Medium.density(fluidState_su);
  Cp_su =Medium.specificHeatCapacityCp(fluidState_su);

  /* Outlet Solar and Biomass fluid properties */
  fluidState_ex = Medium.setState_pT(p_ex_pump,T_ex_solBio);
  Cp_ex =Medium.specificHeatCapacityCp(fluidState_ex);

  Cp_ave = (Cp_su + Cp_ex) / 2;

  Q_thermal_to_ORC = Cp_ave*M_dot*(T_ex_solBio - T_su_pump);

  M_dot = rho_su*V_su;

  V_dot_max = V_su/Xpp;

end Test_R245fa;
