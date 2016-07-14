within BrickerISES.Components.Tank;
model Tank "Storage tank with an imposed constant pressure"

replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

  ThermoCycle.Interfaces.Fluid.FlangeA InFlow( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-112,-72},{-92,-52}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{88,-76},{108,-56}})));

 /************ Geometric Characteristics  ************/

parameter Modelica.SIunits.Pressure p_ext
    "External pressure imposed to the system";
parameter Modelica.SIunits.Area A "Cross section of the Tank";
parameter Modelica.SIunits.Volume V0 = 0 "Initial Volume";
constant Real g=Modelica.Constants.g_n;

 /************ FLUID INITIAL VALUES ***************/
  parameter Modelica.SIunits.Temperature Tstart "Initial temperature"
    annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Pressure pstart "Initial temperature"
    annotation (Dialog(tab="Initialization"));

final parameter Modelica.SIunits.SpecificEnthalpy hstart=
      Medium.specificEnthalpy_pTX(
              pstart,
              Tstart,
              fill(0, 0))
    "Start value of enthalpy vector (initialized by default)"
    annotation (Dialog(tab="Initialization"));

parameter Modelica.SIunits.Length L_lstart "Start value for the liquid level"
 annotation (Dialog(tab="Initialization"));

parameter Modelica.SIunits.MassFlowRate Mdotnom "Nominal fluid flow rate";
final parameter Modelica.SIunits.Volume V_lstart = A*L_lstart;

/********** Variables ****************/
Medium.ThermodynamicState  fluidState;
Medium.AbsolutePressure p(start=pstart);
Modelica.SIunits.Volume V_l( start = A*L_lstart) "Volume of the liquid";
Modelica.SIunits.Length L_l( start= L_lstart) "Height of the liquid";
Modelica.SIunits.Mass M_l(  start = Medium.density_pTX(
                pstart,
                Tstart,
                fill(0, 0))*V_lstart) "Liquid Mass";
Medium.SpecificEnthalpy h( start = hstart) "Fluid specific enthalpy";
Modelica.SIunits.SpecificEnthalpy h_su(start=hstart)
    "Enthalpy state variable at inlet node";
Modelica.SIunits.SpecificEnthalpy h_ex(start=hstart)
    "Enthalpy state variable at outlet node";
Medium.Density rho "Fluid density";
Medium.Temperature T "Fluid temperature";
Modelica.SIunits.MassFlowRate M_dot_su(start=Mdotnom);
Modelica.SIunits.MassFlowRate M_dot_ex(start=Mdotnom);
Modelica.SIunits.DerDensityByEnthalpy drdh
    "Derivative of average density by enthalpy";
Real dMdt;
equation
fluidState = Medium.setState_ph(p,h);
rho = Medium.density(fluidState);
T = Medium.temperature(fluidState);
drdh = Medium.density_derh_p(fluidState);
M_l = rho*V_l;
V_l = V0 + A*L_l;

/* Energy Balance */
dMdt*h + der(h)*M_l - V_l*der(p)= h_su*M_dot_su - h_ex*M_dot_ex;

/* Mass Balance */
dMdt = M_dot_su - M_dot_ex;

dMdt = rho*der(V_l) + V_l*drdh*der(h);

p - p_ext = g*L_l*rho;

/* Boundary Conditions */
 /* Enthalpies */
  InFlow.h_outflow = h_su;
  OutFlow.h_outflow = h_ex;
h_su = if noEvent(M_dot_su <= 0) then h else inStream(InFlow.h_outflow);
h_ex = if noEvent(M_dot_ex >= 0) then h else inStream(OutFlow.h_outflow);

/* pressures */
 p = OutFlow.p;
 InFlow.p = p;

/*Mass Flow*/
 M_dot_su = InFlow.m_flow;
 OutFlow.m_flow = -M_dot_ex;

end Tank;
