within Bricker.Components;
model SolarCollectorIncSoltiguaWallIAM
replaceable package Medium1 = ThermoCycle.Media.Therminol66 constrainedby
    Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

/************************************   PARAMETERS ***********************************************/

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
parameter Integer N = 2 "Number of cells";
//parameter Integer Nt = 1 "Number of tubes";

// PARAMETRI DA UTENTE

  import ThermoCycle.Functions.Enumerations.SoltiguaPTMx;
parameter SoltiguaPTMx PTMx=SoltiguaPTMx.PTMx_18;

parameter Modelica.SIunits.Area S=41 "Net Collecting Surface";
parameter Modelica.SIunits.Length I_2=2.37 "Parabola Aperture";
// questa diventa una variabile nel momento che si useranno le enumaration PTMx-18 PTMx-24 ecc ecc
// parameter Integer Nt = 1 "number of tubes";
// DA CAMBIARE CON ENUMERATION

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

final parameter Modelica.SIunits.Length L=S/I_2 "length of tubes";
// deve derivare dalla enumeration
final parameter Modelica.SIunits.Length ll= L/(N-1) "Length of each cell";
// parameter Modelica.SIunits.Length A_P "Aperture of the parabola";

final parameter Modelica.SIunits.Length D_int_t= Dext_t - 2*th_t
    "internal diameter of the metal tube";
final parameter Modelica.SIunits.Area A_lateral= L*D_int_t*pi
    "*NtLateral internal surface of the metal tube";
    final parameter Modelica.SIunits.Area Aext= L*Dext_t*pi
    "*NtLateral external surface of the metal tube";
final parameter Modelica.SIunits.Volume V_tube_int = pi*D_int_t^2/4*L
    "*Nt Internal volume of the metal tube";

     final parameter Modelica.SIunits.Mass M_metal_wall=(pi*Dext_t^2/4*L - V_tube_int) * rho_metal_wall
    "total metal mass for the solar tube";

//parameter Modelica.SIunits.Length A_P "Aperture of the parabola";

parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom
    "Nominal heat transfer coefficient" annotation (Dialog(group="Heat transfer", tab="General"));
parameter Modelica.SIunits.MassFlowRate Mdotnom "Total nominal Mass flow";
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

ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc           Flow1DimInc(redeclare
      package Medium =                                                                            Medium1,
redeclare final model Flow1DimIncHeatTransferModel = FluidHeatTransferModel,
    N=N,
    A=A_lateral,
    V=V_tube_int,
    Unom=Unom,
    pstart=pstart,
    Tstart_inlet=Tstart_inlet,
    Tstart_outlet=Tstart_outlet,
    Mdotnom=Mdotnom,
    steadystate=steadystate_T_fl,
    Discretization=Discretization)
    annotation (Placement(transformation(extent={{-27,-21},{27,21}},
        rotation=90,
        origin={47,19})));
 Bricker.Components.AbsorberSoltiguaWallIAM absorberSoltigua(
    N=N,L=L,ll=ll,I_2=I_2, S=S,
    Dext_t=Dext_t)
    annotation (Placement(transformation(extent={{-26,4},{4,34}})));
  Modelica.Blocks.Interfaces.RealInput v_wind
    annotation (Placement(transformation(extent={{-86,60},{-46,100}}),
        iconTransformation(extent={{-74,66},{-34,106}})));
  Modelica.Blocks.Interfaces.RealInput Theta
    annotation (Placement(transformation(extent={{-88,20},{-48,60}}),
        iconTransformation(extent={{-74,22},{-34,62}})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-90,-6},{-50,34}}),
        iconTransformation(extent={{-72,-24},{-32,16}})));
  Modelica.Blocks.Interfaces.RealInput DNI
    annotation (Placement(transformation(extent={{-86,-46},{-46,-6}}),
        iconTransformation(extent={{-72,-68},{-32,-28}})));
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}}),
        iconTransformation(extent={{-10,-110},{10,-90}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{-10,80},{10,100}}),
        iconTransformation(extent={{-10,92},{10,112}})));

  Modelica.Blocks.Interfaces.BooleanInput Defocusing
    annotation (Placement(transformation(extent={{-106,-84},{-66,-44}}),
        iconTransformation(extent={{-106,-84},{-66,-44}})));

