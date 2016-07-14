within BrickerISES.Components.Tank;
model BufferTankComplete "complete buffer tank"

  replaceable package Medium1 =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66
    constrainedby Modelica.Media.Interfaces.PartialMedium annotation (
      choicesAllMatching=true);

  constant Real pi=Modelica.Constants.pi "pi-greco";

  /* FLUID INITIAL VALUES */
  parameter Modelica.SIunits.Pressure pstart=1.01325e5
    "Tank Pressure start value" annotation (Dialog(tab="Initialization"));

  parameter Modelica.SIunits.Temperature Tstart=273.15 + 20
    "Tank Temperature pressure start value"
    annotation (Dialog(tab="Initialization"));

  /* TANK GEOMETRIES and FLUID VARIABLES*/

  parameter Real H_D=1 "Height to diameter ratio";

  parameter Modelica.SIunits.MassFlowRate Mdotnom=1 "Nominal fluid flow rate";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=1
    "Nominal Heat transfer coefficient for the fluid.";

  parameter Modelica.SIunits.Volume Vtot=10
    "Total Volume of the fluid in the tank";

  final parameter Modelica.SIunits.Length r_int=((Vtot/(H_D)*4/pi)^(1/3))/2
    "Internal tank radius ";
  final parameter Modelica.SIunits.Length D_int=r_int*2
    "Internal tank Diameter ";
  final parameter Modelica.SIunits.Length H=sqrt(Vtot/(pi*r_int))
    "Tank Height ";
  final parameter Modelica.SIunits.Area Atot=pi*H*D_int
    "Fluid lateral External Area ";
  final parameter Modelica.SIunits.Area Atot_tank=Atot + 2*pi*r_int^2
    "Total External Area (laterl + bottom + top)";

  replaceable model FluidHeatTransferModel =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    annotation (Dialog(group="Heat transfer for the fluid", tab="General"),
      choicesAllMatching=true);

  /* NUMERICAL OPTIONS*/

  import ThermoCycle.Functions.Enumerations.Discretizations;
  parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal
    "Selection of the spatial discretization scheme"
    annotation (Dialog(tab="Numerical options"));
  parameter Boolean steadystate=false
    "if true, sets the derivative of the fluid Temperature in each cell to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));

  /* PARAMETER FOR THE CONVECTIVE HEAT TRANSFER TO AMBIENT*/
  import BrickerISES.Components.Enumerations.ConvectiveWall;
  parameter ConvectiveWall Convection=ConvectiveWall.Insulated
    "Convective Heat Transfer for the Wall, h [W/m^2.K]" annotation (Dialog(
        group="Heat transfer from Tank to Ambient", tab="General"));

  parameter Modelica.SIunits.CoefficientOfHeatTransfer h_constant=1000
    "heat transfer coefficient to set for Constant case [W/m^2.K]" annotation (
      Dialog(group="Heat transfer from Tank to Ambient", tab="General"));

  BufferTank bufferTank(
    redeclare package Medium = Medium1,
    redeclare final model HeatTransfer = FluidHeatTransferModel,
    H_D=H_D,
    Vtot=Vtot,
    pstart=pstart,
    Tstart=Tstart,
    Mdotnom=Mdotnom,
    Unom=Unom,
    Discretization=Discretization,
    steadystate=steadystate)
    annotation (Placement(transformation(extent={{-24,-42},{76,58}})));
  ConvectiveWallL ConvectiveHeatTransfer(
    Convection=Convection,
    A=Atot_tank,
    h_constant=h_constant)
    annotation (Placement(transformation(extent={{-66,-46},{-36,64}})));
  ThermoCycle.Components.HeatFlow.Sources.Source_T_cell TambSource annotation (
      Placement(transformation(
        extent={{-52,11},{52,-11}},
        rotation=-90,
        origin={-83,12})));
  Modelica.Blocks.Interfaces.RealInput Tamb
    annotation (Placement(transformation(extent={{-134,-14},{-94,26}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
        Medium1) annotation (Placement(transformation(extent={{-4,86},{16,106}}),
        iconTransformation(extent={{-10,92},{10,112}})));
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium =
        Medium1) annotation (Placement(transformation(extent={{-6,-98},{14,-78}}),
        iconTransformation(extent={{-10,-110},{10,-90}})));
equation
  connect(TambSource.ThermalPortCell, ConvectiveHeatTransfer.thermalPortL_ext)
    annotation (Line(
      points={{-79.59,7.32},{-72.795,7.32},{-72.795,5.7},{-64.5,5.7}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(ConvectiveHeatTransfer.thermalPortL_int, bufferTank.Wall_int)
    annotation (Line(
      points={{-37.5,5.7},{-25.75,5.7},{-25.75,5},{-14,5}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(TambSource.Temperature, Tamb) annotation (Line(
      points={{-88.5,6.8},{-99.25,6.8},{-99.25,6},{-114,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(OutFlow, bufferTank.OutFlow) annotation (Line(
      points={{6,96},{6,71},{24,71},{24,51.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bufferTank.InFlow, InFlow) annotation (Line(
      points={{22,-32},{12,-32},{12,-88},{4,-88}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-90,92},{88,-88}},
          lineColor={0,0,255},
          fillColor={0,255,255},
          fillPattern=FillPattern.CrossDiag),
        Text(
          extent={{-130,32},{-106,54}},
          lineColor={175,175,175},
          lineThickness=0.5,
          fillColor={170,213,255},
          fillPattern=FillPattern.Forward,
          textString="Tamb"),
        Text(
          extent={{-56,42},{60,-60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={170,213,255},
          fillPattern=FillPattern.Forward,
          textString="Mixed Tank
2 Flange")}));
end BufferTankComplete;
