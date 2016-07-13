within BrickerISES.Tests.AD.System;
model ThermStatesLayoutII
replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
replaceable package Medium_ORC = ThermoCycle.Media.R245fa_CP constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

/* Parameters Solar field */
parameter Modelica.SIunits.Pressure p_su_pp_sf = 3.5e5 "pressure at the inlet";
parameter Modelica.SIunits.Temperature T_su_pp_sf = 163 + 273
    "Temperature at the inlet";
parameter Modelica.SIunits.MassFlowRate M_su_pp_sf= 2.5;

/* Parameters BioMass */
parameter Modelica.SIunits.Pressure p_su_pp_bm = 4.5e5
    "pressure at the inlet of the biomass pump";
parameter Modelica.SIunits.Temperature T_su_pp_bm = 252+273.15
    "Temperature at the inlet of the biomass pump";
parameter Modelica.SIunits.MassFlowRate M_su_pp_bm = 9.4
    "Mass flow through the biomass boiler";

    /* Parameters Hx Water_Oil */
parameter Modelica.SIunits.Pressure p_su_pp_Hx = 3.5e5
    "pressure at the inlet of the Hx pump";
parameter Modelica.SIunits.Temperature T_su_pp_Hx = 74+273.15
    "Temperature at the inlet of the Hx pump";
parameter Modelica.SIunits.MassFlowRate M_su_pp_Hx = 3.8
    "Mass flow through the Hx pump";

    /* Parameters ORC outlet */
parameter Modelica.SIunits.Pressure p_out_orc = 5.5e5
    "pressure at the inlet of the Hx pump";
parameter Modelica.SIunits.Temperature T_out_orc = 169+273.15
    "Temperature at the inlet of the Hx pump";
parameter Modelica.SIunits.MassFlowRate M_out_orc = 2.9
    "Mass flow through the Hx pump";

/*Variables solar field */
Medium.ThermodynamicState fs_su_pp_sf = Medium.setState_pT(p_su_pp_sf,T_su_pp_sf);
Medium.Density rho_su_pp_sf;
Medium.SpecificEnthalpy h_su_pp_sf;
Modelica.SIunits.VolumeFlowRate V_su_pp_sf;
Modelica.SIunits.VolumeFlowRate V_dot_max_sf;
Real X_pp = 0.5 "Pump flow fraction";

/*Variables Biomass */
Medium.ThermodynamicState fs_su_pp_bm = Medium.setState_pT(p_su_pp_bm,T_su_pp_bm);
Medium.Density rho_su_pp_bm;
Medium.SpecificEnthalpy h_su_pp_bm;
Modelica.SIunits.VolumeFlowRate V_su_pp_bm;
Modelica.SIunits.VolumeFlowRate V_dot_max_bm;

/*Variables Hx Water Oil */
Medium.ThermodynamicState fs_su_pp_Hx = Medium.setState_pT(p_su_pp_Hx,T_su_pp_Hx);
Medium.Density rho_su_pp_Hx;
Medium.SpecificEnthalpy h_su_pp_Hx;
Modelica.SIunits.VolumeFlowRate V_su_pp_Hx;
Modelica.SIunits.VolumeFlowRate V_dot_max_Hx;

/*Variables orc out */
Medium.ThermodynamicState fs_out_orc = Medium.setState_pT(p_out_orc,T_out_orc);
Medium.Density rho_out_orc;
Medium.SpecificEnthalpy h_out_orc;
Modelica.SIunits.VolumeFlowRate V_out_orc;
Modelica.SIunits.VolumeFlowRate V_max_out_orc;

equation
 rho_su_pp_sf = Medium.density(fs_su_pp_sf);
 h_su_pp_sf = Medium.specificEnthalpy(fs_su_pp_sf);
 V_su_pp_sf = M_su_pp_sf/rho_su_pp_sf;
 V_dot_max_sf = V_su_pp_sf/(X_pp);

 rho_su_pp_bm = Medium.density(fs_su_pp_bm);
 h_su_pp_bm = Medium.specificEnthalpy(fs_su_pp_bm);
 V_su_pp_bm = M_su_pp_bm/rho_su_pp_bm;
 V_dot_max_bm = V_su_pp_bm/(X_pp);

 rho_su_pp_Hx = Medium.density(fs_su_pp_Hx);
 h_su_pp_Hx = Medium.specificEnthalpy(fs_su_pp_Hx);
 V_su_pp_Hx = M_su_pp_Hx/rho_su_pp_Hx;
 V_dot_max_Hx = V_su_pp_Hx/(X_pp);

 rho_out_orc = Medium.density(fs_out_orc);
 h_out_orc = Medium.specificEnthalpy(fs_out_orc);
 V_out_orc = M_out_orc/rho_out_orc;
 V_max_out_orc = V_out_orc/(X_pp);

end ThermStatesLayoutII;
