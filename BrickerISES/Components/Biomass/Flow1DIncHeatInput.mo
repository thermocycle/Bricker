within BrickerISES.Components.Biomass;
model Flow1DIncHeatInput
  "Model of the Flow1D Inc with metal wall and heat transfer input "
  replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "In Hx1DInc: Secondary fluid" annotation (choicesAllMatching=true);

/******************************* COMPONENTS ***********************************/
  ThermoCycle.Interfaces.Fluid.FlangeA inlet_fl2(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{90,4},{110,24}}),
        iconTransformation(extent={{90,4},{110,24}})));
  ThermoCycle.Interfaces.Fluid.FlangeB outlet_fl2(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{-108,2},{-88,22}}),
        iconTransformation(extent={{-108,2},{-88,22}})));

  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-104}), iconTransformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,80})));

  Source_Q source_Q(N=N, A=Aext)
    annotation (Placement(transformation(extent={{-24,8},{24,-40}})));

  ThermoCycle.Components.HeatFlow.Walls.MetalWall metalWall(
    M_wall=M_wall,
    c_wall=c_wall,
    N=N,
    steadystate_T_wall=steadystate_T_wall,
    Aext=Aext,
    Aint=Aint,
    Tstart_wall_1=(Tstart_outlet + 10)/2,
    Tstart_wall_end=(Tstart_inlet + 10)/2)
    annotation (Placement(transformation(extent={{-43,-2},{43,62}})));
  ThermoCycle.Components.FluidFlow.Pipes.Flow1DimInc WorkingFluid(
    redeclare package Medium = Medium,
    redeclare final model Flow1DimIncHeatTransferModel =
        Medium2HeatTransferModel,
    N=N,
    Discretization=Discretization,
    Mdotnom=Mdotnom,
    Unom=Unom,
    pstart=pstart,
    Tstart_inlet=Tstart_inlet,
    Tstart_outlet=Tstart_outlet,
    steadystate=steadystate_T,
    A=Aint,
    V=Vint)
    annotation (Placement(transformation(extent={{44,125},{-44,35}})));
  combustionDynamic CombustionDynamic(
    QcombustionNominal=QcombustionNominal,
    tStartup=tStartup,
    QcombustionMin=QcombustionMin,
    QcombustionStart=QcombustionStart,
    CombustionInitialization=CombustionInitialization)
    annotation (Placement(transformation(extent={{-38,-72},{-18,-52}})));
  /******************************** GEOMETRIES ***********************************/
  parameter Integer N=5 "Number of nodes for the heat exchanger";
  parameter Modelica.SIunits.Volume Vint=0.03781 "WF: Volume of the channel";
  parameter Modelica.SIunits.Area Aint=16.18
    "WF: Internal lateral area of the channel";
  parameter Modelica.SIunits.Area Aext=16.18
    "External lateral area of the channel";

  /*************************** COMBUSTION DYNAMICS ************************************/
    parameter Modelica.SIunits.Time   tStartup(min=1)=40*60
    "Time required to start up the combustion from 0 to Nominal Power [sec]"
                                                                            annotation (Dialog(group="Combustion dynamics", tab="General"));
  parameter Modelica.SIunits.Power QcombustionNominal=1e6
    "Nominal Biomass Boiler Power"
                                  annotation (Dialog(group="Combustion dynamics", tab="General"));
  parameter Modelica.SIunits.Power QcombustionMin=0
    "Minimum Biomass Boiler Power" annotation (Dialog(group="Combustion dynamics", tab="General"));

  /*************************** HEAT TRANSFER ************************************/
  /*Working fluid*/
  replaceable model Medium2HeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
    annotation (Dialog(group="Heat transfer", tab="General"),
      choicesAllMatching=true);
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=369
    "WF: Heat transfer coefficient"
    annotation (Dialog(group="Heat transfer", tab="General"));
replaceable model combustionDynamic =
      BrickerISES.Components.Biomass.CombustionDynamic.LinearPowerCombustion constrainedby
    BrickerISES.Components.Biomass.CombustionDynamic.PartialCombustionDynamic
    annotation (
    Placement(transformation(extent={{-28,-2},{-8,18}})),
    Dialog(group="Combustion dynamics", tab="General"),
    choicesAllMatching=true);

  /*********************** METAL WALL   *******************************/
  parameter Modelica.SIunits.Mass M_wall=69
    "Mass of the metal wall between the two fluids"                                         annotation (Dialog(group = "Metal wall"));
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall=500
    "Specific heat capacity of metal wall"
                                          annotation (Dialog(group = "Metal wall"));

  /*******************************  MASS FLOW   ***************************/

  parameter Modelica.SIunits.MassFlowRate Mdotnom=3
    "WF: Nominal mass flow rate";

  /***************************** INITIAL VALUES **********************************/
  /* Pressure */
  parameter Modelica.SIunits.Pressure pstart=1e5
    "WF: Nominal working fluid pressure "
    annotation (Dialog(tab="Initialization"));

  parameter Modelica.SIunits.Temperature Tstart_inlet=418.15
    "WF: Initial value of working fluid temperature at the inlet"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Temperature Tstart_outlet=408.45
    "WF: Initial value of working fluid temperature at the outlet"
    annotation (Dialog(tab="Initialization"));
    parameter Modelica.SIunits.Temperature Tstart_inlet_wall=408.45
    "Initial value of working fluid temperature at the outlet"
    annotation (Dialog(tab="Initialization",group = "Metal wall"));
      parameter Modelica.SIunits.Temperature Tstart_outlet_wall=408.45
    "Initial value of working fluid temperature at the outlet"
    annotation (Dialog(tab="Initialization",group = "Metal wall"));
    parameter Modelica.SIunits.Power QcombustionStart=1e6
    "Start value of Biomass Boiler Power"
                                         annotation (Dialog(group="Combustion dynamics", tab="Initialization"));

  /*steady state */
  parameter Boolean steadystate_T=false
    "if true, sets the derivative of T fluid to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));
  parameter Boolean steadystate_T_wall=false
    "if true, sets the derivative of T wall to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization",group = "Metal wall"));
  parameter Modelica.Blocks.Types.Init CombustionInitialization=Modelica.Blocks.Types.Init.NoInit
    "Type of initialization (1: no init, 2: steady state, 3/4: initial output)"
                                                                                annotation(Evaluate=true,Dialog(group="Combustion dynamics", tab="Initialization"));

  /*************************  NUMERICAL OPTIONS ******************************************/

  import ThermoCycle.Functions.Enumerations.Discretizations;
  parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal
    "Selection of the spatial discretization scheme"
    annotation (Dialog(tab="Numerical options"));

  //Variables
