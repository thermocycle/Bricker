within BrickerISES.Obsolete;
model SimpleBiomassSystemCombustionDynamic_AD

  import BrickerISES.Constants;
  replaceable package Medium1 =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "In Hx1DInc: Secondary fluid" annotation (choicesAllMatching=true);

  ThermoCycle.Interfaces.Fluid.FlangeA inlet(redeclare package Medium = Medium1)
    annotation (Placement(transformation(extent={{90,-80},{110,-60}}),
        iconTransformation(extent={{90,-80},{110,-60}})));
  ThermoCycle.Interfaces.Fluid.FlangeB outlet(redeclare package Medium =
        Medium1) annotation (Placement(transformation(extent={{94,56},{114,76}}),
        iconTransformation(extent={{94,56},{114,76}})));
  Modelica.Blocks.Interfaces.RealInput CombustionPowerCommand "0-1" annotation (
     Placement(transformation(extent={{108,0},{90,26}}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-56,95})));
  Modelica.Blocks.Interfaces.RealInput PumpFlowfraction "1--> Nominal value" annotation (
      Placement(transformation(
        extent={{12,-11},{-12,11}},
        rotation=90,
        origin={-23,100}),iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={22,95})));

  /************* BIOMASS BOOLIER PARAMETERS  *******************/

  replaceable model combustionDynamic =
      BrickerISES.Components.Biomass.CombustionDynamic.LinearPowerCombustion
    constrainedby
    BrickerISES.Components.Biomass.CombustionDynamic.PartialCombustionDynamic
    annotation (
    Placement(transformation(extent={{-28,-2},{-8,18}})),
    Dialog(group="Biomass Boiler", tab="General"),
    choicesAllMatching=true);

  parameter Real BoilerEfficiency = 0.85 "Biomass boiler efficiency";

  parameter Modelica.SIunits.Power Qcombustion_Nominal=1e6
    "Nominal Biomass Boiler Power"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  parameter Modelica.SIunits.Time t_startup=40*60
    "time [s] required to start up the combustion from 0 to Nominal Power"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  parameter Modelica.SIunits.Power Qcombustion_Min=1e6
    "Min Biomass Boiler Power"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.Power Qcombustion_start=0
    "Min Biomass Boiler Power"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  /******************************** Geometries ***********************************/

  parameter Integer N=5 "Number of nodes for the heat exchanger"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.Volume V=0.03781 "Volume of the boiler"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  // parameter Modelica.SIunits.Volume V_wf= 0.03781 "Volume working Fluid";
  parameter Modelica.SIunits.Area A_f=16.18
    "Heat Exchanging Area- working Fluid Side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.Area A_b=16.18
    "Heat Exchanging Area - Biomass Side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  /*********************** Metal wall *******************************/
  parameter Modelica.SIunits.Mass M_wall=69
    "Mass of the metal wall between the working fluid and the biomass side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall=500
    "Specific heat capacity of metal wall"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  /*******************************  Mass flow   ***************************/

parameter Modelica.SIunits.MassFlowRate Mdotnom_f= 5.38
    "Nominal flow rate of secondary fluid"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  /*********** PUMP PARAMETERS ****************/
  parameter Real eta_em=1 "Electro-mechanical efficiency of the pump"
                                                                     annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Real eta_is=1 "Internal Isentropic efficiency of the pump"
                                                                      annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Real epsilon_v=1 "Volumetric effectiveness of the pump"
                                                                   annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Modelica.SIunits.VolumeFlowRate V_dot_max= 2e-4
    "Maximum pump flow rate"                                                         annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));

  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model MediumHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    annotation (Dialog(group="Biomass Boiler - Heat transfer", tab="General"),
      choicesAllMatching=true);
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom_f=369
    "Coefficient of heat transfer, working Fluid"
    annotation (Dialog(group="Biomass Boiler - Heat transfer", tab="General"));

/*****************************  **********************************
  /***************************** INITIAL VALUES **********************************/
/*****************************  **********************************
  
  
/*pressure*/
  parameter Modelica.SIunits.Pressure pstart_f=1e5
    "Nominal inlet pressure of the working fluid"
    annotation (Dialog(tab="Initialization"));

