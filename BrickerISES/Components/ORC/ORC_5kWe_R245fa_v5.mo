within BrickerISES.Components.ORC;
model ORC_5kWe_R245fa_v5 "W_dot_net >= 0 in any case, but limit at 1000W"

replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

  ThermoCycle.Interfaces.Fluid.FlangeA InFlowORC( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-36,70},{-16,90}}),
        iconTransformation(extent={{-30,74},{-20,84}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlowORC( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-34,-60},{-14,-40}}),
        iconTransformation(extent={{-32,-52},{-20,-40}})));

Modelica.SIunits.Pressure p;
Modelica.SIunits.MassFlowRate m_dot_hf;
Modelica.SIunits.Temperature T_hf_su_ev;
Modelica.SIunits.Temperature T_hf_ex_ev;
Modelica.SIunits.Temperature T_hf_ex_ev_filtered;
Real T_hf_su_ev_C;
Real T_hf_ex_ev_C_correlation;
Real T_hf_ex_ev_C;
Modelica.SIunits.SpecificEnthalpy h_hf_su_ev;
Modelica.SIunits.SpecificEnthalpy h_hf_ex_ev;
Modelica.SIunits.HeatFlowRate Q_dot_ev;
Modelica.SIunits.Power W_dot_net_correlation;
Modelica.SIunits.Power W_dot_net;
parameter Modelica.SIunits.Power W_dot_net_limit=1000;
Medium.ThermodynamicState fluidstate_hf_su;
parameter Modelica.SIunits.Energy W_ORC_net_start= 0;
Modelica.SIunits.Energy W_ORC_net(start= W_ORC_net_start);

parameter Real T_filter = 5;
parameter Real A_filter = 1.1;
equation
  fluidstate_hf_su = Medium.setState_ph(p,h_hf_su_ev);
  T_hf_su_ev = Medium.temperature(fluidstate_hf_su);
  //h_hf_ex_ev = Medium.h_pT(p,T_hf_ex_ev);
  h_hf_ex_ev = Medium.specificEnthalpy_pT(p,T_hf_ex_ev_filtered);
  T_hf_su_ev_C=T_hf_su_ev-273.15;
  T_hf_ex_ev_C_correlation =  1.00669281769003*T_hf_su_ev_C -17.3893201119752/m_dot_hf + 0.0227065717543786*T_hf_su_ev_C*m_dot_hf + 93.986879566588/(3.50709884193829*m_dot_hf + 0.989088943984963*T_hf_su_ev_C*m_dot_hf - 17.0552233335202) - 2.90774350985224 - 0.991419641396082*m_dot_hf;
  W_dot_net_correlation = 140.642405767525*T_hf_su_ev_C + 122.00763334248*m_dot_hf  -116.07964076484/m_dot_hf^2 + (0.599364676462785*T_hf_su_ev_C + 0.0431530345795983*T_hf_su_ev_C^2 - 1064.06492757222)/m_dot_hf - 7347.85207779182 - 0.398241897307597*T_hf_su_ev_C^2;
  W_dot_net = smooth(1,if noEvent(W_dot_net_correlation<W_dot_net_limit) then 0 else W_dot_net_correlation);
  T_hf_ex_ev_C = smooth(1,if noEvent(W_dot_net <= 0) then T_hf_su_ev_C else T_hf_ex_ev_C_correlation);
  Q_dot_ev = m_dot_hf*(h_hf_su_ev-h_hf_ex_ev);
  T_hf_ex_ev = T_hf_ex_ev_C+273.15;
  der(T_hf_ex_ev_filtered) = (A_filter*T_hf_ex_ev - T_hf_ex_ev_filtered)/T_filter;
  der(W_ORC_net) = W_dot_net;

  /* BOUNDARY CONDITIONS */
  m_dot_hf = InFlowORC.m_flow;
  OutFlowORC.m_flow = -m_dot_hf;

  h_hf_su_ev = inStream(InFlowORC.h_outflow);
  h_hf_su_ev =  InFlowORC.h_outflow;

  h_hf_ex_ev = OutFlowORC.h_outflow;

  OutFlowORC.p = p;
  InFlowORC.p = p;
   annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),  graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Bitmap(extent={{-36,82},{62,-54}}, fileName="modelica://ThermalStorage/../ORCavatar.jpg")}));
end ORC_5kWe_R245fa_v5;