protected
  Modelica.SIunits.Power Q_wf_;

   record SummaryBase
     replaceable Arrays T_profile;
     record Arrays
       parameter Integer n;
       Modelica.SIunits.Temperature[n] Twf;
       Modelica.SIunits.Temperature[n] Twall;
     end Arrays;
     Modelica.SIunits.Pressure p_wf;
     Modelica.SIunits.Power Q_wf;
   end SummaryBase;
   replaceable record SummaryClass = SummaryBase;
   SummaryClass Summary( T_profile( n=N,   Twf = WorkingFluid.Cells[end:-1:1].T,Twall = metalWall.T_wall), p_wf= WorkingFluid.Summary.p,Q_wf = Q_wf_);

equation
/*Heat flow */
Q_wf_ = WorkingFluid.Q_tot;

  connect(source_Q.thermalPort, metalWall.Wall_ext) annotation (Line(
      points={{-0.24,-6.16},{-0.24,2.69},{-0.86,2.69},{-0.86,20.4}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(WorkingFluid.Wall_int, metalWall.Wall_int) annotation (Line(
      points={{0,61.25},{0,39.6}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(WorkingFluid.InFlow, inlet_fl2) annotation (Line(
      points={{36.6667,80},{70,80},{70,14},{100,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(WorkingFluid.OutFlow, outlet_fl2) annotation (Line(
      points={{-36.6667,79.625},{-60,79.625},{-60,12},{-98,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(CombustionDynamic.Modulation, u) annotation (Line(
      points={{-17.4,-62},{0,-62},{0,-104}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CombustionDynamic.Qcombustion, source_Q.Q_tot) annotation (Line(
      points={{-38.5,-62.2},{-70,-62.2},{-70,-38},{0,-38},{0,-25.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Text(
          extent={{24,92},{60,66}},
          lineColor={0,0,255},
          textString="Q [W]
"),     Rectangle(
          extent={{-96,60},{98,50}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-96,50},{98,40}},
          lineColor={255,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-96,40},{98,-40}},
          lineColor={0,0,255},
          fillColor={0,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-98,14},{-78,-6},{-58,14},{-38,-6},{-18,14},{2,-6},{22,14},{
              42,-6},{62,14},{82,-6},{102,14}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5)}),
    Documentation(info="<HTML>
<p><big> Partial Model <b>BaseHx</b> defines the four fluid port for an heat exchanger model.
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-130,-130},{
            130,130}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-130,-130},{130,
            130}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),Line(
          points={{-100,58},{-80,38},{-60,58},{-40,38},{-20,58},{0,38},{20,58},
            {40,38},{60,58},{80,38},{100,58}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-100,-48},{-78,-28},{-60,-48},{-40,-28},{-20,-48},{0,-28},{
            20,-48},{40,-28},{60,-48},{80,-28},{100,-48}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Polygon(
          points={{22,-68},{22,-88},{36,-78},{22,-68}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-28,-78},{24,-78}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{30,76},{-22,76}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),Polygon(
          points={{-20,86},{-20,66},{-34,76},{-20,86}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<HTML>
<p><big> Model <b>Hx1DInc</b> represent the model of a counter-current plate heat exchanger where one of the two fluid is modeled as an incompressible fluid. It is based on the connection of different sub-components:
<ul><li> A Flow1Dim component representing the flow of the fluid in one side of the exchanger
<li> A Flow1DimInc component representing the flow of the fluid in the other side of the exchanger
<li> A MetalWall component representing the thermal energy accumulation in the metal wall
<li> A CountCurr component that enables the possibility of parallel or countercurrent flow </ul>
<p><b><big>Modelling options</b></p>
  <p><big> In the <b>Initialization</b> tab the following options are availabe:
        <ul><li> steadystate_T_sf: if  true, the derivative of temperature of the incompressible fluid is set to zero during <em>Initialization</em> 
         <li> steadystate_h_wf: if  true, the derivative of enthalpy of the working fluid is set to zero during <em>Initialization</em>
         <li> steadystate_T_wall: if  true, the derivative of Temperature of the metal wall is set to zero during <em>Initialization</em>
         </ul>
        <p><b><big>Numerical options</b></p>
<p><big>The numerical options available for the <b>HxRec1DInc</b> are the one implemented in <a href=\"modelica://ThermoCycle.Components.FluidFlow.Pipes.Cell1Dim\">Cell1Dim</a>.
</html>"));
end Flow1DIncHeatInput;
