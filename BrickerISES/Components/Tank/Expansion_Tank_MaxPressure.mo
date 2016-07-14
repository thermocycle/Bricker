within BrickerISES.Components.Tank;
model Expansion_Tank_MaxPressure
  "Storage tank with a cushion of gas - (Nitrogen)"

replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

  ThermoCycle.Interfaces.Fluid.FlangeA InFlow( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-110,-98},{-90,-78}}),
        iconTransformation(extent={{-110,-98},{-90,-78}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{88,-100},{108,-80}}),
        iconTransformation(extent={{88,-100},{108,-80}})));

 /************ Constants  ************/
constant Real g=Modelica.Constants.g_n;
constant Real pi = Modelica.Constants.pi "pi-greco";
constant Real RR = Modelica.Constants.R "Molar gas constant [J/mol.K]";

/************ Geometric Characteristics  ************/
parameter Real H_D "Height to diameter ratio";
parameter Modelica.SIunits.Volume V_tank "Volume of the Tank";

final parameter Modelica.SIunits.Length   r_int = ((V_tank/(H_D)*4/pi)^(1/3))/2
    "Internal tank radius ";
final parameter Modelica.SIunits.Length   D_int = r_int*2
    "Internal tank Diameter ";
final parameter Modelica.SIunits.Length   H = sqrt( V_tank/(pi*r_int))
    "Tank Height ";
final parameter Modelica.SIunits.Area A_lateral=pi*H*D_int
    "Lateral External Area ";
final parameter Modelica.SIunits.Area A_cross= pi*r_int^2
    "Cross section of the tank External Area ";
final parameter Modelica.SIunits.Area Atot_tank= A_lateral + 2*pi*r_int^2
    "Total External Area (lateral + bottom + top)";

/************ Amount of gas calculation ************/
parameter Modelica.SIunits.Pressure p_max_tank
    "Maximum pressure in the tank: when the tank is completely full of fluid";
final parameter Real V_gas_min = 0.05*V_tank
    "Minimum fraction of volume occupied by the gas";

/* ideal gas Parameter */
final parameter Real nn_gas = (p_max_tank / (RR*T_gas))  * V_gas_min
    "Number of moles of gas";
parameter Real MM_gas = 14.0067/1000 "Molecular weight [kg/mol]";
parameter Modelica.SIunits.Temperature T_gas = 50 "Ideal gas Temperature";

/* Ideal gas Variable */
Modelica.SIunits.Mass M_gas "Mass of gas [kg]";
Modelica.SIunits.Volume V_gas(start=V_tank*(1 - L_lstart)) "ideal gas volume";
Modelica.SIunits.Pressure p_gas "Ideal gas pressure";

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

parameter Real L_lstart
    "Start value for the liquid level with respect to the tank height min=0,max=1"
 annotation (Dialog(tab="Initialization"));

parameter Modelica.SIunits.MassFlowRate Mdotnom "Nominal fluid flow rate";
final parameter Modelica.SIunits.Volume V_lstart = A_cross*L_lstart;

/********** Variables ****************/
Medium.ThermodynamicState  fluidState;
Medium.AbsolutePressure p(start=pstart);
Modelica.SIunits.Volume V_l( start = V_tank*L_lstart) "Volume of the liquid";
Modelica.SIunits.Length L_l( start= L_lstart,min=0,max=0.7)
    "Height of the liquid";
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
fluidState = Medium.setState_phX(p,h,fill(0,0));
rho = Medium.density(fluidState);
T = Medium.temperature(fluidState);
drdh = Medium.density_derh_p(fluidState);

M_l = rho*V_l;
L_l = V_l/V_tank;
V_tank = V_l + V_gas;

M_gas = nn_gas*MM_gas;

p_gas = nn_gas*RR*T_gas/V_gas;

p = p_gas;

/* Energy Balance */
dMdt*h + der(h)*M_l = h_su*M_dot_su - h_ex*M_dot_ex;

/* Mass Balance */
dMdt = M_dot_su - M_dot_ex;

dMdt = rho*der(V_l) + V_l*drdh*der(h);

//p - p_ext = g*L_l*rho;

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

  annotation (Icon(graphics={
        Rectangle(
          extent={{100,60},{-100,100}},
          lineColor={213,170,255},
          fillColor={213,170,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,60},{100,-100}},
          lineColor={0,255,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,255,255}),
        Rectangle(
          extent={{98,100},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{-98,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,-98},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,98}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-120,12},{100,-10}},
          lineColor={0,0,0},
          fillColor={213,170,255},
          fillPattern=FillPattern.Solid,
          textString="Expansion Tank")}));
end Expansion_Tank_MaxPressure;
