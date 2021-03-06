within BrickerISES.Obsolete;
model SimpleBiomassSystem

  import BrickerISES.Constants;
  parameter Modelica.SIunits.Density rho_NominalTherminol=BrickerISES.Constants.rho_Therminol66;

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

  //Nominal DeltaT=20�C, Nominal Flow rate=60 m^3/h

  // PUMP PARAMETERS
  parameter Real NominalWorkingFluidFlowRate_m3h=60
    "Nominal Volumetric Flow Rate [m^3/h] for the Biomass Boiler"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  final parameter Modelica.SIunits.VolumeFlowRate NominalWorkingFluidFlowRate=
      NominalWorkingFluidFlowRate_m3h/3600
    "Nominal Flow Rate for Biomass Boiler [m^3/s]";
  final parameter Modelica.SIunits.MassFlowRate
    NominalMassFlowRateBiomassBoiler=NominalWorkingFluidFlowRate*
      rho_NominalTherminol "Nominal Mass Flow Rate for Biomass Boiler [kg/s]";

  parameter Real OversizePump=2 "Flow oversize for the recirculating pump"
    annotation (Dialog(group="Recirculating Pump Parameters", tab="General"));
  final parameter Modelica.SIunits.VolumeFlowRate PumpNominalFlowRate=
      NominalWorkingFluidFlowRate*OversizePump
    "Nominal Flow Rate the Pump [m^3/s]";

  // EXPANSION TANK
  parameter Modelica.SIunits.Volume V_ExpTank=1
    annotation (Dialog(group="Expansion Tank", tab="General"));
  // BIOMASS BOOLIER PARAMETERS

  /******************************** GEOMETRIES ***********************************/

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

  /*************************** HEAT TRANSFER ************************************/
  // parameter Boolean counterCurrent = true
  //     "Swap temperature and flux vector order"
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

  /*********************** METAL WALL   *******************************/
  parameter Modelica.SIunits.Mass M_wall=69
    "Mass of the metal wall between the working fluid and the biomass side"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall=500
    "Specific heat capacity of metal wall"
    annotation (Dialog(group="Biomass Boiler", tab="General"));

  /*******************************  MASS FLOW   ***************************/

  final parameter Modelica.SIunits.MassFlowRate Mdotnom_f=
      NominalMassFlowRateBiomassBoiler "Nominal flow rate of secondary fluid"
    annotation (Dialog(group="Biomass Boiler", tab="General"));
  // parameter Modelica.SIunits.MassFlowRate Mdotnom_wf= 0.2588
  //     "Nominal flow rate for the biomassBoiler";

  //COMMON INITIAL VALUES

  /***************************** INITIAL VALUES **********************************/

  /*pressure*/
  parameter Modelica.SIunits.Pressure pstart_f=1e5
    "Nominal inlet pressure of the working fluid"
    annotation (Dialog(tab="Initialization"));
  // parameter Modelica.SIunits.Pressure pstart_wf= 23.57e5
  //     "Nominal inlet pressure of working fluid"  annotation (Dialog(tab="Initialization"));
  /*Temperatures*/
  // parameter Modelica.SIunits.Temperature Tstart_inlet_wf = 334.9
  //     "Initial value of working fluid temperature at the inlet"  annotation (Dialog(tab="Initialization"));
  // parameter Modelica.SIunits.Temperature Tstart_outlet_wf = 413.15
  //     "Initial value of working fluid temperature at the outlet"  annotation (Dialog(tab="Initialization"));
