within BrickerISES.Components.Tank;
model ExpansionTank "Storage tank with a cushion of gas - (Nitrogen)"

replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

  ThermoCycle.Interfaces.Fluid.FlangeA InFlow( redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-108},{10,-88}}),
        iconTransformation(extent={{-10,-108},{10,-88}})));
  Modelica.Blocks.Interfaces.RealOutput Level
    annotation (Placement(transformation(extent={{88,50},{108,70}})));
  ThermoCycle.Interfaces.HeatTransfer.ThermalPortL LateralWall
    annotation (Placement(transformation(extent={{-100,-30},{-84,44}})));

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

 /************ FLUID INITIAL VALUES ***************/
  parameter Modelica.SIunits.Temperature Tstart "Initial temperature"
    annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Pressure pstart "Initial pressure in the tank"
    annotation (Dialog(tab="Initialization"));

final parameter Modelica.SIunits.SpecificEnthalpy hstart=
      Medium.specificEnthalpy_pTX(
              pstart,
              Tstart,
              fill(0, 0))
    "Start value of enthalpy vector (initialized by default)"
    annotation (Dialog(tab="Initialization"));

parameter Real L_lstart( min=0,max=0.5)
    "Start value for the liquid level with respect to the tank height min=0,max=0.5"
 annotation (Dialog(tab="Initialization"));

parameter Modelica.SIunits.MassFlowRate Mdotnom "Nominal fluid flow rate";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=1
    "Nominal Heat transfer coefficient for the fluid.";
final parameter Modelica.SIunits.Volume V_lstart = A_cross*L_lstart;

/***** Ideal gas parameter ***********/
final parameter Real pV_gas = pstart*V_tank*(1 - L_lstart) "Initial value of ";

/********************************* HEAT TRANSFER WITH EXTERNAL AMBIENT ********************************/
/* Heat transfer Model */
replaceable model HeatTransfer =
ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal
constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    "Convective heat transfer for the fluid"                                                         annotation (choicesAllMatching = true);
HeatTransfer heatTransfer( redeclare final package Medium = Medium,
final n=1,
final Mdotnom = Mdotnom,
final Unom_l = Unom,
final Unom_tp = Unom,
final Unom_v = Unom,
final M_dot = M_dot,
final x = 0,
final FluidState={fluidState})
                          annotation (Placement(transformation(extent={{-56,-28},
            {-36,-8}})));

/********** Variables ****************/
Medium.ThermodynamicState  fluidState;
Medium.AbsolutePressure p(start=pstart);
Modelica.SIunits.Volume V_l(start= V_tank*L_lstart) "Volume of the liquid";
Modelica.SIunits.Length L_l(start= L_lstart,min=0,max=0.5)
    "Height of the liquid";
Modelica.SIunits.Mass M_l "Liquid Mass";
Medium.SpecificEnthalpy h( start = hstart) "Fluid specific enthalpy";
Medium.SpecificEnthalpy h_su(start=hstart)
    "Enthalpy state variable at inlet node";
Medium.Density rho "Fluid density";
Medium.Temperature T "Fluid temperature";
Modelica.SIunits.MassFlowRate M_dot(start=Mdotnom);
Modelica.SIunits.HeatFlux qdot "heat flux with the external ambient";
Modelica.SIunits.DerDensityByEnthalpy drdh
    "Derivative of average density by enthalpy";
Real dMdt;
/* Ideal gas Variable */
Modelica.SIunits.Volume V_gas(start=V_tank*(1 - L_lstart)) "ideal gas volume";
Medium.AbsolutePressure p_gas "Ideal gas pressure";

equation
assert(L_l <0.5 and L_l>0, "Height of the fluid with respect to tank height = " + String(L_l) + ", Value out of limit min 0 max 0.5");

fluidState = Medium.setState_ph(p,h);
rho = Medium.density(fluidState);
T = Medium.temperature(fluidState);
drdh = Medium.density_derh_p(fluidState);
M_l = rho*V_l;

L_l = Level;
L_l = V_l/V_tank;
V_tank = V_l + V_gas;

/* Boyle's law */
p_gas*V_gas = pV_gas;

p = p_gas;

/* Energy Balance */
dMdt*h + der(h)*M_l - der(p)*V_l - p*der(V_l) = h_su*M_dot - Atot_tank*qdot;

qdot = heatTransfer.q_dot[1];

/* Mass Balance */
dMdt = M_dot;

dMdt = rho*der(V_l) + V_l*drdh*der(h);

//p - p_ext = g*L_l*rho;

/* Boundary Conditions */
 /* Enthalpies */
  InFlow.h_outflow = h_su;

h_su = if noEvent(M_dot <= 0) then h else inStream(InFlow.h_outflow);

/* pressures */
 InFlow.p = p;

/*Mass Flow*/
 M_dot = InFlow.m_flow;

  connect(heatTransfer.thermalPortL[1], LateralWall) annotation (Line(
      points={{-46.2,-11.4},{-46.2,7},{-92,7}},
      color={255,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
        Rectangle(
          extent={{-100,100},{-98,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,98}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{100,60},{-100,100}},
          lineColor={213,170,255},
          fillColor={95,95,95},
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
          extent={{-100,-98},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-106,12},{114,-10}},
          lineColor={0,0,0},
          fillColor={213,170,255},
          fillPattern=FillPattern.Solid,
          textString="Expansion Tank"),
        Rectangle(
          extent={{-100,100},{-98,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,98}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end ExpansionTank;
