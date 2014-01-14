within Bricker.Components;
model SolarField "automatic assembly of the solar collectors Soltigua"

    Modelica.Blocks.Interfaces.RealInput v_wind
    annotation (Placement(transformation(extent={{-120,52},{-80,92}}),
        iconTransformation(extent={{9,-11},{-9,11}},
        rotation=90,
        origin={-71,91})));
  Modelica.Blocks.Interfaces.RealInput Theta
    annotation (Placement(transformation(extent={{-120,20},{-80,60}}),
        iconTransformation(extent={{-9.5,-9.5},{9.5,9.5}},
        rotation=-90,
        origin={-31.5,91.5})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-120,-12},{-80,28}}),
        iconTransformation(extent={{-9.5,-9.5},{9.5,9.5}},
        rotation=-90,
        origin={2.5,91.5})));
  Modelica.Blocks.Interfaces.RealInput DNI
    annotation (Placement(transformation(extent={{-120,-38},{-80,2}}),
        iconTransformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={38,92})));
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{-2,-92},{18,-72}}),
        iconTransformation(extent={{-106,2},{-86,22}})));

  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{-6,82},{14,102}}),
        iconTransformation(extent={{84,2},{104,22}})));

//     ThermoCycle.Interfaces.Fluid.FlangeB OutFlowTot(redeclare package Medium =
//           Medium1)
//       annotation (Placement(transformation(extent={{-2,88},{18,108}}),
//           iconTransformation(extent={{-104,-44},{-84,-24}})));

  Modelica.Blocks.Interfaces.BooleanInput Defocusing
    annotation (Placement(transformation(extent={{-120,-94},{-80,-54}}),
        iconTransformation(extent={{-100,-76},{-80,-54}})));

/********************* PARAMETERS FOR THE SOLAR FIELD *********************/
  parameter Integer Ns( min=1)= 2 "number of collector in series" annotation (Dialog(group="Solar Field Proprieties", tab="General"));
  parameter Integer Np( min=1)= 2 "number of parallels" annotation (Dialog(group="Solar Field Proprieties", tab="General"));

  /********************* PARAMETERS FOR THE SOLAR COLLECTOR *********************/
  replaceable package Medium1 = ThermoCycle.Media.Therminol66 constrainedby
    Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

 constant Real  pi = Modelica.Constants.pi;
//FOCUS
// parameter Boolean PTR = true "Set true to use the 2008 PTR collector";
//parameter Boolean UVAC "Choose type of collector";
// /********************* Optical Parameter Values give an eta_opt = 0.7263 *********************/
// parameter Real eps1 = 0.9754 "HCE Shadowing"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps2 = 0.994 "Tracking error"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps3 = 0.98 "Geometry error"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real rho_cl = 0.935 "Mirror reflectivity"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps4 = 0.962566845 "Dirt on Mirrors"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps5 = 0.981283422 "Dirt on HCE"annotation (Dialog(group="Optical Properties", tab="General"));
// parameter Real eps6 = 0.96 "Unaccounted FORSE DA LEVARE"annotation (Dialog(group="Optical Properties", tab="General"));
/********************* Parameter for coefficient of heat transfer air *********************/
// parameter Modelica.SIunits.Pressure Patm= 100000 "Atmosphere Pressure [bar]"annotation (Dialog(group="Vacuum pressure: between metal and glass envelope", tab="General"));

/********************* GEOMETRIES *********************/
parameter Integer N = 2 "Number of cells for the single collector";
//parameter Integer Nt = 1 "Number of tubes";

// PARAMETRI DA UTENTE

// import Bricker.Components.Enumerations.SoltiguaPTMx;
// parameter SoltiguaPTMx PTMx=SoltiguaPTMx.PTMx_18 "Soltigua Collector Type";

// DA CAMBIARE CON ENUMERATION
parameter Modelica.SIunits.Area S=41
    "Net Collecting Surface for the single collector";
parameter Modelica.SIunits.Length I_2=2.37
    "Parabola Aperture for the single collector";
// questa diventa una variabile nel momento che si useranno le enumaration PTMx-18 PTMx-24 ecc ecc
// parameter Integer Nt = 1 "number of tubes";

parameter Modelica.SIunits.Length Dext_t =  0.04 "External diameter tube"
                                                                         annotation (Dialog(group="Properties of the metal envelope", tab="General"));
                              //if PTR then 0.07 elseif UVAC then 0.056 else 0.056
