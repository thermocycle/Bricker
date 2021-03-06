within BrickerISES.Obsolete;
model SimpleBiomassBoiler

  replaceable package Medium1 =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "In Hx1DInc: Secondary fluid" annotation (choicesAllMatching=true);

  /******************************** GEOMETRIES ***********************************/

  parameter Integer N=5 "Number of nodes for the heat exchanger";
  parameter Modelica.SIunits.Volume V=0.03781
    "Volume of heated fluid in the boiler";
  // parameter Modelica.SIunits.Volume V_wf= 0.03781 "Volume working Fluid";
  parameter Modelica.SIunits.Area A_f=16.18
    "Heat Exchanging Aread - working Fluid Side";
  parameter Modelica.SIunits.Area A_b=16.18
    "Heat Exchanging Aread - Biomass Side";

  /*************************** HEAT TRANSFER ************************************/
  /*Secondary fluid*/
  replaceable model MediumHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    annotation (Dialog(group="Heat transfer", tab="General"),
      choicesAllMatching=true);
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom_f=369
    "Coefficient of heat transfer, working Fluid"
    annotation (Dialog(group="Heat transfer", tab="General"));

  /*********************** METAL WALL   *******************************/
  parameter Modelica.SIunits.Mass M_wall=69
    "Mass of the metal wall between the working fluid and the biomass side";
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall=500
    "Specific heat capacity of metal wall";

  /*******************************  MASS FLOW   ***************************/

  parameter Modelica.SIunits.MassFlowRate Mdotnom_f=3
    "Nominal flow rate of secondary fluid";

  /***************************** INITIAL VALUES **********************************/

  /*pressure*/
  parameter Modelica.SIunits.Pressure pstart_f=1e5
    "Nominal inlet pressure of the working fluid"
    annotation (Dialog(tab="Initialization"));

parameter Modelica.SIunits.Temperature Tstart_inlet_f=188 + 273.15
    "Initial value of secondary fluid temperature at the inlet"
    annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature Tstart_outlet_f=265 + 273.15
    "Initial value of secondary fluid temperature at the outlet"
    annotation (Dialog(tab="Initialization"));
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

  /*************************  COMPONENTS ******************************************/

    ThermoCycle.Interfaces.Fluid.FlangeA inlet(redeclare package Medium = Medium1)
    annotation (Placement(transformation(extent={{92,28},{112,48}}),
        iconTransformation(extent={{92,28},{112,48}})));
  ThermoCycle.Interfaces.Fluid.FlangeB outlet(redeclare package Medium =
        Medium1) annotation (Placement(transformation(extent={{-110,22},{-90,42}}),
        iconTransformation(extent={{-110,22},{-90,42}})));

  Components.Biomass.Flow1DIncHeatInput hx1DIncBiomass(
    redeclare package Medium2 = Medium1,
    redeclare final model Medium2HeatTransferModel = MediumHeatTransferModel,
    Discretization=Discretization,
    M_wall=M_wall,
    c_wall=c_wall,
    N=N,
    V_sf=V,
    A_sf=A_f,
    A_wf=A_b,
    Unom_sf=Unom_f,
    Mdotnom_sf=Mdotnom_f,
    pstart_sf=pstart_f,
    Tstart_inlet_sf=Tstart_inlet_f,
    Tstart_outlet_sf=Tstart_outlet_f,
    steadystate_T_sf=steadystate_T_f,
    steadystate_T_wall=steadystate_T_wall)
    annotation (Placement(transformation(extent={{-40,-42},{34,32}})));
  Modelica.Blocks.Interfaces.RealInput Q annotation (Placement(transformation(
          extent={{-128,46},{-88,86}}), iconTransformation(
        extent={{-12,-13},{12,13}},
        rotation=-90,
        origin={-52,75})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpOUT(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{-54,6},{-74,-14}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpIN(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{64,6},{44,-14}})));
  Modelica.Blocks.Interfaces.RealOutput Tout annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-98}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-76,-50})));
  Modelica.Blocks.Interfaces.RealOutput Tin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={62,-100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-50})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_IN(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{86,8},{66,-12}})));
  Modelica.Blocks.Interfaces.RealOutput Mdot_in annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={82,-100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={76,-50})));
  Modelica.Blocks.Interfaces.RealOutput Pin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={48,-100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={16,-50})));
equation
  connect(Q, hx1DIncBiomass.u) annotation (Line(
      points={{-108,66},{-2,66},{-2,24.6},{-3,24.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTpOUT.InFlow, hx1DIncBiomass.outlet_fl2) annotation (Line(
      points={{-57,0.8},{-48.5,0.8},{-48.5,-0.56},{-39.26,-0.56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpOUT.OutFlow, outlet) annotation (Line(
      points={{-71,0.8},{-71,15.4},{-100,15.4},{-100,32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpIN.InFlow, sensM_IN.OutFlow) annotation (Line(
      points={{61,0.8},{66.5,0.8},{66.5,2},{72,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensM_IN.InFlow, inlet) annotation (Line(
      points={{80,2},{90,2},{90,38},{102,38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpIN.OutFlow, hx1DIncBiomass.inlet_fl2) annotation (Line(
      points={{47,0.8},{42.5,0.8},{42.5,0.18},{34,0.18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Pin, sensTpIN.p) annotation (Line(
      points={{48,-100},{48,-55},{62,-55},{62,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tin, sensTpIN.T) annotation (Line(
      points={{62,-100},{62,-26},{46,-26},{46,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Mdot_in, sensM_IN.Mdot) annotation (Line(
      points={{82,-100},{82,-18},{68,-18},{68,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tout, sensTpOUT.T) annotation (Line(
      points={{-60,-98},{-60,-40},{-72,-40},{-72,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Line(
          points={{32,-34},{-38,-34},{-30,-26}},
          color={0,255,255},
          smooth=Smooth.None), Line(
          points={{-38,-34},{-32,-44},{-32,-44}},
          color={0,255,255},
          smooth=Smooth.None)}), Icon(coordinateSystem(preserveAspectRatio=false,
                   extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-90,64},{92,-40}},
          lineColor={255,0,0},
          fillColor={207,0,0},
          fillPattern=FillPattern.Forward),
        Text(
          extent={{-58,44},{58,-46}},
          lineColor={0,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid,
          textString="Simple
Boiler"),
        Line(
          points={{76,44},{-70,44},{-60,58},{-60,58}},
          color={0,255,255},
          smooth=Smooth.None),
        Line(
          points={{-70,44},{-60,28}},
          color={0,255,255},
          smooth=Smooth.None),
        Text(
          extent={{-38,88},{-24,68}},
          lineColor={0,0,255},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{80,-60},{104,-78}},
          lineColor={0,0,255},
          textString="M_dot"),
        Text(
          extent={{40,-56},{64,-74}},
          lineColor={0,0,255},
          textString="T_su"),
        Text(
          extent={{4,-56},{28,-74}},
          lineColor={0,0,255},
          textString="p_su"),
        Text(
          extent={{-86,-58},{-62,-76}},
          lineColor={0,0,255},
          textString="T_ex")}));
end SimpleBiomassBoiler;