public
record SummaryBase
  replaceable Arrays T_profile;
  record Arrays
   parameter Integer n;
   Modelica.SIunits.Temperature[n] T_fluid;
  end Arrays;
  Real Eta_solarCollector "Total efficiency of solar collector";
  Modelica.SIunits.HeatFlux Philoss "Heat Flux lost to the environment";
  Modelica.SIunits.Power Q_htf
      "Total heat through the termal heat transfer fluid flowing in the solar collector";
end SummaryBase;
replaceable record SummaryClass = SummaryBase;
SummaryClass Summary( T_profile( n=N, T_fluid = absorberSoltigua.T_fluid[:]),Eta_solarCollector= absorberSoltigua.Eta_th,Philoss = 1,Q_htf = Flow1DimInc.Q_tot);

  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-50,-68},{-42,-60}})));
  Modelica.Blocks.Math.BooleanToInteger booleanToInteger
    annotation (Placement(transformation(extent={{-28,-68},{-18,-58}})));
  ThermoCycle.Components.HeatFlow.Walls.MetalWall metalWall(Aext=Aext, Aint=A_lateral,N=N, M_wall=M_metal_wall, c_wall=c_metal_wall) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,18})));

equation
  connect(Theta, absorberSoltigua.Theta) annotation (Line(
      points={{-68,40},{-52,40},{-52,38},{-42,38},{-42,25.75},{-24.35,25.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(v_wind, absorberSoltigua.v_wind) annotation (Line(
      points={{-66,80},{-50,80},{-50,78},{-36,78},{-36,31.75},{-24.35,31.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI, absorberSoltigua.DNI) annotation (Line(
      points={{-66,-26},{-50,-26},{-50,-10},{-32,-10},{-32,14.35},{-24.05,14.35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb, absorberSoltigua.Tamb) annotation (Line(
      points={{-70,14},{-40,14},{-40,20.2},{-24.5,20.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(InFlow, Flow1DimInc.InFlow) annotation (Line(
      points={{0,-90},{47,-90},{47,-3.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Flow1DimInc.OutFlow, OutFlow) annotation (Line(
      points={{46.825,41.5},{46.825,90},{0,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Defocusing, not1.u) annotation (Line(
      points={{-86,-64},{-50.8,-64}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y, booleanToInteger.u) annotation (Line(
      points={{-41.6,-64},{-36,-64},{-36,-63},{-29,-63}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(absorberSoltigua.Focusing, booleanToInteger.y) annotation (Line(
      points={{-26,6.1},{-17.5,6.1},{-17.5,-63}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(metalWall.Wall_int, absorberSoltigua.wall_int) annotation (Line(
      points={{17,18},{10,18},{10,19},{2.5,19}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(metalWall.Wall_ext, Flow1DimInc.Wall_int) annotation (Line(
      points={{23,17.8},{30.5,17.8},{30.5,19},{38.25,19}},
      color={255,0,0},
      smooth=Smooth.None));
                                                                                                      annotation (Dialog(group="Heat transfer", tab="General"),
              Diagram(coordinateSystem(extent={{-60,-100},{60,100}},
          preserveAspectRatio=false),
                      graphics), Icon(coordinateSystem(extent={{-60,-100},{60,100}},
          preserveAspectRatio=false), graphics={Rectangle(
          extent={{-60,100},{60,-100}},
          lineColor={0,0,0},
          fillColor={255,85,85},
          fillPattern=FillPattern.Solid), Text(
          extent={{-28,62},{44,-42}},
          lineColor={0,0,0},
          fillColor={255,85,85},
          fillPattern=FillPattern.Solid,
          textString="Soltigua - Inc")}),
        Documentation(info="<HTML>

<p><big>The <b>SolarCollectorIncSchott</b> model is based on the same modeling concept of the <a href=\"modelica://ThermoCycle.Components.Units.Solar.SolarCollector\">SolarCollector</a> model.
<p><big> The dynamic one-dimensional radial energy balance around the heat collector element is based on the Schott test analysis using the  <a href=\"modelica://ThermoCycle.Components.HeatFlow.Walls.absorberSoltigua\">absorberSoltigua</a> model.
<p><big> The heat transfer fluid in this case is considered incompressible and so the  <a href=\"modelica://ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc\">Flow1DimInc</a> is used.
 </HTML>"));
end SolarCollectorIncSoltiguaWallIAM;
