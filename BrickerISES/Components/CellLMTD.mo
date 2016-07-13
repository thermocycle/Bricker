within BrickerISES.Components;
model CellLMTD
  "HX singlephase model compatible with MSL - countercurrent configuration only"
  replaceable package Medium =ThermoCycle.Media.DummyFluid  constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid primary side" annotation (Dialog(group= "Primary side", tab="General"),choicesAllMatching=true);

// protected
//    record SummaryClass
//    replaceable Arrays T_profile;
//       record Arrays
//       Modelica.SIunits.Temperature[2] T_ps;
//       Modelica.SIunits.Temperature[2] T_ss;
//       end Arrays;
//     //Modelica.SIunits.SpecificEnthalpy[2] h_ps;
//     //Modelica.SIunits.SpecificEnthalpy[2] h_ss;
//     Modelica.SIunits.Power Q_ps;
//     Modelica.SIunits.Power Q_ss;
//     Modelica.SIunits.Pressure p_ps;
//     Modelica.SIunits.Pressure p_ss;
//    end SummaryClass;
// public
//  SummaryClass Summary( T_profile(T_ps= {T_primary[1],T_primary[2]}, T_ss = {T_secondary[1],T_secondary[2]}),  p_ps = stateIn_ps.p, p_ss = stateIn_ss.p, Q_ps = Q_dot_ps, Q_ss = Q_dot_ss);
//
// protected
//   Modelica.SIunits.Temperature[2] T_primary;
//   Modelica.SIunits.Temperature[2] T_secondary;
  //
  /******************************* PARAMETERS *****************************/
  /*Metal Wall*/
