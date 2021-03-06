within BrickerISES.Obsolete;
model SimpleBiomassSystemCombustionDynamic

  import BrickerISES.Constants;
  //parameter Modelica.SIunits.Density rho_NominalTherminol=Bricker.Constants.rho_Therminol66;

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
  /******************************** geometries ***********************************/

  parameter Integer N=5 "Number of nodes for the heat exchanger"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.Volume V=0.03781
    "Volume of heated fluid in the boiler"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  // parameter Modelica.SIunits.Volume V_wf= 0.03781 "Volume working Fluid";
  parameter Modelica.SIunits.Area A_f=16.18
    "Heat Exchanging Aread - working Fluid Side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.Area A_b=16.18
    "Heat Exchanging Aread - Biomass Side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

    /*********************** metal wall   *******************************/
  parameter Modelica.SIunits.Mass M_wall=69
    "Mass of the metal wall between the working fluid and the biomass side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall=500
    "Specific heat capacity of metal wall"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

    /*******************************  mass flow   ***************************/

 parameter Modelica.SIunits.MassFlowRate Mdotnom_f= 5.38
    "Nominal flow rate of working fluid"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

   /*********** PUMP PARAMETERS ****************/
  parameter Real eta_em=1 "Electro-mechanical efficiency of the pump"
                                                                     annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Real eta_is=1 "Internal Isentropic efficiency of the pump"
                                                                      annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Real epsilon_v=1 "Volumetric effectiveness of the pump"
                                                                   annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));
  parameter Modelica.SIunits.VolumeFlowRate V_dot_max= 2e-4
    "Maximum pump flow rate" annotation(Dialog(group="Recirculating Pump Parameters", tab="General"));

  /************ EXPANSION TANK PARAMETERS ****************/

  parameter Real H_D = 1 "Height to diameter ratio"  annotation (Dialog(group="Expansion tank", tab="General"));
  parameter Modelica.SIunits.Volume V_tank = 1 "Volume of the expansion tank" annotation(Dialog(group="Expansion tank", tab="General"));
  parameter Modelica.SIunits.Pressure p_ext = 1.5
    "External pressure imposed in the expansion tank"  annotation(Dialog(group="Expansion tank", tab="General"));
 parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom = 1 annotation(Dialog(group="Expansion tank", tab="General"));
  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model MediumHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    annotation (Dialog(group="Biomass Boiler", tab="General"),
      choicesAllMatching=true);
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom_f=369
    "Coefficient of heat transfer, working Fluid"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  /***************************** INITIAL VALUES **********************************/

  /*  pressure       */
  parameter Modelica.SIunits.Pressure pstart_f=1e5
    "Nominal inlet pressure of the working fluid"
    annotation (Dialog(tab="Initialization"));

  /***************************** Biomass Boiler **********************************/

   parameter Modelica.SIunits.Temperature Tstart_inlet_f= 334.9
    "Temperature at the inlet of the biomass boiler"
    annotation (Dialog(tab="Initialization"));
   parameter Modelica.SIunits.Temperature Tstart_outlet_f= 413.15
    "Temperature at the outlet of the biomass boiler"
    annotation (Dialog(tab="Initialization"));

 /***************************** Tank **********************************/
  parameter Modelica.SIunits.Length L_lstart=0.3
    "Start value for the liquid level"  annotation (Dialog(group="Expansion Tank", tab="Initialization"));
  final parameter Modelica.SIunits.Pressure pstart = pstart_f
    "Initial pressure in the tank"                                                            annotation (Dialog(group="Expansion Tank", tab="Initialization"));

  final parameter Modelica.SIunits.MassFlowRate Mdotnom = Mdotnom_f;

  parameter Modelica.SIunits.Temperature T_start_tank = 300
    "Initial temperature in the tank"                                                        annotation (Dialog(group="Expansion Tank", tab="Initialization"));

