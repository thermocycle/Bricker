within BrickerISES.Components.SF;
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
