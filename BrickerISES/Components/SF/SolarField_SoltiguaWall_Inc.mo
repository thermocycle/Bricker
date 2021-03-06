within BrickerISES.Components.SF;
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
