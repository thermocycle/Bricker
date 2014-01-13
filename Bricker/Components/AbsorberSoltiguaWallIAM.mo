within Bricker.Components;
model AbsorberSoltiguaWallIAM
// It solves the 1D radial energy balance around the Heat Transfer Element based on the SOLTIGUA PTMx Datasheet (see PTMx REV03-04/2013 and REV09-08/2013)
// min oil flow rate: 50 l/min @ 100-150 �C , 25 l/min @ 151-200 �C , 20 l/min @ 201 - 250 �C

/*********************** INPUTS ***********************/
  Modelica.Blocks.Interfaces.RealInput v_wind
    annotation (Placement(transformation(extent={{-114,46},{-86,74}}),
        iconTransformation(extent={{-104,70},{-74,100}})));
  Modelica.Blocks.Interfaces.RealInput Theta
    annotation (Placement(transformation(extent={{-114,26},{-86,54}}),
        iconTransformation(extent={{-104,30},{-74,60}})));
                                             //defaualt values is rad. Theta_deg convert to deg
  Modelica.Blocks.Interfaces.RealInput DNI
    annotation (Placement(transformation(extent={{-114,-16},{-86,12}}),
        iconTransformation(extent={{-102,-46},{-72,-16}})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-114,8},{-86,36}}),
        iconTransformation(extent={{-104,-6},{-76,22}})));

  Modelica.Blocks.Interfaces.IntegerInput Focusing( start=1)
    annotation (Placement(transformation(extent={{-120,-106},{-80,-66}})));
    // "Internal focusing signal. TRUE Defocusing = 0, FALSE Defocusing =1"

//  parameter Boolean PTR "Set true to use the 2008 PTR collector";
/****************** CONSTANTS  *********************/
constant Real pi = Modelica.Constants.pi;
constant Real Sigma = Modelica.Constants.sigma "Stefan-Boltzmann constant";
constant Real gg = Modelica.Constants.g_n
    "Standard acceleration of gravity on earth";

/************** PARAMETER ***********************/
// Optical Parameter //
// parameter Real eps1 "HCE Shadowing"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps2 "Tracking error"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps3 "Geometry error"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real rho_cl "Mirror reflectivity"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps4 "Dirt on Mirrors"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps5 "Dirt on HCE"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps6 "Unaccounted"annotation (Dialog(group="Optical Properties", tab="General"));

//parameter Real Tau_g = if PTR then 0.963 else 0.95 "Glass Transmissivity";
//parameter Real Alpha_g = 0.02
    //"Glass Absorptivity CONSTANT see Forristal pag 18";
//parameter Real Eps_g = if PTR then 0.89 else 0.86
//    "Glass emissivity CONSTANT see Forristal pag 18";
// parameter Real Alpha_t = if PTR then 0.97 else 0.96 "Tube Absorptivity";

/***********Heat loss Coefficients for Vacuum 2008 PTR70 ***********************/
// parameter Real A0 = 4.05 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A1 = 0.247 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A2 = -0.00146 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A3 = 5.65E-6 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A4 = 7.62E-8 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A5 = -1.7 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));
// parameter Real A6 = 0.0125 annotation (Dialog(group="Thermal energy loss correlation coefficients", tab="General"));

/*****************General Geometries**************************/
parameter Integer N = 2 "number of cells";
// import Bricker.Components.Enumerations.SoltiguaPTMx;
// parameter SoltiguaPTMx PTMx=SoltiguaPTMx.PTMx_18 "Soltigua Collector Type";