parameter Modelica.SIunits.Length th_t =  0.0004 "tube thickness"
                                                                 annotation (Dialog(group="Properties of the metal envelope", tab="General"));
                      //if PTR then 0.0025 elseif UVAC then 0.003 else 0.003
                      // valori inventati, da correggere con specifiche Soltigua

  parameter Modelica.SIunits.SpecificHeatCapacity c_metal_wall=440
    "specific heat capacity for the metal tube. Stainless Steel = 400 J/kg.K" annotation (Dialog(group="Properties of the metal envelope", tab="General"));
  parameter Modelica.SIunits.Density rho_metal_wall=7800
    "specific heat capacity for the metal tube. Stainless Steel = 7800 kg/m^3" annotation (Dialog(group="Properties of the metal envelope", tab="General"));

/********************* TUBE PROPERTIES *********************/

parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom
    "Nominal heat transfer coefficient" annotation (Dialog(group="Heat transfer", tab="General"));
parameter Modelica.SIunits.MassFlowRate Mdotnom
    "Nominal Mass flow for the single collector";
/* Initialization values */
parameter Modelica.SIunits.Temperature Tstart_inlet
    "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature Tstart_outlet
    "Temperature of the fluid at the outlet of the collector" annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Pressure pstart
    "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
/*steady state */
 parameter Boolean steadystate_T_fl=false
    "if true, sets the derivative of the fluid Temperature in each cell to zero during Initialization"
                                                                                                      annotation (Dialog(group="Intialization options", tab="Initialization"));
// Solar Field Variables
 Modelica.SIunits.MassFlowRate MdotParallelIn
    "Parallel Mass flow in the solar field";
     Modelica.SIunits.MassFlowRate MdotParallelOut
    "Parallel Mass flow in the solar field";

/*******************************************   NUMERICAL OPTION   **************************************/

  import ThermoCycle.Functions.Enumerations.Discretizations;
 parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal
    "Selection of the spatial discretization scheme"  annotation (Dialog(tab="Numerical options"));

/*******************************************   HEAT TRANSFER     ************************************/

/*Secondary fluid*/
 replaceable model FluidHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);

//Bricker.Components.SolarCollectorIncSoltiguaWallIAM SingleSolarCollector(  Medium1=Medium1, N=N,S=S, I_2=I_2, Dext_t=Dext_t, th_t=th_t,  c_metal_wall=c_metal_wall, rho_metal_wall=rho_metal_wall, Unom= Unom,Mdotnom=Mdotnom, Tstart_inlet=Tstart_inlet, Tstart_outlet=Tstart_outlet, pstart=pstart, steadystate_T_fl=steadystate_T_fl, Discretization=Discretization, FluidHeatTransferModel=FluidHeatTransferModel);

  SolarCollectorIncSoltiguaWallIAM[Ns] SingleSolarCollector( redeclare each
      package Medium1 =                                                            Medium1, redeclare
      each final model FluidHeatTransferModel =
                                          FluidHeatTransferModel,                             each        N=N,each S=S, each I_2=I_2, each Dext_t=Dext_t,each th_t=th_t,each  c_metal_wall=c_metal_wall, each rho_metal_wall=rho_metal_wall,each Unom= Unom,each Mdotnom=Mdotnom,each Tstart_inlet=Tstart_inlet,each Tstart_outlet=Tstart_outlet,each pstart=pstart, each steadystate_T_fl=steadystate_T_fl,each Discretization=Discretization)
    annotation (Placement(transformation(extent={{-10,-12},{22,40}})));
  MassFlowMultiplier massFlowMultiplierIn( redeclare package Medium =
        Medium1, pstart=pstart, Np=Np) annotation (Placement(transformation(
        extent={{13,13},{-13,-13}},
        rotation=90,
        origin={7,-35})));
  MassFlowMultiplier massFlowMultiplierOut( redeclare package Medium =
        Medium1, pstart=pstart, Np=Np) annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=90,
        origin={5,63})));
equation

  MdotParallelIn = InFlow.m_flow * Np;
  MdotParallelOut = OutFlow.m_flow * Np;