/***************************** Boiler **********************************/

  /*Temperatures*/
   parameter Modelica.SIunits.Temperature Tstart_inlet_f = 334.9
    "Initial value of working fluid temperature at the inlet"     annotation (Dialog(group="Biomass Boiler", tab="Initialization"));
   parameter Modelica.SIunits.Temperature Tstart_outlet_f = 413.15
    "Initial value of working fluid temperature at the outlet"     annotation (Dialog(group="Biomass Boiler", tab="Initialization"));

/***************************** Pump **********************************/
  parameter Modelica.SIunits.SpecificEnthalpy h_start =  Medium1.specificEnthalpy_pTX(pstart_f,Tstart_outlet_f,fill(0,0))
    "Initial value of working fluid temperature at the inlet"     annotation (Dialog(group="Recirculation pump", tab="Initialization"));
  final parameter Modelica.SIunits.MassFlowRate M_dot_start = Mdotnom_f;

  /*steady state */
 parameter Boolean steadystate_T_wall=false
    "if true, sets the derivative of T_wall in the boiler to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));
 parameter Boolean steadystate_T_f=false
    "if true, sets the derivative of T_fluid in the boiler to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));

/*************************  NUMERICAL OPTIONS ******************************************/
  import ThermoCycle.Functions.Enumerations.Discretizations;
  parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal
    "Selection of the spatial discretization scheme"
    annotation (Dialog(tab="Numerical options"));

  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 = Medium1,
    N=N,
    V=V,
    A_f=A_f,
    A_b=A_b,
    M_wall=M_wall,
    c_wall=c_wall,
    Discretization=Discretization,
    redeclare final model MediumHeatTransferModel = MediumHeatTransferModel,
    Mdotnom_f=Mdotnom_f,
    pstart_f=pstart_f,
    Unom_f=Unom_f,
    Tstart_inlet_f=Tstart_inlet_f,
    Tstart_outlet_f=Tstart_outlet_f,
    steadystate_T_f=steadystate_T_f,
    steadystate_T_wall=steadystate_T_wall) annotation (Placement(transformation(
        extent={{-38.5,-30.5},{38.5,30.5}},
        rotation=-90,
        origin={-60.5,-13.5})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = Medium1,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    f_pp0=50,
    hstart=h_start,
    eta_em=eta_em,
    eta_is=eta_is,
    epsilon_v=epsilon_v,
    V_dot_max=V_dot_max,
    M_dot_start=M_dot_start)
    annotation (Placement(transformation(extent={{-30,46},{-10,66}})));

  Modelica.Blocks.Interfaces.RealOutput Tout_BiomassBoiler annotation (
      Placement(transformation(extent={{-100,30},{-120,50}}),
        iconTransformation(extent={{-100,30},{-120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Tin_BiomassBoiler annotation (Placement(
        transformation(extent={{-100,-42},{-120,-22}}), iconTransformation(
          extent={{-100,-42},{-120,-22}})));
  Modelica.Blocks.Interfaces.RealOutput MassFlow_BiomassBoiler annotation (
      Placement(transformation(extent={{-100,-62},{-120,-42}}),
        iconTransformation(extent={{-100,-62},{-120,-42}})));
  Modelica.Blocks.Interfaces.RealOutput DeltaT_Biomass annotation (Placement(
        transformation(extent={{-134,-4},{-154,16}}), iconTransformation(extent=
           {{-100,-10},{-120,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-108,-10},{-128,10}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_BIOMASS_EX(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{30,74},{50,54}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2_BIOMASS_SU(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{58,-80},{38,-60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ByPass_BM(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={42,-28})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_ByPass_BM(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={44,2})));

  combustionDynamic CombustionDynamic(
    Qcombustion_Nominal=Qcombustion_Nominal,
    t_startup=t_startup,
    Qcombustion_Min=Qcombustion_Min,
    Qcombustion_start=Qcombustion_start)
    annotation (Placement(transformation(extent={{-14,10},{-2,20}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_BM_SU(redeclare package
      Medium = Medium1)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={74,-64})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_BM_Ex(redeclare package
      Medium = Medium1)         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={72,70})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_Pump_BM_EX(
                                                                 redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={8,68})));
  Modelica.Blocks.Math.Gain Efficiency(k=BoilerEfficiency)
    annotation (Placement(transformation(extent={{-20,-8},{-28,0}})));
equation
  connect(PumpFlowfraction, pump.flow_in) annotation (Line(
      points={{-23,100},{-23,90},{-23.2,90},{-23.2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Tout, Tout_BiomassBoiler) annotation (Line(
      points={{-75.75,15.76},{-84.25,15.76},{-84.25,40},{-110,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Tin, Tin_BiomassBoiler) annotation (Line(
      points={{-75.75,-32.75},{-85.25,-32.75},{-85.25,-32},{-110,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Mdot_in, MassFlow_BiomassBoiler) annotation (Line(
      points={{-75.75,-42.76},{-86.25,-42.76},{-86.25,-52},{-110,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DeltaT_Biomass, add.y) annotation (Line(
      points={{-144,6},{-136,6},{-136,0},{-129,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.u1, Tout_BiomassBoiler) annotation (Line(
      points={{-106,6},{-106,40},{-110,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tin_BiomassBoiler, add.u2) annotation (Line(
      points={{-110,-32},{-108,-32},{-108,-6},{-106,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TJ_BIOMASS_EX.port_3, sensM_ByPass_BM.InFlow)
                                           annotation (Line(
      points={{40,54},{40,28},{48,28},{48,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensM_ByPass_BM.OutFlow, Sens_ByPass_BM.InFlow)
                                                      annotation (Line(
      points={{48,-2},{46.8,-2},{46.8,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2_BIOMASS_SU.port_3, Sens_ByPass_BM.OutFlow)
                                             annotation (Line(
      points={{48,-60},{48,-35},{46.8,-35}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_BM_SU.InFlow, inlet)    annotation (Line(
      points={{81,-68.8},{88.5,-68.8},{88.5,-70},{100,-70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_BM_SU.OutFlow, TJ2_BIOMASS_SU.port_1)
                                             annotation (Line(
      points={{67,-68.8},{62.5,-68.8},{62.5,-70},{58,-70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, pump.InFlow) annotation (Line(
      points={{-50.74,25},{-50.74,56.5},{-27.2,56.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_BIOMASS_EX.port_2, Sens_BM_Ex.InFlow)
                                             annotation (Line(
      points={{50,64},{58,64},{58,62},{60,62},{60,65.2},{65,65.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_BM_Ex.OutFlow, outlet)     annotation (Line(
      points={{79,65.2},{88.5,65.2},{88.5,66},{104,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow,Sens_Pump_BM_EX. InFlow) annotation (Line(
      points={{-14.4,63.4},{-7.2,63.4},{-7.2,63.2},{1,63.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_Pump_BM_EX.OutFlow, TJ_BIOMASS_EX.port_1) annotation (Line(
      points={{15,63.2},{22.5,63.2},{22.5,64},{30,64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(CombustionDynamic.Modulation, CombustionPowerCommand) annotation (
      Line(
      points={{-1.64,15},{24,15},{24,13},{99,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Q, Efficiency.y)       annotation (Line(
      points={{-37.625,6.52},{-28,6.52},{-28,-4},{-28.4,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CombustionDynamic.Qcombustion, Efficiency.u)       annotation (Line(
      points={{-14.3,14.9},{-22,14.9},{-22,4},{-14,4},{-14,-4},{-19.2,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TJ2_BIOMASS_SU.port_2, simpleBiomassBoiler.inlet) annotation (Line(
      points={{38,-70},{-2,-70},{-2,-74},{-48.91,-74},{-48.91,-52.77}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{70,-18},{92,-30}},
          lineColor={0,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid,
          textString="ByPass
"), Rectangle(
          extent={{-78,26},{2,-54}},
          lineColor={95,95,95},
          pattern=LinePattern.Dash)}), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,86},{98,-90}},
          lineColor={0,0,0},
          fillColor={207,0,0},
          fillPattern=FillPattern.Forward),
        Text(
          extent={{-64,30},{58,-42}},
          lineColor={255,255,0},
          textString="Simple Biomass System
Combustion Dynamic

"),     Text(
          extent={{-116,112},{-66,84}},
          lineColor={95,95,95},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Q_biomass 
0 - 1"),Text(
          extent={{36,132},{100,66}},
          lineColor={95,95,95},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="M_dot_pump
   0 - 1")}));
end SimpleBiomassSystemCombustionDynamic_AD;
