within BrickerISES.Components;
package SF

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
  /*****************General Geometries**************************/

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
  Real Eta_tot_N "Efficiency based on Soltigua data sheet";
  Real Eta_tot "Averaged overall Efficiency";
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
    Eta_tot_N = max(Modelica.Constants.small,K_l*0.747 - 0.64*(T_fluid - Tamb)/max(Modelica.Constants.small,DNI));
    Phi_amb = 0.64*(Tamb -T_fluid)*Ns;
    else
    Eta_tot_N = 0;
    Phi_amb = 0.64*(Tamb -T_fluid)*Ns;
    end if;
    Phi_conv_f= Q_tube_tot*Eta_tot_N/ (geometry.A_ext_t*Ns);
  /* Connection */
  T_fluid = wall_int.T;
  wall_int.phi = - Phi_conv_f - Phi_amb;

  Eta_tot =sum(Eta_tot_N);

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

  model SolarField_SoltiguaWall_Inc
    "Solar field model with Soltigua collector for incompressible fluids"
  replaceable package Medium1 = ThermoCycle.Media.DummyFluid
                                             constrainedby
      Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

  /********************* PARAMETERS *******************************************************************/
  constant Real  pi = Modelica.Constants.pi;

  /********************* GEOMETRIES *********************/
  parameter Integer N(min=1) = 2 "Number of cells per collector";
  parameter Integer Ns(min=1) = 1 "Number of Collector in series";
  parameter Integer Nt(min=1) = 1 "Number of collectors in parallel";

  parameter Boolean TotalDefocusing = false "Set to true for total defocusing";
  //parameter Real Defocusing =25"ciao";
      parameter Real Def = 25
      "Percentage value of the SF surface that goes to defocusing (25-50-75)";
  /******* Wall parameter ********************/
  parameter Modelica.SIunits.Mass Mwall = 69;
  parameter Modelica.SIunits.SpecificHeatCapacity cwall = 500;

  /*********************  Heat transfer  *********************/
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=300
      "Coefficient of heat transfer" annotation (Dialog(group="Heat transfer", tab="General"));
  parameter Modelica.SIunits.MassFlowRate Mdotnom "Total nominal Mass flow";

  /* Initial values  */
  parameter Modelica.SIunits.Pressure pstart
      "Pressure of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_inlet
      "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet
      "Temperature of the fluid at the outlet of the collector" annotation (Dialog(tab="Initialization"));

  parameter Modelica.SIunits.Temperature Tstart_inlet_wall
      "Temperature of the wall at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet_wall
      "Temperature of the wall at the outlet of the collector" annotation (Dialog(tab="Initialization"));

  final parameter Modelica.SIunits.Temperature[Ns] Tstart_inlet_collector =  ThermoCycle.Functions.Solar.T_start_inlet(T_start_inlet=Tstart_inlet,T_start_outlet=Tstart_outlet,Ns=Ns);
  final parameter Modelica.SIunits.Temperature[Ns] Tstart_outlet_collector = ThermoCycle.Functions.Solar.T_start_outlet(T_start_inlet=Tstart_inlet,T_start_outlet=Tstart_outlet,Ns=Ns);

  final parameter Modelica.SIunits.Temperature[Ns] T_inlet_wall =  ThermoCycle.Functions.Solar.T_start_inlet(T_start_inlet=Tstart_inlet_wall,T_start_outlet=Tstart_outlet_wall,Ns=Ns);
  final parameter Modelica.SIunits.Temperature[Ns] T_outlet_wall =   ThermoCycle.Functions.Solar.T_start_inlet(T_start_inlet=Tstart_inlet_wall,T_start_outlet=Tstart_outlet_wall,Ns=Ns);

  /*steady state */
  parameter Boolean steadystate_T_fl=false
      "if true, sets the derivative of the fluid Temperature in each cell to zero during Initialization"
                                                                                                        annotation (Dialog(group="Initialization options", tab="Initialization"));
  parameter Boolean steadystate_T_wall=false
      "if true, sets the derivative of the wall Temperature in each cell to zero during Initialization"
                                                                                                        annotation (Dialog(group="Initialization options", tab="Initialization"));

  /*********************************   NUMERICAL OPTION  *************************************************************/
    import ThermoCycle.Functions.Enumerations.Discretizations;
   parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff
      "Selection of the spatial discretization scheme"  annotation (Dialog(tab="Numerical options"));

  /****************** GEOMETRY  *********************/
  inner replaceable parameter
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                          CollectorGeometry
  constrainedby
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                         annotation (choicesAllMatching=true);

  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model FluidHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
     constrainedby
      ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);

  /******************************************  COMPONENTS *********************************************************/

   ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.AbsSoltigua[Ns] SolarAbsorber(each N=N, each geometry=CollectorGeometry,
      TotalDefocusing=TotalDefocusing,
      Defocusing=Def)
      annotation (Placement(transformation(extent={{-24,6},{14,40}})));
    Modelica.Blocks.Interfaces.RealInput v_wind
      annotation (Placement(transformation(extent={{-104,56},{-64,96}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-68,102})));
    Modelica.Blocks.Interfaces.RealInput Theta
      annotation (Placement(transformation(extent={{-102,18},{-62,58}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,60})));
    Modelica.Blocks.Interfaces.RealInput Tamb
      annotation (Placement(transformation(extent={{-102,-8},{-62,32}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,16})));
    Modelica.Blocks.Interfaces.RealInput DNI
      annotation (Placement(transformation(extent={{-104,-38},{-64,2}}),
          iconTransformation(extent={{-15,-15},{15,15}},
          rotation=0,
          origin={-71,-25})));
    ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
          Medium1) annotation (Placement(transformation(extent={{-10,-100},{10,-80}}),
          iconTransformation(extent={{18,-112},{38,-92}})));
    ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
          Medium1) annotation (Placement(transformation(extent={{-10,80},{10,100}}),
          iconTransformation(extent={{30,108},{50,128}})));
    ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc[Ns] flow1DimInc(
      redeclare each package Medium = Medium1,
      redeclare each final model Flow1DimIncHeatTransferModel =
          FluidHeatTransferModel,
      each N=N,
      each Nt=Nt,
      each A=CollectorGeometry.A_ext_t,
      each V=CollectorGeometry.V_tube_int,
      each Mdotnom=Mdotnom,
      each Unom=Unom,
      each pstart=pstart,
      Tstart_inlet=Tstart_inlet_collector,
      Tstart_outlet=Tstart_outlet_collector,
      each steadystate=steadystate_T_fl,
      each Discretization=Discretization) annotation (Placement(transformation(
          extent={{-27.5,-31.5},{27.5,31.5}},
          rotation=90,
          origin={78.5,25.5})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{-64,-48},{-56,-40}})));
    Modelica.Blocks.Math.BooleanToInteger booleanToInteger
      annotation (Placement(transformation(extent={{-46,-40},{-36,-30}})));
    Modelica.Blocks.Interfaces.BooleanInput Defocusing
      annotation (Placement(transformation(extent={{-128,-92},{-88,-52}}),
          iconTransformation(extent={{-90,-88},{-50,-48}})));
    ThermoCycle.Components.HeatFlow.Walls.MetalWall[Ns] metalWall(
      each N=N,
      each M_wall=Mwall,
      each c_wall=cwall,
      Tstart_wall_1 = T_inlet_wall,
      Tstart_wall_end = T_outlet_wall,
      each steadystate_T_wall = steadystate_T_wall,
      each Aext=CollectorGeometry.A_int_t,
      each Aint=CollectorGeometry.A_ext_t)
      annotation (Placement(transformation(extent={{-16,16},{16,-16}},
          rotation=90,
          origin={40,22})));

  /* Summary Class */

  public
    record SummaryBase
      replaceable Arrays T_profile;
      record Arrays
       parameter Integer n;
       parameter Integer Ns;
       Modelica.SIunits.Temperature[Ns,n] T_fluid;
      end Arrays;
      Real Eta_solarCollector "Total efficiency of solar collector";
      Modelica.SIunits.Power Q_htf
        "Total heat through the termal heat transfer fluid flowing in the solar collector";
    end SummaryBase;
    replaceable record SummaryClass = SummaryBase;
    SummaryClass Summary( T_profile( n=N, Ns=Ns,T_fluid = T_fluid_),Eta_solarCollector=Eta_tot,Q_htf = Q_tot);
  protected
     Modelica.SIunits.Temperature T_fluid_[Ns,N];
    //,Eta_solarCollector= absorberSchott.Eta_TOT,Philoss = absorberSchott.Phi_loss_ref_m,Q_htf = flow1Dim.Q_tot);
   Real Eta_tot "Total efficiency";
   Modelica.SIunits.HeatFlowRate Q_tot
      "Total thermal energy flow on the tube from the sun [W]";

  equation
     for i in 1:Ns loop
       for k in 1:N loop
       T_fluid_[i,k] = flow1DimInc[i].Cells[k].T;
       end for;
     end for;
  Eta_tot = sum(SolarAbsorber[:].Eta_tot)/Ns;
  Q_tot = sum(flow1DimInc[:].Q_tot) "Total power absorbed by the fluid";

  for i in 1:Ns loop
       connect(Theta, SolarAbsorber[i].Theta) annotation (Line(
        points={{-82,38},{-42,38},{-42,30.65},{-21.91,30.65}},
        color={0,0,127},
        smooth=Smooth.None));
             connect(v_wind, SolarAbsorber[i].v_wind) annotation (Line(
        points={{-84,76},{-36,76},{-36,37.45},{-21.91,37.45}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb, SolarAbsorber[i].Tamb) annotation (Line(
        points={{-82,12},{-44,12},{-44,24.36},{-22.1,24.36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(DNI, SolarAbsorber[i].DNI) annotation (Line(
        points={{-84,-18},{-34,-18},{-34,17.73},{-21.53,17.73}},
        color={0,0,127},
        smooth=Smooth.None));
      connect(booleanToInteger.y, SolarAbsorber[i].Focusing) annotation (Line(
        points={{-35.5,-35},{-24,-35},{-24,8.38}},
        color={255,127,0},
        smooth=Smooth.None));

  end for;

      for i in 1: Ns - 1 loop
    connect(flow1DimInc[i].OutFlow,flow1DimInc[i+1].InFlow);
  end for;

    connect(OutFlow, flow1DimInc[Ns].OutFlow) annotation (Line(
        points={{0,90},{78.2375,90},{78.2375,48.4167}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(InFlow, flow1DimInc[1].InFlow) annotation (Line(
        points={{0,-90},{28,-90},{28,-86},{78.5,-86},{78.5,2.58333}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Defocusing,not1. u) annotation (Line(
        points={{-108,-72},{-74,-72},{-74,-44},{-64.8,-44}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(not1.y,booleanToInteger. u) annotation (Line(
        points={{-55.6,-44},{-52,-44},{-52,-35},{-47,-35}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(booleanToInteger.y, SolarAbsorber[1].Focusing) annotation (Line(
        points={{-35.5,-35},{-24,-35},{-24,8.38}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(SolarAbsorber.wall_int, metalWall.Wall_ext) annotation (Line(
        points={{12.1,23},{24.05,23},{24.05,21.68},{35.2,21.68}},
        color={255,0,0},
        smooth=Smooth.None));
    connect(metalWall.Wall_int, flow1DimInc.Wall_int) annotation (Line(
        points={{44.8,22},{56,22},{56,25.5},{65.375,25.5}},
        color={255,0,0},
        smooth=Smooth.None));
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),
                Diagram(coordinateSystem(extent={{-80,-100},{100,120}},
            preserveAspectRatio=false),
                        graphics), Icon(coordinateSystem(extent={{-80,-100},{100,
              120}},
            preserveAspectRatio=false), graphics={
            Bitmap(extent={{-96,118},{126,-100}}, fileName=
                "modelica://ThermoCycle/Resources/Images/Avatar_SF.jpg"),
                                            Text(
            extent={{-80,114},{66,90}},
            lineColor={0,0,0},
            fillColor={255,85,85},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Text(
            extent={{-68,-28},{-38,-38}},
            lineColor={0,0,0},
            textString="DNI"),
          Text(
            extent={{-62,10},{-36,2}},
            lineColor={0,0,0},
            textString="Tamb[K]"),
          Text(
            extent={{-70,50},{-20,42}},
            lineColor={0,0,0},
            textString="Theta[rad]"),
          Text(
            extent={{-62,96},{-30,80}},
            lineColor={0,0,0},
            textString="V_wind [m/s]"),
          Text(
            extent={{-56,-72},{-26,-82}},
            lineColor={0,0,0},
            textString="Defocusing")}),
                                   Documentation(info="<HTML>

<p><big>The <b>SolarField_Soltigua_Inc</b> model is based on the same modeling concept of the <a href=\"modelica://ThermoCycle.Components.Units.Solar.SolarField_Soltigua\">SolarField_Soltigua</a> model.
 <p><big> In this case the fluid flow through the solar collector is modeled as an incompressible fluid.
 </HTML>"));
  end SolarField_SoltiguaWall_Inc;

  model SF_SoltiguaL_CellLMTD
    "Solar field model with Soltigua collector for incompressible fluids"
  replaceable package Medium = ThermoCycle.Media.DummyFluid
                                             constrainedby
      Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

  /********************* PARAMETERS *******************************************************************/
  constant Real  pi = Modelica.Constants.pi;

  /********************* GEOMETRIES *********************/
  parameter Integer Nt(min=1) = 1 "Number of collectors in parallel";
  parameter Integer Ns(min=1) = 1 "Number of Collector in series";
  parameter Boolean TotalDefocusing = false "Set to true for total defocusing";

  parameter Real Def = 25
      "Percentage value of the SF surface that goes to defocusing (25-50-75)";

  parameter Modelica.SIunits.Mass Mwf = 300 "Mass of the working fluid"
                          annotation (Dialog( tab="General"));
      /******* Wall parameter ********************/
  parameter Modelica.SIunits.Mass Mwall = 69;
  parameter Modelica.SIunits.SpecificHeatCapacity cwall = 500;

  /*********************  Heat transfer  *********************/
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=300
      "Coefficient of heat transfer" annotation (Dialog(group="Heat transfer", tab="General"));
  parameter Modelica.SIunits.MassFlowRate Mdotnom "Total nominal Mass flow";

  /*********************  Initial values  *********************/
  parameter Modelica.SIunits.Pressure pstart
      "Pressure of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_inlet
      "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet
      "Temperature of the fluid at the outlet of the collector" annotation (Dialog(tab="Initialization"));
   parameter Modelica.SIunits.Temperature Tstart_inlet_wall = Tstart_inlet+5
      "Temperature of the wall at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet_wall= Tstart_outlet +5
      "Temperature of the wall at the outlet of the collector" annotation (Dialog(tab="Initialization"));

  parameter Boolean steadystate_T_wall=false
      "if true, sets the derivative of the wall Temperature in each cell to zero during Initialization"
                                                                                                        annotation (Dialog(group="Initialization options", tab="Initialization"));
   parameter Boolean T_wall_fixed=false
      "if true, imposes the initial wall temperature"                                    annotation (Dialog(group="Metal wall", tab="Initialization"));

  parameter Boolean Cp_constant=false
      "if true, sets the fluid specific heat capacity, Cp, on the two side of the HX to a constant value computed with inital conditions";

  /****************** GEOMETRY  *********************/
  inner replaceable parameter
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                          CollectorGeometry
  constrainedby
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                         annotation (choicesAllMatching=true);

  /******************************************  COMPONENTS *********************************************************/

    Modelica.Blocks.Interfaces.RealInput v_wind
      annotation (Placement(transformation(extent={{-104,56},{-64,96}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-68,102})));
    Modelica.Blocks.Interfaces.RealInput Theta
      annotation (Placement(transformation(extent={{-102,18},{-62,58}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,60})));
    Modelica.Blocks.Interfaces.RealInput Tamb
      annotation (Placement(transformation(extent={{-102,-8},{-62,32}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,16})));
    Modelica.Blocks.Interfaces.RealInput DNI
      annotation (Placement(transformation(extent={{-104,-38},{-64,2}}),
          iconTransformation(extent={{-15,-15},{15,15}},
          rotation=0,
          origin={-71,-25})));
    ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,-100},{10,-80}}),
          iconTransformation(extent={{18,-112},{38,-92}})));
    ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,80},{10,100}}),
          iconTransformation(extent={{30,108},{50,128}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{-64,-48},{-56,-40}})));
    Modelica.Blocks.Math.BooleanToInteger booleanToInteger
      annotation (Placement(transformation(extent={{-46,-40},{-36,-30}})));
    Modelica.Blocks.Interfaces.BooleanInput Defocusing
      annotation (Placement(transformation(extent={{-128,-92},{-88,-52}}),
          iconTransformation(extent={{-90,-88},{-50,-48}})));

  public
    CellLMTD cellLMTD(redeclare package Medium =
          Medium,
      Nt=Nt,
      M_wall=Mwall,
      c_wall=cwall,
      U_ps=Unom,
      M_ps=Mwf,
      MdotNom_ps=Mdotnom,
      p_ps_start=pstart,
      T_ps_su_start=Tstart_inlet,
      T_ps_ex_start=Tstart_outlet,
      T_w_1_start=Tstart_inlet_wall,
      T_w_2_start=Tstart_outlet_wall,
      steadystate_T_wall=steadystate_T_wall,
      T_wall_fixed=T_wall_fixed,
      Cp_constant=Cp_constant,
      A_ps=CollectorGeometry.A_ext_t*Ns)
      annotation (Placement(transformation(
          extent={{-10,-2},{10,2}},
          rotation=90,
          origin={72,24})));
    AbsSoltiguaL absSoltiguaL(Ns=Ns,geometry=CollectorGeometry,TotalDefocusing=TotalDefocusing, Defocusing=Def)
                              annotation (Placement(transformation(extent={{-32,8},{18,46}})));
  equation

    connect(Defocusing,not1. u) annotation (Line(
        points={{-108,-72},{-74,-72},{-74,-44},{-64.8,-44}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(not1.y,booleanToInteger. u) annotation (Line(
        points={{-55.6,-44},{-52,-44},{-52,-35},{-47,-35}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(InFlow, cellLMTD.InFlowPs) annotation (Line(
        points={{0,-90},{40,-90},{40,-86},{72.2,-86},{72.2,13.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(cellLMTD.OutFlowPs, OutFlow)
      annotation (Line(
        points={{72.2,35},{72.2,90},{0,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v_wind, absSoltiguaL.v_wind) annotation (Line(
        points={{-84,76},{-48,76},{-48,43.15},{-29.25,43.15}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta, absSoltiguaL.Theta) annotation (Line(
        points={{-82,38},{-52,38},{-52,36},{-29.25,36},{-29.25,35.55}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb, absSoltiguaL.Tamb) annotation (Line(
        points={{-82,12},{-68,12},{-68,16},{-50,16},{-50,28.52},{-29.5,28.52}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(DNI, absSoltiguaL.DNI) annotation (Line(
        points={{-84,-18},{-68,-18},{-68,-10},{-42,-10},{-42,21.11},{-28.75,21.11}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanToInteger.y, absSoltiguaL.Focusing) annotation (Line(
        points={{-35.5,-35},{14,-35},{14,0},{-20,0},{-20,10.66},{-32,10.66}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(absSoltiguaL.wall_int, cellLMTD.Wall_ext)
      annotation (Line(
        points={{15.5,27},{52,27},{52,23.4},{69.2,23.4}},
        color={255,0,0},
        smooth=Smooth.None));

                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),
                Diagram(coordinateSystem(extent={{-80,-100},{100,120}},
            preserveAspectRatio=false),
                        graphics), Icon(coordinateSystem(extent={{-80,-100},{100,
              120}},
            preserveAspectRatio=false), graphics={
            Bitmap(extent={{-96,118},{126,-100}}, fileName=
                "modelica://ThermoCycle/Resources/Images/Avatar_SF.jpg"),
                                            Text(
            extent={{-80,114},{66,90}},
            lineColor={0,0,0},
            fillColor={255,85,85},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Text(
            extent={{-68,-28},{-38,-38}},
            lineColor={0,0,0},
            textString="DNI"),
          Text(
            extent={{-62,10},{-36,2}},
            lineColor={0,0,0},
            textString="Tamb[K]"),
          Text(
            extent={{-70,50},{-20,42}},
            lineColor={0,0,0},
            textString="Theta[rad]"),
          Text(
            extent={{-62,96},{-30,80}},
            lineColor={0,0,0},
            textString="V_wind [m/s]"),
          Text(
            extent={{-56,-72},{-26,-82}},
            lineColor={0,0,0},
            textString="Defocusing")}),
                                   Documentation(info="<HTML>

<p><big>The <b>SolarField_Soltigua_Inc</b> model is based on the same modeling concept of the <a href=\"modelica://ThermoCycle.Components.Units.Solar.SolarField_Soltigua\">SolarField_Soltigua</a> model.
 <p><big> In this case the fluid flow through the solar collector is modeled as an incompressible fluid.
 </HTML>"));
  end SF_SoltiguaL_CellLMTD;

  model SF_SoltiguaL_AirCell
    "Solar field model with Soltigua collector for incompressible fluids"
  replaceable package Medium = ThermoCycle.Media.DummyFluid
                                             constrainedby
      Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

  /********************* PARAMETERS *******************************************************************/
  constant Real  pi = Modelica.Constants.pi;

  /********************* GEOMETRIES *********************/
  parameter Integer Nt(min=1) = 1 "Number of collectors in parallel";
  parameter Integer Ns(min=1) = 1 "Number of Collector in series";
  parameter Boolean TotalDefocusing = false "Set to true for total defocusing";

  parameter Real Def = 25
      "Percentage value of the SF surface that goes to defocusing (25-50-75)";

      /******* Wall parameter ********************/
  parameter Modelica.SIunits.Mass Mwall = 69;
  parameter Modelica.SIunits.SpecificHeatCapacity cwall = 500;

  /*********************  Heat transfer  *********************/
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=300
      "Coefficient of heat transfer" annotation (Dialog(group="Heat transfer", tab="General"));
  parameter Modelica.SIunits.MassFlowRate Mdotnom "Total nominal Mass flow";

  /*********************  Initial values  *********************/
  parameter Modelica.SIunits.Pressure pstart
      "Pressure of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_inlet
      "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet
      "Temperature of the fluid at the outlet of the collector" annotation (Dialog(tab="Initialization"));
   parameter Modelica.SIunits.Temperature Tstart_inlet_wall = Tstart_inlet+5
      "Temperature of the wall at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet_wall= Tstart_outlet +5
      "Temperature of the wall at the outlet of the collector" annotation (Dialog(tab="Initialization"));

  parameter Boolean steadystate_T_wall=false
      "if true, sets the derivative of the wall Temperature in each cell to zero during Initialization"
                                                                                                        annotation (Dialog(group="Initialization options", tab="Initialization"));
   parameter Boolean T_wall_fixed=false
      "if true, imposes the initial wall temperature"                                    annotation (Dialog(group="Metal wall", tab="Initialization"));

  parameter Boolean Cp_constant=false
      "if true, sets the fluid specific heat capacity, Cp, on the two side of the HX to a constant value computed with inital conditions";

  /****************** GEOMETRY  *********************/
  inner replaceable parameter
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                          CollectorGeometry
  constrainedby
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                         annotation (choicesAllMatching=true);
  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model FluidHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
     constrainedby
      ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);
  //SF.Summary.Q_htf
  /******************************************  COMPONENTS *********************************************************/

    Modelica.Blocks.Interfaces.RealInput v_wind
      annotation (Placement(transformation(extent={{-104,56},{-64,96}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-68,102})));
    Modelica.Blocks.Interfaces.RealInput Theta
      annotation (Placement(transformation(extent={{-102,18},{-62,58}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,60})));
    Modelica.Blocks.Interfaces.RealInput Tamb
      annotation (Placement(transformation(extent={{-102,-8},{-62,32}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,16})));
    Modelica.Blocks.Interfaces.RealInput DNI
      annotation (Placement(transformation(extent={{-104,-38},{-64,2}}),
          iconTransformation(extent={{-15,-15},{15,15}},
          rotation=0,
          origin={-71,-25})));
    ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,-100},{10,-80}}),
          iconTransformation(extent={{18,-112},{38,-92}})));
    ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,80},{10,100}}),
          iconTransformation(extent={{30,108},{50,128}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{-64,-48},{-56,-40}})));
    Modelica.Blocks.Math.BooleanToInteger booleanToInteger
      annotation (Placement(transformation(extent={{-46,-40},{-36,-30}})));
    Modelica.Blocks.Interfaces.BooleanInput Defocusing
      annotation (Placement(transformation(extent={{-128,-92},{-88,-52}}),
          iconTransformation(extent={{-90,-88},{-50,-48}})));

    AbsSoltiguaL SolarAbsorber(
      Ns=Ns,
      geometry=CollectorGeometry,
      TotalDefocusing=TotalDefocusing,
      Defocusing=Def)
      annotation (Placement(transformation(extent={{-32,8},{18,46}})));
    ThermoCycle.Components.FluidFlow.Pipes.AirCell airCell(
    redeclare package Medium =
          Medium,
    redeclare final model HeatTransfer =
          FluidHeatTransferModel,
      Mdotnom=Mdotnom,
      Unom=Unom,
      Nt=Nt,
      Vi=CollectorGeometry.V_tube_int*Ns,
      Ai=CollectorGeometry.A_ext_t*Ns,
      T_start=(Tstart_inlet + Tstart_outlet)/2)                     annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={76,18})));
    ThermoCycle.Components.HeatFlow.Walls.MetalWallL metalWallL(
      c_wall=cwall,
      Aext=CollectorGeometry.A_ext_t*Ns,
      Aint=CollectorGeometry.A_int_t*Ns,
      M_wall=Mwal*Ns)
                    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={46,24})));

  record SummaryBase
      Real Eta_solarCollector "Total efficiency of solar collector";
      Modelica.SIunits.Power Q_htf
        "Total heat through the termal heat transfer fluid flowing in the solar collector";
  end SummaryBase;
    replaceable record SummaryClass = SummaryBase;
    SummaryClass Summary( Eta_solarCollector=Eta_tot,Q_htf = Q_tot);
  protected
   Real Eta_tot "Total efficiency";
   Modelica.SIunits.HeatFlowRate Q_tot
      "Total thermal energy flow on the tube from the sun [W]";
  equation
  Eta_tot = SolarAbsorber.Eta_tot;
  Q_tot = airCell.Q_tot*Nt "Total power absorbed by the fluid";

    connect(Defocusing,not1. u) annotation (Line(
        points={{-108,-72},{-74,-72},{-74,-44},{-64.8,-44}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(not1.y,booleanToInteger. u) annotation (Line(
        points={{-55.6,-44},{-52,-44},{-52,-35},{-47,-35}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(v_wind, SolarAbsorber.v_wind) annotation (Line(
        points={{-84,76},{-48,76},{-48,43.15},{-29.25,43.15}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta, SolarAbsorber.Theta) annotation (Line(
        points={{-82,38},{-52,38},{-52,36},{-29.25,36},{-29.25,35.55}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb, SolarAbsorber.Tamb) annotation (Line(
        points={{-82,12},{-68,12},{-68,16},{-50,16},{-50,28.52},{-29.5,28.52}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(DNI, SolarAbsorber.DNI) annotation (Line(
        points={{-84,-18},{-68,-18},{-68,-10},{-42,-10},{-42,21.11},{-28.75,21.11}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(booleanToInteger.y, SolarAbsorber.Focusing) annotation (Line(
        points={{-35.5,-35},{14,-35},{14,0},{-20,0},{-20,10.66},{-32,10.66}},
        color={255,127,0},
        smooth=Smooth.None));

    connect(InFlow, airCell.InFlow) annotation (Line(
        points={{0,-90},{36,-90},{36,-82},{76,-82},{76,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(airCell.OutFlow, OutFlow) annotation (Line(
        points={{75.9,28},{76,28},{76,90},{0,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(metalWallL.Wall_int, airCell.Wall_ext) annotation (Line(
        points={{49,24},{52,24},{52,22},{56,22},{56,18},{71,18}},
        color={255,0,0},
        smooth=Smooth.None));
    connect(metalWallL.Wall_ext, SolarAbsorber.wall_int) annotation (Line(
        points={{43,24.2},{34,24.2},{34,27},{15.5,27}},
        color={255,0,0},
        smooth=Smooth.None));
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),
                Diagram(coordinateSystem(extent={{-80,-100},{100,120}},
            preserveAspectRatio=false),
                        graphics), Icon(coordinateSystem(extent={{-80,-100},{100,
              120}},
            preserveAspectRatio=false), graphics={
            Bitmap(extent={{-96,118},{126,-100}}, fileName=
                "modelica://ThermoCycle/Resources/Images/Avatar_SF.jpg"),
                                            Text(
            extent={{-80,114},{66,90}},
            lineColor={0,0,0},
            fillColor={255,85,85},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Text(
            extent={{-68,-28},{-38,-38}},
            lineColor={0,0,0},
            textString="DNI"),
          Text(
            extent={{-62,10},{-36,2}},
            lineColor={0,0,0},
            textString="Tamb[K]"),
          Text(
            extent={{-70,50},{-20,42}},
            lineColor={0,0,0},
            textString="Theta[rad]"),
          Text(
            extent={{-62,96},{-30,80}},
            lineColor={0,0,0},
            textString="V_wind [m/s]"),
          Text(
            extent={{-56,-72},{-26,-82}},
            lineColor={0,0,0},
            textString="Defocusing")}),
                                   Documentation(info="<HTML>

<p><big>The <b>SolarField_Soltigua_Inc</b> model is based on the same modeling concept of the <a href=\"modelica://ThermoCycle.Components.Units.Solar.SolarField_Soltigua\">SolarField_Soltigua</a> model.
 <p><big> In this case the fluid flow through the solar collector is modeled as an incompressible fluid.
 </HTML>"));
  end SF_SoltiguaL_AirCell;

  model SF_SoltiguaL_IncNoWall
    "Solar field model with Soltigua collector for incompressible fluids"
  replaceable package Medium = ThermoCycle.Media.DummyFluid
                                             constrainedby
      Modelica.Media.Interfaces.PartialMedium                                                      annotation (choicesAllMatching = true);

  /********************* PARAMETERS *******************************************************************/
  constant Real  pi = Modelica.Constants.pi;

  /********************* GEOMETRIES *********************/
  parameter Integer Nt(min=1) = 1 "Number of collectors in parallel";
  parameter Integer Ns(min=1) = 1 "Number of Collector in series";
  parameter Boolean TotalDefocusing = false "Set to true for total defocusing";

  parameter Real Def = 25
      "Percentage value of the SF surface that goes to defocusing (25-50-75)";

  /*********************  Heat transfer  *********************/
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=300
      "Coefficient of heat transfer" annotation (Dialog(group="Heat transfer", tab="General"));
  parameter Modelica.SIunits.MassFlowRate Mdotnom "Total nominal Mass flow";

  /*********************  Initial values  *********************/
  parameter Modelica.SIunits.Pressure pstart
      "Pressure of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_inlet
      "Temperature of the fluid at the inlet of the collector" annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet
      "Temperature of the fluid at the outlet of the collector" annotation (Dialog(tab="Initialization"));

    parameter Boolean steadystate_wf=true
      "if true, sets the derivative of h (working fluids enthalpy in each cell) to zero during Initialization"
      annotation (Dialog(group="Initialization options", tab="Initialization"));

  /****************** GEOMETRY  *********************/
  inner replaceable parameter
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                          CollectorGeometry
  constrainedby
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.BaseGeometry
                                                                                         annotation (choicesAllMatching=true);
  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model FluidHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
     constrainedby
      ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);
  //SF.Summary.Q_htf
  /******************************************  COMPONENTS *********************************************************/

    Modelica.Blocks.Interfaces.RealInput v_wind
      annotation (Placement(transformation(extent={{-104,56},{-64,96}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-68,102})));
    Modelica.Blocks.Interfaces.RealInput Theta
      annotation (Placement(transformation(extent={{-102,18},{-62,58}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,60})));
    Modelica.Blocks.Interfaces.RealInput Tamb
      annotation (Placement(transformation(extent={{-102,-8},{-62,32}}),
          iconTransformation(extent={{-14,-14},{14,14}},
          rotation=0,
          origin={-70,16})));
    Modelica.Blocks.Interfaces.RealInput DNI
      annotation (Placement(transformation(extent={{-104,-38},{-64,2}}),
          iconTransformation(extent={{-15,-15},{15,15}},
          rotation=0,
          origin={-71,-25})));
    ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,-100},{10,-80}}),
          iconTransformation(extent={{18,-112},{38,-92}})));
    ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{-10,80},{10,100}}),
          iconTransformation(extent={{30,108},{50,128}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{-64,-48},{-56,-40}})));
    Modelica.Blocks.Math.BooleanToInteger booleanToInteger
      annotation (Placement(transformation(extent={{-46,-40},{-36,-30}})));
    Modelica.Blocks.Interfaces.BooleanInput Defocusing
      annotation (Placement(transformation(extent={{-128,-92},{-88,-52}}),
          iconTransformation(extent={{-90,-88},{-50,-48}})));

    AbsSoltiguaL SolarAbsorber(
      Ns=Ns,
      geometry=CollectorGeometry,
      TotalDefocusing=TotalDefocusing,
      Defocusing=Def)
      annotation (Placement(transformation(extent={{-32,8},{18,46}})));
  ThermoCycle.Components.FluidFlow.Pipes.Cell1DimInc Cell_wf(
    redeclare package Medium =
          Medium,
    redeclare final model HeatTransfer =
          FluidHeatTransferModel,
      Mdotnom=Mdotnom,
      Unom=Unom,
      Nt=Nt,
      pstart=pstart,
      Vi=CollectorGeometry.V_tube_int*Ns,
      Ai=CollectorGeometry.A_ext_t*Ns,
      steadystate=steadystate_wf,
      hstart=Medium.specificEnthalpy_pTX(pstart,(Tstart_inlet + Tstart_outlet)/2,fill(0,0)))                     annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={78,14})));

  record SummaryBase
      Real Eta_solarCollector "Total efficiency of solar collector";
      Modelica.SIunits.Power Q_htf
        "Total heat through the termal heat transfer fluid flowing in the solar collector";
  end SummaryBase;
    replaceable record SummaryClass = SummaryBase;
    SummaryClass Summary( Eta_solarCollector=Eta_tot,Q_htf = Q_tot);
  protected
   Real Eta_tot "Total efficiency";
   Modelica.SIunits.HeatFlowRate Q_tot
      "Total thermal energy flow on the tube from the sun [W]";
  equation
  Eta_tot = SolarAbsorber.Eta_tot;
  Q_tot = Cell_wf.Q_tot*Nt "Total power absorbed by the fluid";

    connect(Defocusing,not1. u) annotation (Line(
        points={{-108,-72},{-74,-72},{-74,-44},{-64.8,-44}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(not1.y,booleanToInteger. u) annotation (Line(
        points={{-55.6,-44},{-52,-44},{-52,-35},{-47,-35}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(v_wind, SolarAbsorber.v_wind) annotation (Line(
        points={{-84,76},{-48,76},{-48,43.15},{-29.25,43.15}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta, SolarAbsorber.Theta) annotation (Line(
        points={{-82,38},{-52,38},{-52,36},{-29.25,36},{-29.25,35.55}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb, SolarAbsorber.Tamb) annotation (Line(
        points={{-82,12},{-68,12},{-68,16},{-50,16},{-50,28.52},{-29.5,28.52}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(DNI, SolarAbsorber.DNI) annotation (Line(
        points={{-84,-18},{-68,-18},{-68,-10},{-42,-10},{-42,21.11},{-28.75,21.11}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(booleanToInteger.y, SolarAbsorber.Focusing) annotation (Line(
        points={{-35.5,-35},{14,-35},{14,0},{-20,0},{-20,10.66},{-32,10.66}},
        color={255,127,0},
        smooth=Smooth.None));

    connect(InFlow,Cell_wf. InFlow) annotation (Line(
        points={{0,-90},{36,-90},{36,-82},{78,-82},{78,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Cell_wf.OutFlow, OutFlow) annotation (Line(
        points={{77.9,24},{76,24},{76,90},{0,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SolarAbsorber.wall_int, Cell_wf.Wall_int) annotation (Line(
        points={{15.5,27},{38,27},{38,14},{73,14}},
        color={255,0,0},
        smooth=Smooth.None));
                                                                                                        annotation (Dialog(group="Heat transfer", tab="General"),
                Diagram(coordinateSystem(extent={{-80,-100},{100,120}},
            preserveAspectRatio=false),
                        graphics), Icon(coordinateSystem(extent={{-80,-100},{100,
              120}},
            preserveAspectRatio=false), graphics={
            Bitmap(extent={{-96,118},{126,-100}}, fileName=
                "modelica://ThermoCycle/Resources/Images/Avatar_SF.jpg"),
                                            Text(
            extent={{-80,114},{66,90}},
            lineColor={0,0,0},
            fillColor={255,85,85},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Text(
            extent={{-68,-28},{-38,-38}},
            lineColor={0,0,0},
            textString="DNI"),
          Text(
            extent={{-62,10},{-36,2}},
            lineColor={0,0,0},
            textString="Tamb[K]"),
          Text(
            extent={{-70,50},{-20,42}},
            lineColor={0,0,0},
            textString="Theta[rad]"),
          Text(
            extent={{-62,96},{-30,80}},
            lineColor={0,0,0},
            textString="V_wind [m/s]"),
          Text(
            extent={{-56,-72},{-26,-82}},
            lineColor={0,0,0},
            textString="Defocusing")}),
                                   Documentation(info="<HTML>

<p><big>The <b>SolarField_Soltigua_Inc</b> model is based on the same modeling concept of the <a href=\"modelica://ThermoCycle.Components.Units.Solar.SolarField_Soltigua\">SolarField_Soltigua</a> model.
 <p><big> In this case the fluid flow through the solar collector is modeled as an incompressible fluid.
 </HTML>"));
  end SF_SoltiguaL_IncNoWall;
end SF;