//
//* BOUNDARY CONDITIONS *//
//  /* Enthalpies */
// InFlowTot.h_outflow = InFlow.h_outflow;
// OutFlowTot.h_outflow = OutFlow.h_outflow;
// /* pressures */
//   OutFlowTot.p = OutFlow.p;
//     InFlowTot.p = InFlow.p;
//
// /*Mass Flow*/
//   MdotParallelIn = InFlow.m_flow;
//   MdotParallelOut = OutFlow.m_flow;
//   InFlowTot.Xi_outflow = inStream(InFlow.Xi_outflow);
//   InFlow.Xi_outflow = inStream(InFlowTot.Xi_outflow);
//     OutFlowTot.Xi_outflow = inStream(OutFlow.Xi_outflow);
//   OutFlow.Xi_outflow = inStream(OutFlowTot.Xi_outflow);
//
//   for i in 1:N-1 loop
//     connect(Cells[i].OutFlow, Cells[i+1].InFlow);
//   end for;

// connectin each row to the external ambient
for i in 1:Ns loop
  connect(SingleSolarCollector[i].v_wind, v_wind)             annotation (Line(
      points={{-8.4,36.36},{-27.2,36.36},{-27.2,72},{-100,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SingleSolarCollector[i].Theta, Theta)             annotation (Line(
      points={{-8.4,24.92},{-32.2,24.92},{-32.2,40},{-100,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb, SingleSolarCollector[i].Tamb)             annotation (Line(
      points={{-100,8},{-39,8},{-39,12.96},{-7.86667,12.96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SingleSolarCollector[i].DNI, DNI)             annotation (Line(
      points={{-7.86667,1.52},{-32.9333,1.52},{-32.9333,-18},{-100,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SingleSolarCollector[i].Defocusing, Defocusing)             annotation (
      Line(
      points={{-16.9333,-2.64},{-16.9333,-33.32},{-100,-33.32},{-100,-74}},
      color={255,0,255},
      smooth=Smooth.None));
end for;
// connectin the first and last collector of the row with the global fluid connectors
  connect(InFlow, massFlowMultiplierIn.OutFlow) annotation (Line(
      points={{8,-82},{6,-82},{6,-48},{7.13,-48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowMultiplierIn.InFlow, SingleSolarCollector[1].InFlow) annotation (
     Line(
      points={{7,-22},{6,-22},{6,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SingleSolarCollector[Ns].OutFlow, massFlowMultiplierOut.InFlow)
    annotation (Line(
      points={{6,40.52},{6,50},{5,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(massFlowMultiplierOut.OutFlow, OutFlow) annotation (Line(
      points={{5.13,76},{5.13,80},{4,80},{4,92}},
      color={0,0,255},
      smooth=Smooth.None));
// connecting the collectors inside one row
for i in 1:Ns-1 loop
  connect(SingleSolarCollector[i].OutFlow, SingleSolarCollector[i+1].InFlow);

end for;

// Balancing Connections
//OutFlow.m_flow = SingleSolarCollector.OutFlow.m_flow;
// InFlow.m_flow = SingleSolarCollector.InFlow.m_flow;
//
//  OutFlow.h_outflow = SingleSolarCollector.OutFlow.h_outflow;
// InFlow.h_outflow = SingleSolarCollector.InFlow.h_outflow;
//OutFlow.p = SingleSolarCollector.OutFlow.p;
// InFlow.p = SingleSolarCollector.InFlow.p;
//
// inStream(OutFlow.h_outflow) = inStream(SingleSolarCollector.OutFlow.h_outflow);
// inStream(OutFlow.h_outflow) = inStream(SingleSolarCollector.OutFlow.h_outflow);

//   connect(OutFlow, OutFlowTot) annotation (Line(
//       points={{8,74},{8,98}},
//       color={0,0,255},
//       smooth=Smooth.None));

// InFlow.m_flow= InFlowTot.m_flow;
// InFlow.h_outflow= InFlowTot.h_outflow;
// InFlow.Xi_outflow= InFlowTot.Xi_outflow;
// InFlow.C_outflow= InFlowTot.C_outflow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={
        Rectangle(
          extent={{-84,80},{84,-68}},
          pattern=LinePattern.Dot,
          lineColor={0,0,0},
          fillColor={239,239,239},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-68,60},{-38,28}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-52,60},{40,28}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-66,-4},{-36,-36}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-50,-4},{42,-36}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{-76,42},{-74,42},{62,42},{66,42}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-74,-22},{-72,-22},{64,-22},{66,-22}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{66,42},{66,-22},{66,-22}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-76,42},{-76,-22},{-70,-22},{-70,-22}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{66,12},{78,12},{86,12}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-90,12},{-76,12},{-76,12}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-44,-52},{42,-66}},
          lineColor={0,0,0},
          pattern=LinePattern.Dot,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Solar Field (Np, Ns)")}),
                                 Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end SolarField;