parameter Modelica.SIunits.Area S=41 "Net Collecting Surface";
parameter Modelica.SIunits.Length I_2=2.37 "Parabola Aperture";
// questa diventa una variabile nel momento che si useranno le enumaration PTMx-18 PTMx-24 ecc ecc
// parameter Integer Nt = 1 "number of tubes";
parameter Modelica.SIunits.Length L=S/I_2 "length of tubes";
// deve derivare dalla enumeration
parameter Modelica.SIunits.Length ll= L/(N-1) "Length of each cell";
// parameter Modelica.SIunits.Length A_P "Aperture of the parabola";
final parameter Modelica.SIunits.Area A_ext_t=pi*Dext_t*L
    "Lateral external area of the tube";
 final parameter Modelica.SIunits.Area S_ext_t=Dext_t*L
    "target surface of incoming radiation from the sun (Cross section without concentration)";
/******************** Geometries&Properties of the tube  *******************************/
parameter Modelica.SIunits.Length Dext_t=0.04 "External diameter tube" annotation (Dialog(group="GeometriesAndProperties of the glass envelope", tab="General"));
//valore inventato, bisogna chiedere maggiori dettagli a soltigua

// parameter Modelica.SIunits.Length th_t "tube thickness" annotation (Dialog(group="GeometriesAndProperties of the glass envelope", tab="General"));
// final parameter Modelica.SIunits.Length rext_t = Dext_t/2
//     " External Radius Glass" annotation (Dialog(group="GeometriesAndProperties of the glass envelope", tab="General"));
// final parameter Modelica.SIunits.Length rint_t= rext_t-th_t
//     "Internal Radius Glass" annotation (Dialog(group="GeometriesAndProperties of the glass envelope", tab="General"));

/*************************** VARIABLES ****************************************/

/******************* Area of Collector and Reflector *****************************/

// Modelica.SIunits.Area Am_t "Area of the metal cross section";
// Modelica.SIunits.Area A_ref "Area of the reflector";
// Modelica.SIunits.Area A_int_t "Total Internal area";
// Modelica.SIunits.Area A_int_t_l "Internal area of a cell";
 Modelica.SIunits.Area S_eff
    "effective collecting area. Depend on the parameter Focusing";
Real K_l( min=0,max=1) "Longitudinal Incident Angle Modifier (IAM)";
Real eta[N] "collector efficiency, as a function of DELTA_T, K_l, DNI";
Real Theta_deg;

 //parameter Integer Focusing=1
    // "Internal focusing signal. TRUE Defocusing = 0, FALSE Defocusing =1"

/********************* TEMPERATURES **********************************/
Modelica.SIunits.Temperature T_fluid[N] "temperature of the fluid";

/************* THERMAL FLOW ****************************************/
Modelica.SIunits.HeatFlowRate Q_tube_tot;

/**************************************** THERMAL FLOW per cell length [W/m] ****************************************/
//Real HL[N] "Heat losses per meter";

/****************************************THERMAL FLUX ****************************************/
Modelica.SIunits.HeatFlux Phi_tube_tot[N] "Heat flux to the tube";
Modelica.SIunits.HeatFlux Phi_conv_f[N] "Heat flux to the fluid";
Modelica.SIunits.HeatFlux Phi_loss_tube[N] "Heat flux loss per tube surface";
// Modelica.SIunits.HeatFlux Phi_loss_ref[N] "Heat flux loss per reflector surface";
//Modelica.SIunits.HeatFlux Phi_loss_ref_m     "Medium heat flux loss per reflector surface";

/**************************************** EFFICIENCIES ****************************************/
// Real eta_opt;
// Real eta_opt_t;

//  Real eta_th[N] "Thermal efficiency at each node";
//  Real eta_TOT[N] "Total efficiency : eta_th * eta_opt_t";
Real Eta_th "Average thermal efficiency";
//  Real Eta_TOT "Total Average efficiency";
  ThermoCycle.Interfaces.HeatTransfer.ThermalPort wall_int(N=N)
   annotation (Placement(transformation(extent={{78,-6},{98,14}}),
        iconTransformation(extent={{80,-10},{100,10}})));

equation
//Total area of the reflector //
// A_ref = L*A_P*Nt;
//
//Geometries of the tube //
//S_ext_t = Dext_t*L;
 // target surface of incoming radiation from the sun (Cross section without concentration)