//  parameter Modelica.SIunits.Temperature Tstart=273.15 + 20
//    "Initial temperature for the Biomass Boiler (working Fluid + metal inertial wall)"
 //   annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature Tstart_inlet_f= 188
    "Initial value of secondary fluid temperature at the inlet"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet_f=260
    "Initial value of secondary fluid temperature at the outlet"
    annotation (Dialog(tab="Initialization"));
  /*steady state */

 parameter Boolean steadystate_T_f=false
    "if true, sets the derivative of T_sf (secondary fluids Temperature in each cell) to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));
  // parameter Boolean steadystate_h_wf=false
  //     "if true, sets the derivative of h of primary fluid (working fluids enthalpy in each cell) to zero during Initialization"
  //     annotation (Dialog(group="Intialization options", tab="Initialization"));
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
    steadystate_T_f=steadystate_T_f,
    steadystate_T_wall=steadystate_T_wall,
    pstart_f=pstart_f,
    Tstart_inlet_f=Tstart_inlet_f,
    Tstart_outlet_f=Tstart_outlet_f,
    Unom_f=Unom_f) annotation (Placement(transformation(
        extent={{-38.5,-30.5},{38.5,30.5}},
        rotation=-90,
        origin={-60.5,-13.5})));
  Modelica.Blocks.Interfaces.RealInput Q annotation (Placement(transformation(
          extent={{108,0},{90,26}}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-56,95})));
  Components.Tank.BufferTankComplete ExpTank(
    redeclare package Medium1 = Medium1,
    Tstart=Tstart_outlet_f,
    steadystate=steadystate_T_f,
    pstart=pstart_f,
    Discretization=Discretization,
    Vtot=V_ExpTank)
    annotation (Placement(transformation(extent={{-48,50},{-8,78}})));
  Modelica.Blocks.Interfaces.RealInput Tamb annotation (Placement(
        transformation(extent={{-110,62},{-88,88}}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-20,95})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium = Medium1,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=PumpNominalFlowRate)
    annotation (Placement(transformation(extent={{14,62},{34,82}})));
  Modelica.Blocks.Interfaces.RealInput PumpNominalFlowFraction annotation (
      Placement(transformation(
        extent={{12,-11},{-12,11}},
        rotation=90,
        origin={17,100}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={22,95})));
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
    annotation (Placement(transformation(extent={{56,90},{76,70}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{54,-78},{74,-58}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_ByPass(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={58,-36})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_ByPass(redeclare
      package Medium = Medium1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={58,-6})));
  Components.Source_pInc source_pInc(redeclare package Medium = Medium1, p=
        pstart_f) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-28,92})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank(redeclare package Medium
      = Medium1)
    annotation (Placement(transformation(extent={{-18,16},{-38,36}})));
equation
  connect(simpleBiomassBoiler.Q, Q) annotation (Line(
      points={{-37.625,6.52},{-31.125,6.52},{-31.125,13},{99,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ExpTank.Tamb, Tamb) annotation (Line(
      points={{-50.8,64.84},{-68.89,64.84},{-68.89,75},{-99,75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpNominalFlowFraction, pump.flow_in) annotation (Line(
      points={{17,100},{17,90},{20.8,90},{20.8,80}},
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
      points={{-110,-32},{-112,-32},{-112,-6},{-106,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TJ1.port_1, pump.OutFlow) annotation (Line(
      points={{56,80},{30,80},{30,79.4},{29.6,79.4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.inlet, TJ2.port_1) annotation (Line(
      points={{-48.91,-52.77},{-48.91,-68},{54,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_2, inlet) annotation (Line(
      points={{74,-68},{88,-68},{88,-70},{100,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ1.port_3, sensM_ByPass.InFlow) annotation (Line(
      points={{66,70},{66,-2},{62,-2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sensM_ByPass.OutFlow, sensTp_ByPass.InFlow) annotation (Line(
      points={{62,-10},{62.8,-10},{62.8,-29}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_ByPass.OutFlow, TJ2.port_3) annotation (Line(
      points={{62.8,-43},{62.8,-50.5},{64,-50.5},{64,-58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ1.port_2, outlet) annotation (Line(
      points={{76,80},{90,80},{90,66},{104,66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ExpTank.OutFlow, source_pInc.flangeB) annotation (Line(
      points={{-28,78.28},{-28,82.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_2, simpleBiomassBoiler.outlet) annotation (Line(
      points={{-38,26},{-44,26},{-44,25},{-50.74,25}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_3, ExpTank.InFlow) annotation (Line(
      points={{-28,36},{-30,36},{-30,50},{-28,50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_1, pump.InFlow) annotation (Line(
      points={{-18,26},{8,26},{8,72.5},{16.8,72.5}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{70,-18},{92,-30}},
          lineColor={0,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid,
          textString="ByPass
")}), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,86},{98,-90}},
          lineColor={0,0,0},
          fillColor={207,0,0},
          fillPattern=FillPattern.Forward), Text(
          extent={{-64,30},{58,-42}},
          lineColor={0,0,0},
          textString="Simple Biomass System
")}));
end SimpleBiomassSystem;