/***************************** Pump **********************************/

  parameter Modelica.SIunits.SpecificEnthalpy h_start =  Medium1.specificEnthalpy_pTX(pstart_f,Tstart_outlet_f,fill(0,0))
    "Initial value of working fluid temperature at the inlet"     annotation (Dialog(group="Recirculation pump", tab="Initialization"));
  final parameter Modelica.SIunits.MassFlowRate M_dot_start = Mdotnom_f;

  /*steady state */
  parameter Boolean steadystate_T_f=false
    "if true, sets the derivative of T_sf (secondary fluids Temperature in each cell) to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));
  parameter Boolean steadystate_T_wall=false
    "if true, sets the derivative of T_wall to zero during Initialization"
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
    Tstart_inlet_f=Tstart_inlet_f,
    Tstart_outlet_f=Tstart_outlet_f,
    Unom_f=Unom_f) annotation (Placement(transformation(
        extent={{-38.5,-30.5},{38.5,30.5}},
        rotation=-90,
        origin={-58.5,-13.5})));
  Modelica.Blocks.Interfaces.RealInput CombustionPowerCommand "0-1" annotation (
     Placement(transformation(extent={{108,0},{90,26}}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-56,95})));
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
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ1(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{50,76},{70,56}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{78,-78},{58,-58}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_ByPass(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={58,-36})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_ByPass(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={56,-6})));

  combustionDynamic CombustionDynamic(
    Qcombustion_Nominal=Qcombustion_Nominal,
    t_startup=t_startup,
    Qcombustion_Min=Qcombustion_Min,
    Qcombustion_start=Qcombustion_start)
    annotation (Placement(transformation(extent={{-4,0},{16,20}})));
  Modelica.Blocks.Math.Gain Efficiency(k=BoilerEfficiency)
    annotation (Placement(transformation(extent={{-22,-14},{-30,-6}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SBM_SU(redeclare package
      Medium = Medium1)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={32,-72})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SBM_EX(redeclare package
      Medium = Medium1)         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,60})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(redeclare package Medium
      =                                                                           Medium1,
    H_D=H_D,
    V_tank=V_tank,
    p_ext=p_ext,
    L_lstart=L_lstart,
    Mdotnom=Mdotnom,
    Unom=Unom,
    Tstart=T_start_tank,
    pstart=pstart_f)
    annotation (Placement(transformation(extent={{-20,54},{0,74}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = Medium1,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    eta_em=eta_em,
    eta_is=eta_is,
    epsilon_v=epsilon_v,
    V_dot_max=V_dot_max,
    M_dot_start=M_dot_start)
    annotation (Placement(transformation(extent={{4,-86},{-16,-66}})));
  Modelica.Blocks.Interfaces.RealInput PumpNominalFlowFraction annotation (
      Placement(transformation(
        extent={{-12,11},{12,-11}},
        rotation=90,
        origin={-43,-104}),
                          iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={22,95})));
equation
  connect(simpleBiomassBoiler.Tout, Tout_BiomassBoiler) annotation (Line(
      points={{-73.75,15.76},{-84.25,15.76},{-84.25,40},{-110,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Tin, Tin_BiomassBoiler) annotation (Line(
      points={{-73.75,-32.75},{-85.25,-32.75},{-85.25,-32},{-110,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Mdot_in, MassFlow_BiomassBoiler) annotation (Line(
      points={{-73.75,-42.76},{-86.25,-42.76},{-86.25,-52},{-110,-52}},
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
  connect(TJ1.port_3, sensM_ByPass.InFlow) annotation (Line(
      points={{60,56},{60,-2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensM_ByPass.OutFlow, sensTp_ByPass.InFlow) annotation (Line(
      points={{60,-10},{62.8,-10},{62.8,-29}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ1.port_2, outlet) annotation (Line(
      points={{70,66},{104,66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(CombustionPowerCommand, CombustionDynamic.Modulation) annotation (
      Line(
      points={{99,13},{47.5,13},{47.5,10},{16.6,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.Q, Efficiency.y) annotation (Line(
      points={{-35.625,6.52},{-34,6.52},{-34,-10},{-30.4,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CombustionDynamic.Qcombustion, Efficiency.u) annotation (Line(
      points={{-4.5,9.8},{-24,9.8},{-24,2},{-12,2},{-12,-10},{-21.2,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTp_ByPass.OutFlow, TJ2.port_3) annotation (Line(
      points={{62.8,-43},{62.8,-58},{68,-58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_1, inlet) annotation (Line(
      points={{78,-68},{90,-68},{90,-70},{100,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, Sens_SBM_EX.InFlow) annotation (Line(
      points={{-48.74,25},{-48.74,36},{-68,36},{-68,55.2},{-57,55.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SBM_EX.OutFlow, openTank.InFlow) annotation (Line(
      points={{-43,55.2},{-19.8,55.2},{-19.8,55.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, Sens_SBM_SU.OutFlow) annotation (Line(
      points={{1.2,-75.5},{12,-75.5},{12,-76.8},{25,-76.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_2, Sens_SBM_SU.InFlow) annotation (Line(
      points={{58,-68},{50,-68},{50,-76.8},{39,-76.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.inlet, pump.OutFlow) annotation (Line(
      points={{-46.91,-52.77},{-46.91,-68.6},{-11.6,-68.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, TJ1.port_1) annotation (Line(
      points={{-0.2,55.6},{16,55.6},{16,66},{50,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpNominalFlowFraction, pump.flow_in) annotation (Line(
      points={{-43,-104},{-43,-60},{-2.8,-60},{-2.8,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{70,-18},{92,-30}},
          lineColor={0,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid,
          textString="ByPass
"), Rectangle(
          extent={{-76,28},{4,-52}},
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
          extent={{-92,104},{-70,90}},
          lineColor={95,95,95},
          pattern=LinePattern.Dash,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="0 - 1")}));
end SimpleBiomassSystemCombustionDynamic;
