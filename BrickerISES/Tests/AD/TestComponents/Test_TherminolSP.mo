within BrickerISES.Tests.AD.TestComponents;
model Test_TherminolSP
replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
replaceable package Medium_ORC = ThermoCycle.Media.R245fa_CP constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

/* Parameter heating circuit */
parameter Modelica.SIunits.Pressure p_su_pump = 1e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_su_pump = 150 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.VolumeFlowRate V_su= 10/3600;

parameter Modelica.SIunits.Pressure p_ex_pump = 1.5e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_ex_solBio = 265 + 273.15
    "Temperature at the outlet of solar collector";
parameter Modelica.SIunits.Temperature T_su_solar = 150 + 273.15
    "Temperature at the outlet of solar collector";
parameter Modelica.SIunits.Temperature T_ex_solar = 195 + 273.15
    "Temperature at the outlet of solar collector";

parameter Real Xpp = 30/50;

parameter Modelica.SIunits.Temperature T_su_eva = 30 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.Pressure p_su_eva = 8e5
    "pressure at the inlet of the evaporator - ORC side";

/* Parameter ORC circuit */
parameter Modelica.SIunits.MassFlowRate M_dot_ORC = 1 "orc Mass flow";
parameter Modelica.SIunits.Power P_el_ORC = 100e3
    "Power produced by the test rig";
parameter Real eta_turb = 0.7 "Turbine efficiency";
parameter Modelica.SIunits.Temperature T_max_ORC = 200 + 273.15
    "Max temperature of the ORC";
parameter Modelica.SIunits.Pressure p_cond= 2e5;
parameter Modelica.SIunits.Temperature T_ex_turb = 50+273.15;

/* Parameter Oil-Water heat exchanger circuit */
parameter Modelica.SIunits.MassFlowRate Mdot_hx = 3.93;
parameter Modelica.SIunits.Temperature T_ex_hx = 78+273.15;
parameter Real Vdot_hxMax_lh_fix = 16000;
Real Mdot_hxMax = Vdot_hxMax_lh_fix/1000/3600*rho_ex_hx;
Medium.Density rho_ex_hx;
Modelica.SIunits.VolumeFlowRate Vdot_hx;
Modelica.SIunits.VolumeFlowRate Vdot_hxMax;
Real Vdot_hxMax_lh;

/* Variable heating circuit */
Medium.SpecificEnthalpy h_su;
Medium.Density rho_su;
Modelica.SIunits.VolumeFlowRate V_dot_max;
Modelica.SIunits.MassFlowRate M_dot;
Modelica.SIunits.SpecificHeatCapacity Cp_ave;
Modelica.SIunits.SpecificHeatCapacity Cp_su;
Modelica.SIunits.SpecificHeatCapacity Cp_ex;
Modelica.SIunits.Power Q_thermal_to_ORC;
Modelica.SIunits.Power Q_ORC_max;

/* Variable fluid circuit */
Medium.ThermodynamicState fluidState_su "FluidState at pump inlet";
Medium.ThermodynamicState fluidState_ex
    "FluidState at the outlet of Sol+Biomass";
Medium.ThermodynamicState fluidState_su_Biomass
    "FluidState at the inlet of the biomass boiler";
Medium.ThermodynamicState fluidState_su_solar
    "FluidState at evaporator inlet - ORC side";
Medium.ThermodynamicState fluidState_ex_solar
    "FluidState at evaporator inlet - ORC side";
Medium.ThermodynamicState fluidState_ex_hxOW "FluidState at OilWater Hx outlet";

Medium_ORC.ThermodynamicState fluidState_su_eva
    "FluidState at evaporator inlet - ORC side";
Medium_ORC.ThermodynamicState fluidState_ex_eva
    "FluidState at evaporator inlet - ORC side";
Medium_ORC.ThermodynamicState fluidState_max
    "FluidState at evaporator inlet - ORC side";
Medium_ORC.ThermodynamicState fluidState_ex_turb
    "FluidState at evaporator inlet - ORC side";
Medium_ORC.SaturationProperties sat_cond "Saturation condition Condenser";