//A_ext_t = pi*Dext_t*L;
// assert(rext_t > rint_t, "External Radius must be greater than internal radius");
// Am_t= (rext_t^2 - rint_t^2)*pi "Area of the metal cross section";
// A_int_t = pi*(Dext_t-2*th_t)*L*Nt "Total Area of the internal tube";
// A_int_t_l = pi*(Dext_t-2*th_t)*ll*Nt "Total Area of the internal tube";

// Optical efficiency //
// eta_opt = eps1*eps2*eps3*eps4*eps5*eps6*rho_cl*IAM;

// Optical efficiency tube //
// eta_opt_t = eta_opt * Alpha_t;

//Total thermal energy flow on the tube from the Sun [W]. Depend on the Focusing Parameter//

if Focusing ==1 then S_eff =S;
else  S_eff = S_ext_t;
end if;
Theta_deg = Theta *180/pi;
Q_tube_tot = DNI *S_eff*Modelica.Math.cos(Theta);

// Incidence angle modifier //
// PTMx-18
K_l = -7e-07*Theta_deg^3 - 0.0002*Theta_deg^2 + 0.0006*Theta_deg + 1; // Theta in deg. cambier� in funzione del theta. perdite al coseno gi� incluse? non � chiaro dal datasheet

for i in 1:N loop

// eta[i] = K_l * 0.747 - 0.64 * (T_fluid[i]- Tamb) / DNI * (S_eff /S); // l'ultimo termine � un "trucco" per scalare l'efficienza nel caso di defocusing

//Heat losses from the absorber [W/m]
// HL[i] = A0 + A1*(T_fluid[i]- Tamb) + A2*(T_fluid[i]-273.15)^2 + A3*(T_fluid[i]-273.15)^3 + A4*DNI*IAM*(T_fluid[i]-273.15)^2 + (v_wind)^(1/2)*(A5+A6*(T_fluid[i]-Tamb));

// Heat flux to the tube [W/m2]
Phi_tube_tot[i] = Q_tube_tot / A_ext_t;

//Heat loss flux [W/m2]
Phi_loss_tube[i] = Phi_tube_tot[i] - Phi_conv_f[i];

//Heat flux to the fluid
Phi_conv_f[i]= (DNI * Modelica.Math.cos(Theta*pi/180)*( S_eff / S) *S * K_l * 0.747 - S * 0.64 * (T_fluid[i]- Tamb))  / A_ext_t;

//Heat flux losses per reflector area needed for thermal efficiency validation [W/m2]
// Phi_loss_ref[i] = HL[i]*L/ A_ref;

//Efficiency
if Q_tube_tot > 0 then
eta[i] = Phi_conv_f[i] / Phi_tube_tot[i];
// eta_TOT[i] = eta_th[i]*eta_opt_t;
else
eta[i] = 0;
// eta_TOT[i] = 0;
end if;

//Connection

T_fluid[i] = wall_int.T[i];
wall_int.phi[i] = - Phi_conv_f[i];
// wanno bene le connessioni cos�, tanto anche con il wall le temperature sulle superfici sono uguali
end for;
//Thermal loss per reflector surface
// Phi_loss_ref_m = sum(Phi_loss_ref)/N;
//THERMAL EFFICIENCY
Eta_th = sum(eta)/N;
//TOTAL EFFICIENCY
// Eta_TOT = Eta_th * eta_opt_t;
                                                                                                      annotation(Dialog(tab = "Initialisation"),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                     graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics),Documentation(info="<HTML> 
    
    <p><big>It solves the 1D radial energy balance around the Heat Collector Element of a solar collector based on the Schott test analysis
     (see <em>NREL Heat loss Testing of Schott's 2008 PTR70 Parabolic Trough Receiver</em> )
    
    
    
    
    </HTML>"));
end AbsorberSoltiguaWallIAM;
