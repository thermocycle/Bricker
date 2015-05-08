within BrickerISES.Tests.AD.System.Layout_4;
model Therminol_SP_States
replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
parameter Modelica.SIunits.Pressure pressure = 1e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_su_solar = 150 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.Temperature T_ex_solar = 250 + 273.15
    "Temperature at the outlet of solar collector";
parameter Modelica.SIunits.Temperature T_su_BM = 216 + 273.15;
parameter Modelica.SIunits.Temperature T_ex_BM = 270 + 273.15;
parameter Modelica.SIunits.Temperature T_su_ORC = 245 + 273.15;
parameter Modelica.SIunits.Temperature T_ex_ORC = 150 + 273.15;
parameter Modelica.SIunits.Power Q_ORC = 500E03;

Medium.ThermodynamicState fluidState_su_ORC
    "FluidState at the inlet of the biomass boiler";
Medium.ThermodynamicState fluidState_ex_ORC
    "FluidState at the inlet of the biomass boiler";
    Medium.ThermodynamicState fluidState_su_BM
    "FluidState at the inlet of the biomass boiler";
        Medium.ThermodynamicState fluidState_ex_BM
    "FluidState at the inlet of the biomass boiler";

Modelica.SIunits.MassFlowRate Mdot_ORC;
parameter Modelica.SIunits.MassFlowRate Mdot_solar = 1.3833;
Modelica.SIunits.MassFlowRate Mdot_byPass_solar;

Modelica.SIunits.VolumeFlowRate Vdot;
Modelica.SIunits.VolumeFlowRate Vdot_su_ORC;
Modelica.SIunits.VolumeFlowRate Vdot_su_BM;

Modelica.SIunits.SpecificHeatCapacity Cp_su_ORC;

Modelica.SIunits.SpecificEnthalpy h_ORC_ex;
Modelica.SIunits.SpecificEnthalpy h_BM_ex;
Modelica.SIunits.SpecificEnthalpy h_BM_su;
Modelica.SIunits.SpecificEnthalpy h_ORC_su;
Medium.Density rho_su_BM;
Medium.Density rho_ex_ORC;
Medium.Density rho_su_ORC;

equation
fluidState_su_ORC = Medium.setState_pT(pressure,T_su_ORC);
fluidState_ex_ORC = Medium.setState_pT(pressure,T_ex_ORC);
fluidState_su_BM = Medium.setState_pT(pressure,T_su_BM);
fluidState_ex_BM = Medium.setState_pT(pressure,T_ex_BM);

Cp_su_ORC =Medium.specificHeatCapacityCp(fluidState_su_ORC);

Mdot_ORC = Q_ORC/(Cp_su_ORC*(T_su_ORC-T_ex_ORC));
Mdot_byPass_solar = Mdot_ORC - Mdot_solar;

Vdot = Mdot_ORC/rho_ex_ORC;
Vdot_su_ORC =Mdot_ORC/rho_su_ORC;

Vdot_su_BM = Mdot_ORC/rho_su_BM;

rho_su_BM = Medium.density(fluidState_su_BM);
rho_ex_ORC = Medium.density(fluidState_ex_ORC);
rho_su_ORC = Medium.density(fluidState_su_ORC);

h_ORC_su = Medium.specificEnthalpy(fluidState_su_ORC);
h_ORC_ex = Medium.specificEnthalpy(fluidState_ex_ORC);
h_BM_ex =  Medium.specificEnthalpy(fluidState_ex_BM);
h_BM_su = Medium.specificEnthalpy(fluidState_su_BM);

end Therminol_SP_States;