//Medium_ORC.Temperature T_ex_eva;
Medium_ORC.SpecificEnthalpy h_su_eva;
Medium_ORC.SpecificEnthalpy h_ex_eva;
Medium_ORC.SpecificEnthalpy h_ex_max;
Medium_ORC.SpecificEnthalpy h_ex_turb;
Medium.SpecificEnthalpy h_ex_solBio;
Medium.SpecificEnthalpy h_ex_solar;
Medium.Density rho_su_solar;
Medium.Density rho_ex_solar;
Modelica.SIunits.MassFlowRate M_dot_turb;

/* Biomass Boiler */
parameter Modelica.SIunits.MassFlowRate m_flow_bio = 11.66;
Modelica.SIunits.Temperature T_su_boiler;
Modelica.SIunits.Power Q_biomass;
Medium.SpecificEnthalpy h_su_biomass;

equation
  fluidState_su_solar = Medium.setState_pT(p_su_pump,T_su_solar);
  fluidState_ex_solar  = Medium.setState_pT(p_su_pump,T_ex_solar);
  h_ex_solar = Medium.specificEnthalpy(fluidState_ex_solar);
  rho_su_solar = Medium.density(fluidState_su_solar);
  rho_ex_solar = Medium.density(fluidState_ex_solar);

/* Inlet pump fluid properties */
  fluidState_su = Medium.setState_pT(p_su_pump,T_su_pump);
  h_su = Medium.specificEnthalpy(fluidState_su);
  rho_su = Medium.density(fluidState_su);
  Cp_su =Medium.specificHeatCapacityCp(fluidState_su);

/* Inlet of Biomass Boiler */
  T_su_boiler = T_ex_solBio -20;
  fluidState_su_Biomass = Medium.setState_pT(p_su_pump,T_su_boiler);

  h_su_biomass = Medium.specificEnthalpy(fluidState_su_Biomass);

  Q_biomass = m_flow_bio*(h_ex_solBio-h_su_biomass)/0.85;

/* Outlet Solar and Biomass fluid properties */
  fluidState_ex = Medium.setState_pT(p_ex_pump,T_ex_solBio);
  Cp_ex =Medium.specificHeatCapacityCp(fluidState_ex);
  h_ex_solBio = Medium.specificEnthalpy(fluidState_ex);

/* Pump calculation */
  M_dot = rho_su*V_su;
  V_dot_max = V_su/Xpp;

/* Thermal energy from the oil to the ORC */
 Cp_ave = (Cp_su + Cp_ex) / 2;
 Q_thermal_to_ORC = Cp_ave*M_dot*(T_ex_solBio - T_su_pump);

 /*ORC side Evaporator */
sat_cond = Medium_ORC.setSat_p(p_cond);
fluidState_su_eva = Medium_ORC.setState_pT(p_su_eva,T_su_eva);
fluidState_max = Medium_ORC.setState_pT(p_su_eva,T_max_ORC);
fluidState_ex_eva = Medium_ORC.setState_ph(p_su_eva,h_ex_eva);
fluidState_ex_turb = Medium_ORC.setState_pT(p_cond,T_ex_turb);

h_su_eva = Medium_ORC.specificEnthalpy(fluidState_su_eva);

h_ex_turb = Medium_ORC.specificEnthalpy(fluidState_ex_turb);
M_dot_turb = P_el_ORC/(eta_turb*(h_ex_max - h_ex_turb));

h_ex_eva = h_su_eva + Q_thermal_to_ORC*0.8/M_dot_ORC;

h_ex_max = Medium_ORC.specificEnthalpy(fluidState_max);
Q_ORC_max = M_dot_ORC*(h_ex_max - h_su_eva);

/* OIL WATER HEAT EXCHANGER */
fluidState_ex_hxOW = Medium.setState_pT(p_su_pump,T_ex_hx);
rho_ex_hx = Medium.density(fluidState_ex_hxOW);

Vdot_hx = Mdot_hx/rho_ex_hx;
Vdot_hxMax = Vdot_hx/1;
Vdot_hxMax_lh = Vdot_hxMax*1000*3600;

end Test_TherminolSP;
