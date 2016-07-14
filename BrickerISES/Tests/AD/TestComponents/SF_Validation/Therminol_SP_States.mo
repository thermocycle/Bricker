within BrickerISES.Tests.AD.TestComponents.SF_Validation;
model Therminol_SP_States
replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
parameter Modelica.SIunits.Pressure pressure = 1e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_su = 150 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.Temperature T_ex_100 = 250 + 273.15
    "Temperature at the outlet of solar collector";
parameter Modelica.SIunits.Temperature T_ex_50 = 200 + 273.15
    "Temperature at the outlet of solar collector";
parameter Modelica.SIunits.Temperature T_ex_33 = 188 + 273.15
    "Temperature at the outlet of solar collector";
final parameter Modelica.SIunits.VolumeFlowRate V_100 = 6360/(3600*1E3);
final parameter Modelica.SIunits.VolumeFlowRate V_50 = 13008/(3600*1E3);
final parameter Modelica.SIunits.VolumeFlowRate V_33 = 19836/(3600*1E3);

/* Mass flow*/
Modelica.SIunits.MassFlowRate Mdot_100;
Modelica.SIunits.MassFlowRate Mdot_50;
Modelica.SIunits.MassFlowRate Mdot_33;

/* Density */
Medium.Density rho_su;
Medium.Density rho_ex_100;
Medium.Density rho_ex_50;
Medium.Density rho_ex_33;

/* Average Density */
Medium.Density rho_ave_100;
Medium.Density rho_ave_50;
Medium.Density rho_ave_33;

/* Thermodynamic properties */
Medium.ThermodynamicState fluidState_su
    "FluidState at the outlet of Sol+Biomass";
Medium.ThermodynamicState fluidState_ex_100
    "FluidState at the inlet of the biomass boiler";
Medium.ThermodynamicState fluidState_ex_50
    "FluidState at evaporator inlet - ORC side";
Medium.ThermodynamicState fluidState_ex_33
    "FluidState at evaporator inlet - ORC side";

equation
fluidState_su = Medium.setState_pT(pressure,T_su);

fluidState_ex_100 = Medium.setState_pT(pressure,T_ex_100);

fluidState_ex_50 = Medium.setState_pT(pressure,T_ex_50);

fluidState_ex_33 = Medium.setState_pT(pressure,T_ex_33);

rho_su = Medium.density(fluidState_su);

rho_ex_100 = Medium.density(fluidState_ex_100);

rho_ex_50 = Medium.density(fluidState_ex_50);

rho_ex_33 = Medium.density(fluidState_ex_33);

rho_ave_100 = (rho_su + rho_ex_100)/2;
rho_ave_50 = (rho_su + rho_ex_50)/2;
rho_ave_33 = (rho_su + rho_ex_33)/2;

Mdot_100 = V_100*rho_ave_100;
Mdot_50 = V_100*rho_ave_50;
Mdot_33 = V_100*rho_ave_33;

end Therminol_SP_States;
