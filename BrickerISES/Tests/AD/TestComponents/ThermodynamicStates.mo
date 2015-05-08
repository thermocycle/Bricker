within BrickerISES.Tests.AD.TestComponents;
model ThermodynamicStates
  replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
  replaceable package MediumORC = ThermoCycle.Media.R245fa_CP;

 import Modelica.SIunits;
 parameter SIunits.Temperature T_su_bm = 176+273.15;
 parameter SIunits.AbsolutePressure p_su_bm = 4e5;

 Medium.ThermodynamicState BiomassPumpSu;
 Medium.Density rho_su_bm;
 parameter SIunits.MassFlowRate m_dot = 2.6;
 SIunits.VolumeFlowRate V_dot;
 SIunits.VolumeFlowRate V_dot_max;
 /*ORC */
 parameter SIunits.Temperature T_su_ev = 60 + 273.15;
 parameter SIunits.AbsolutePressure p_ev = 18e5;
 parameter SIunits.MassFlowRate m_dot_orc = 2.5;
 parameter SIunits.Power Q_eva = 563e3;
 MediumORC.ThermodynamicState ORC_su;
 SIunits.SpecificEnthalpy h_su_eva;
 SIunits.SpecificEnthalpy h_ex_eva;
 MediumORC.ThermodynamicState ORC_ex;
 SIunits.VolumeFlowRate V_dotORC;
 SIunits.VolumeFlowRate V_dot_maxORC;
 SIunits.Density rho_su_ev;
 //Real AU;
 //Real DT_lm;
equation
  /*Biomass */
  BiomassPumpSu = Medium.setState_pT(p_su_bm,T_su_bm);
  rho_su_bm = Medium.density(BiomassPumpSu);
  V_dot = m_dot / rho_su_bm;
  V_dot_max = V_dot*2;
  /*ORC */
  ORC_su = MediumORC.setState_pT(p_ev,T_su_ev);
  h_su_eva = MediumORC.specificEnthalpy(ORC_su);
  h_ex_eva = h_su_eva + Q_eva/m_dot_orc;
  ORC_ex = MediumORC.setState_ph(p_ev,h_ex_eva);
  rho_su_ev = MediumORC.density(ORC_su);
  V_dotORC = m_dot_orc /rho_su_ev;
  V_dot_maxORC = V_dotORC*2;

  //DT_lm = (DT_1 - DT_2)/log(DT_1/DT_2);
  //DT_1 = ORC_e
  //AU = Q_eva/DT_lm;
end ThermodynamicStates;
