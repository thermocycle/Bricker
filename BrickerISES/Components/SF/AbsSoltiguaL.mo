within BrickerISES.Components.SF;
model AbsSoltiguaL
// It solves the 1D radial energy balance around the Heat Transfer Element based on the SOLTIGUA PTMx Datasheet (see PTMx REV03-04/2013 and REV09-08/2013)
// min oil flow rate: 50 l/min @ 100-150 °C , 25 l/min @ 151-200 °C , 20 l/min @ 201 - 250 °C

/*********************** PORTS ***********************/
  ThermoCycle.Interfaces.HeatTransfer.ThermalPortL wall_int
   annotation (Placement(transformation(extent={{78,-6},{98,14}}),
        iconTransformation(extent={{80,-10},{100,10}})));

/*********************** INPUTS ***********************/
  Modelica.Blocks.Interfaces.RealInput v_wind
    annotation (Placement(transformation(extent={{-114,46},{-86,74}}),
        iconTransformation(extent={{-104,70},{-74,100}})));
  Modelica.Blocks.Interfaces.RealInput Theta "In Radiants"
    annotation (Placement(transformation(extent={{-114,26},{-86,54}}),
        iconTransformation(extent={{-104,30},{-74,60}})));

  Modelica.Blocks.Interfaces.RealInput DNI
    annotation (Placement(transformation(extent={{-114,-16},{-86,12}}),
        iconTransformation(extent={{-102,-46},{-72,-16}})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-114,8},{-86,36}}),
        iconTransformation(extent={{-104,-6},{-76,22}})));

  Modelica.Blocks.Interfaces.IntegerInput Focusing( start=1)
    "Internal focusing signal. TRUE Defocusing = 0, FALSE Defocusing =1"
    annotation (Placement(transformation(extent={{-120,-106},{-80,-66}})));

/****************** CONSTANTS  *********************/
constant Real Sigma = Modelica.Constants.sigma "Stefan-Boltzmann constant";
constant Real gg = Modelica.Constants.g_n
    "Standard acceleration of gravity on earth";
inner replaceable parameter
    ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                            geometry
constrainedby
    ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                       annotation (choicesAllMatching=true);

/************** PARAMETER ***********************/

/***************** General Geometries **************************/
parameter Integer Ns(min=1) = 1 "Number of Collector in series";
final parameter Modelica.SIunits.Length ll= geometry.L
    "Length of the total field";
parameter Real Defocusing = 25
    "Percentage value of the SF surface that goes to defocusing (25-50-75)";
/*************************** VARIABLES ****************************************/

/******************* Area of Collector and Reflector *****************************/
 Modelica.SIunits.Area S_eff "effective collecting area - Depend on focusing";
Real K_l( min=0,max=1) "Longitudinal Incident Angle Modifier (IAM)";
Real Theta_deg;

/********************* TEMPERATURES **********************************/
Modelica.SIunits.Temperature T_fluid "Temperature of the fluid";

/************* THERMAL FLOW ****************************************/
Modelica.SIunits.HeatFlowRate Q_tube_tot
    "Total thermal energy on one solar collector";

/****************************************THERMAL FLUX ****************************************/
Modelica.SIunits.HeatFlux Phi_conv_f "Heat flux to the fluid";
Modelica.SIunits.HeatFlux Phi_amb "Heat flux to the ambient";
/**************************************** EFFICIENCIES ****************************************/
Real Eta_tot "Efficiency based on Soltigua data sheet";

parameter Boolean TotalDefocusing = false "Set to true for total defocusing";
Real S_defocusing;
equation

  /* Focusing effect */
//if Focusing ==1 then S_eff =geometry.S_net;
//else  S_eff = geometry.S_ext_t;
//end if;
if TotalDefocusing then
  S_defocusing = geometry.A_ext_t;
else S_defocusing = geometry.S_net*(1-Defocusing/100);
end if;

if Focusing ==1 then S_eff =geometry.S_net*Ns;
else  S_eff = S_defocusing*Ns;
end if;

/* Get Theta in degree */
Theta_deg = Theta *180/geometry.pi;

/* Incidence angle modifier */
K_l = geometry.A_3*Theta_deg^3 - geometry.A_2*Theta_deg^2 + geometry.A_1*Theta_deg + geometry.A_0;

Q_tube_tot = DNI*S_eff*Modelica.Math.cos(Theta);

  if DNI > 0 then
  Eta_tot = max(Modelica.Constants.small,K_l*0.747 - 0.64*(T_fluid - Tamb)/max(Modelica.Constants.small,DNI));
  Phi_amb = 0.64*(Tamb -T_fluid)*Ns;
  else
  Eta_tot = 0;
  Phi_amb = 0.64*(Tamb -T_fluid)*Ns;
  end if;
  Phi_conv_f= Q_tube_tot*Eta_tot/ (geometry.A_ext_t*Ns);
/* Connection */
T_fluid = wall_int.T;
wall_int.phi = - Phi_conv_f - Phi_amb;

                                                                                                      annotation(Dialog(tab = "Initialisation"),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                     graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics),Documentation(info="<HTML> 
    
    <p><big>It solves the 1D radial energy balance around the Heat Collector Element of the Soltigua PTMx parabolic trough solar collector based on the Soltigua data sheet
     (see <a href=\"http://www.soltigua.com/prodotti/ptm/\">http://www.soltigua.com</a>.)</p>
     <p><big>The model allows to defocusing the collectors based on the Internal focusing signal. TRUE Defocusing = 0, FALSE Defocusing =1
    
    <p><b><big>Modelling options</b></p>
    <p><big><ul><li>Geometry: It allows to choose one of the different PTMx model. 
     
    </ul>
    </HTML>"));
end AbsSoltiguaL;