public
  parameter Integer Nt(min=1)=1 "Number of cells in parallel";
  parameter Modelica.SIunits.Mass M_wall= 69 "Mass of the Wall";
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall= 500
    "Specific heat capacity of the metal wall";

  parameter Modelica.SIunits.Mass M_ps = 300 "Mass of the fluid"
                        annotation (Dialog(group="Primary side", tab="General"));
  parameter Modelica.SIunits.MassFlowRate MdotNom_ps = 1
    "Nominal mass flow rate" annotation (Dialog(group="Primary side", tab="General"));

  /****************** Heat Transfer parameter  ******************/
   parameter Modelica.SIunits.Area A_ps=0.03 "Heat transfer area primary side" annotation (Dialog(group="Heat transfer", tab="General", enable=(not Use_AU)));

  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_ps
    "Constant heat transfer coefficient primary side" annotation (Dialog(group="Heat transfer", tab="General"));

    /****************** START VALUES ******************/
  parameter Modelica.SIunits.AbsolutePressure p_ps_start=50E5
    "Initial pressure" annotation (Dialog( group="Primary side",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_ps_su_start=394.95
    "Initial value of inlet temperature"                                                    annotation (Dialog(group="Primary side",tab="Initialization"));
    parameter Modelica.SIunits.Temperature T_ps_ex_start=516.25
    "Initial value of outlet temperature"                                                    annotation (Dialog(group="Primary side",tab="Initialization"));

  parameter Modelica.SIunits.Temperature T_w_1_start=(T_ps_su_start+5)/2
    "Initial value of wall temperature at T_ps_su and T_ss_ex"                                                  annotation (Dialog(group="Metal wall",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_w_2_start=(T_ps_ex_start+5)/2
    "Initial value of wall temperature at T_ps_ex and T_ss_su"                                                  annotation (Dialog(group="Metal wall",tab="Initialization"));
  parameter Boolean steadystate_T_wall=false
    "if true, sets the derivative of T_wall to zero during Initialization"    annotation (Dialog(group="Metal wall", tab="Initialization"));
  parameter Boolean T_wall_fixed=false
    "if true, imposes the initial wall temperature"                                    annotation (Dialog(group="Metal wall", tab="Initialization"));

  parameter Boolean Cp_constant=false
    "if true, sets the fluid specific heat capacity, Cp, on the two side of the HX to a constant value computed with inital conditions";

  /******************************* VARIABLES *****************************/
  Modelica.SIunits.Power Q_dot_ps;

  Modelica.SIunits.SpecificEnthalpy h_ps_ex(start= Medium.specificEnthalpy_pTX(p_ps_start,T_ps_ex_start,fill(0,0)));
  Modelica.SIunits.Temperature T_wall(start=(T_w_1_start+T_w_2_start)/2);
  Modelica.SIunits.Temperature T_w_1(start=T_w_1_start);
  Modelica.SIunits.Temperature T_w_2(start=T_w_2_start);
  Modelica.SIunits.Temperature DELTAT_w(start=T_w_2_start - T_w_1_start);
  Modelica.SIunits.ThermodynamicTemperature LMTD_ps(displayUnit="K");
  Modelica.SIunits.ThermodynamicTemperature pinch_ps(displayUnit="K",min=1);

  Medium.SpecificHeatCapacity Cp_ps;
  Modelica.SIunits.ThermalConductance AU_ps;
  Medium.ThermodynamicState stateIn_ps;
  Medium.ThermodynamicState stateOut_ps;

/******************************* CONNECTORS *****************************/
  ThermoCycle.Interfaces.Fluid.FlangeA InFlowPs(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-112,-12},{-92,8}}),
        iconTransformation(extent={{-112,-12},{-92,8}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlowPs(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{100,-12},{120,8}}),
        iconTransformation(extent={{100,-12},{120,8}})));

ThermoCycle.Interfaces.HeatTransfer.ThermalPortL  Wall_ext(T(start=(T_w_1_start + T_w_2_start)/2))
    annotation (Placement(transformation(extent={{-28,12},{32,32}}),
        iconTransformation(extent={{-36,18},{24,38}})));

equation
  /* Define state of the fluid */
  stateIn_ps = Medium.setState_ph(InFlowPs.p,inStream(InFlowPs.h_outflow));
  stateOut_ps = Medium.setState_ph(OutFlowPs.p,h_ps_ex);

AU_ps = A_ps * U_ps;

  if not Cp_constant then
    Cp_ps = Medium.specificHeatCapacityCp(stateIn_ps);
  else
    Cp_ps = Medium.specificHeatCapacityCp(Medium.setState_pTX(InFlowPs.p,(T_ps_su_start+T_ps_ex_start)/2,fill(0,0)));
  end if;

  /*Solve heat tranfser problem with LMTD method*/
  Q_dot_ps = AU_ps * LMTD_ps;

  /* Heat transfer calculation between the primary side and the wall */
    LMTD_ps = homotopy(ThermoCycle.Functions.RLMTD(T_w_1 - stateIn_ps.T, T_w_2 -
    stateOut_ps.T), max(0, pinch_ps));

  pinch_ps = min(T_w_1-stateIn_ps.T,T_w_2-stateOut_ps.T);

  Q_dot_ps = max(MdotNom_ps/(100*Nt),InFlowPs.m_flow/Nt) * (h_ps_ex - Medium.specificEnthalpy(stateIn_ps));

   /* Metal wall energy balance */
  ((M_wall * c_wall)+ (M_ps * Cp_ps))  * der(T_wall) = Wall_ext.phi*A_ps - Q_dot_ps;
  T_wall = (T_w_2 + T_w_1)/2;

  Wall_ext.T = T_wall;

  // + (M_ss * Cp_ss)
  /* Linear temperature gradient in the wall */
  DELTAT_w = max((T_w_2 - T_w_1),0);
  (M_wall * c_wall)  * der(DELTAT_w) = AU_ps*(stateOut_ps.T-stateIn_ps.T - DELTAT_w);

  // AU_ss*(stateIn_ss.T-stateOut_ss.T - DELTAT_w)

/* BOUNDARY CONDITIONS */

  /*Boundary Conditions Cold Fluid*/
  InFlowPs.h_outflow=1E5;  // Backflow not allowed
  OutFlowPs.h_outflow = h_ps_ex;
  InFlowPs.m_flow = - OutFlowPs.m_flow;
  InFlowPs.p = OutFlowPs.p;

  /* Equation for Summary */
//   T_primary[1] = stateIn_ps.T;
//   T_primary[2] = stateOut_ps.T;
//
//   T_secondary[1] = stateIn_ss.T;
//   T_secondary[2] = stateOut_ss.T;

initial equation

  if steadystate_T_wall then
    der(T_wall)=0;
  end if;

  if T_wall_fixed then
    T_w_1 = T_w_1_start;
  end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-20},{100,20}}),
                               graphics), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-20},{100,20}}),   graphics={
        Rectangle(
          extent={{-100,14},{100,-16}},
          fillColor={170,170,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-100,24},{100,14}},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          lineThickness=0.5,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-100,-16},{100,-26}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          lineThickness=0.5),
        Line(
          points={{-90,-1},{-48,-1},{-58,7},{-48,-1},{-58,-9},{-58,-9}},
          color={0,0,255},
          smooth=Smooth.None),
        Polygon(
          points={{-58,7},{-48,-1},{-58,-9},{-58,-7},{-58,7}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-22,-1},{20,-1},{10,7},{20,-1},{10,-9},{10,-9}},
          color={0,0,255},
          smooth=Smooth.None),
        Polygon(
          points={{10,7},{20,-1},{10,-9},{10,-7},{10,7}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{42,-1},{84,-1},{74,7},{84,-1},{74,-9},{74,-9}},
          color={0,0,255},
          smooth=Smooth.None),
        Polygon(
          points={{74,7},{84,-1},{74,-9},{74,-7},{74,7}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,24},{-100,14},{-100,14}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-100,-16},{-100,-26},{-100,-26}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{100,24},{100,14},{100,14}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{100,-16},{100,-26},{100,-26}},
          color={0,0,0},
          smooth=Smooth.None)}),
    Documentation(info="<html>
    <p><big> The <b>HX_singlephase </b> is a lumped counter-current heat exchanger model.
<p><big> The main assumptions for this model are:
  <ul>
  <li> Static mass, energy and momentum balances are assumed in the primary and secondary fluids sides.</li>
  <li> Dynamic energy balance is considered in the metal wall.</li>
  <li> Linear temperature gradient is assumed in the metal wall.</li>
</ul>
 
<p><big> Contrary to a steady-state model, the heat transfer problem is divided in two: 
<ul>
<li>A first heat transfer between the hot fluid and the wall </li>
<li>A second heat transfer between the wall and the cold fluid </li>
<li> The heat transfer problem between the two fluid sides and the metal wall is solved with the <a href=\"modelica://ThermoCycle.Functions.RLMTD\">RLMTD</a> method.</li>
</ul>
</p>

<p><big><b>Modeling options</b>
<ul>
<li>Use_AU: allows the user to use a global thermal conductance, assuming constant heat exchange area</li>
</ul>
</html>"));
end CellLMTD;
