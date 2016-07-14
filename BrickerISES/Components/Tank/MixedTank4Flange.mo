within BrickerISES.Components.Tank;
model MixedTank4Flange "Perfectly mixed tank with 4 In/out"

  replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
    "Medium model - Incompressible Fluid" annotation (choicesAllMatching=true);

  /* Thermal and fluid ports */

  //PORT FOR FLUID 1
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-6,-86},{14,-66}}),
        iconTransformation(extent={{-26,-106},{14,-66}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{-10,80},{10,100}}),
        iconTransformation(extent={{-30,74},{10,112}})));
  ThermoCycle.Interfaces.HeatTransfer.ThermalPortL Wall_int annotation (
      Placement(transformation(extent={{-28,40},{32,60}}), iconTransformation(
        extent={{-43,-9},{43,9}},
        rotation=90,
        origin={-95,1})));

  //PORT FOR FLUID 2 (even if it is not mandatory to connect by pairs
  ThermoCycle.Interfaces.Fluid.FlangeA InFlow1(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{-96,60},{-76,80}}),
        iconTransformation(extent={{-98,56},{-58,96}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutFlow1(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{-98,-40},{-78,-20}}),
        iconTransformation(extent={{-100,-88},{-60,-50}})));

  // Geometric characteristics
  constant Real pi=Modelica.Constants.pi "pi-greco";
  parameter Real H_D=1 "Height to diameter ratio";
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
  // parameter Modelica.SIunits.Mass Mass_Start=10 "Start mass of the Tank";

  parameter Modelica.SIunits.MassFlowRate Mdotnom=1 "Nominal fluid flow rate";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer Unom=1
    "Nominal Heat transfer coefficient for the fluid.";

  /* FLUID INITIAL VALUES */
  parameter Modelica.SIunits.Pressure pstart=1.01325e5
    "Tank Pressure start value" annotation (Dialog(tab="Initialization"));

  parameter Modelica.SIunits.Temperature Tstart=273.15 + 20
    "Tank Temperature pressure start value"
    annotation (Dialog(tab="Initialization"));

  final parameter Medium.SpecificEnthalpy hstart=Medium.specificEnthalpy_pTX(
      pstart,
      Tstart,
      fill(0, 0)) "Start value of enthalpy"
    annotation (Dialog(tab="Initialization"));
  /* NUMERICAL OPTIONS  */
  import ThermoCycle.Functions.Enumerations.Discretizations;
  parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal
    "Selection of the spatial discretization scheme"
    annotation (Dialog(tab="Numerical options"));
  parameter Boolean steadystate=false
    "if true, sets the derivative of h (working fluids enthalpy in each cell) to zero during Initialization"
    annotation (Dialog(group="Intialization options", tab="Initialization"));

  /********************************* HEAT TRANSFER MODEL ********************************/
  /* Heat transfer Model */
  replaceable model HeatTransfer =
      ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.BaseClasses.PartialConvectiveCorrelation
    "Convective heat transfer for the fluid" annotation (choicesAllMatching=
        true);
  HeatTransfer heatTransfer(
    redeclare final package Medium = Medium,
    final n=1,
    final Mdotnom=Mdotnom,
    final Unom_l=Unom,
    final Unom_tp=Unom,
    final Unom_v=Unom,
    final M_dot=M_dot,
    final x=0,
    final FluidState={fluidState})
    annotation (Placement(transformation(extent={{-12,-14},{8,6}})));

  /*************************   FLUID VARIABLES    ******************************/

  Medium.ThermodynamicState fluidState;
  Medium.AbsolutePressure p(start=pstart);

  Modelica.SIunits.MassFlowRate M_dot(start=Mdotnom)
    "ficticious Mass Flow, still in place for the heattransfer model. To be removed with revision";
  Medium.SpecificEnthalpy h(start=hstart, stateSelect=StateSelect.always)
    "Fluid specific enthalpy at the cells";
  Medium.Temperature T "Fluid temperature";
  //Modelica.SIunits.Temperature T_wall "Intern-al wall temperature";
  Medium.Density rho "Fluid cell density";
  Modelica.SIunits.SpecificEnthalpy hnode_su(start=hstart)
    "Enthalpy state variable at inlet node";
  Modelica.SIunits.SpecificEnthalpy hnode_ex(start=hstart)
    "Enthalpy state variable at outlet node";

  Modelica.SIunits.SpecificEnthalpy hnode_su1(start=hstart)
    "Enthalpy state variable at inlet node1";
  Modelica.SIunits.SpecificEnthalpy hnode_ex1(start=hstart)
    "Enthalpy state variable at outlet node1";

  Modelica.SIunits.HeatFlux qdot "heat flux at each cell";
  //   Modelica.SIunits.CoefficientOfHeatTransfer U
  //     "Heat transfer coefficient between wall and working fluid";
  Modelica.SIunits.Power Q_tot "Total heat flux exchanged by the thermal port";
  Modelica.SIunits.Mass M_tot "Total mass of the fluid in the component";
  parameter Modelica.SIunits.Volume Vtot=10
    "Total Volume of the fluid in the tank";

  /***********************************  EQUATIONS ************************************/

equation
  //p=pstart;
  /* Fluid Properties */
  fluidState = Medium.setState_ph(p, h);
  T = Medium.temperature(fluidState);
  rho = Medium.density(fluidState);
  /* ENERGY BALANCE */
  //Vtot*rho*der(h) + M_dot*(hnode_ex - hnode_su) = Atot*qdot "Energy balance";
  Vtot*rho*der(h) = hnode_su*InFlow.m_flow + hnode_su1*InFlow1.m_flow + OutFlow.m_flow
    *hnode_ex + OutFlow1.m_flow*hnode_ex1 + Atot*qdot "Energy balance";

  Q_tot = Atot*qdot "Total heat flow through the thermal port";
  M_tot = Vtot*rho;

  qdot = heatTransfer.q_dot[1];

  if (Discretization == Discretizations.centr_diff) then

    hnode_su = inStream(InFlow.h_outflow);
    hnode_ex = 2*h - hnode_su;
    //   elseif (Discretization == Discretizations.centr_diff_robust) then
    //     //no robustness method implemented for incompressible flow
    //
    //     hnode_su = inStream(InFlow.h_outflow);
    //     hnode_ex = 2*h - hnode_su;
  elseif (Discretization == Discretizations.centr_diff_AllowFlowReversal) then

    if M_dot >= 0 then
      // Flow is going the right way
      hnode_su = inStream(InFlow.h_outflow);
      hnode_ex = 2*h - hnode_su;
    else
      // Reverse flow

      hnode_ex = inStream(OutFlow.h_outflow);
      hnode_su = 2*h - hnode_ex;
    end if;
  elseif (Discretization == Discretizations.upwind_AllowFlowReversal) then
    // hnode_ex = if M_dot >= 0 then h else inStream(OutFlow.h_outflow);
    hnode_su = if InFlow.m_flow <= 0 then h else inStream(InFlow.h_outflow);
    hnode_ex = if OutFlow.m_flow <= 0 then h else inStream(OutFlow.h_outflow);
    hnode_su1 = if InFlow1.m_flow <= 0 then h else inStream(InFlow1.h_outflow);
    hnode_ex1 = if OutFlow1.m_flow <= 0 then h else inStream(OutFlow1.h_outflow);
  elseif (Discretization == Discretizations.upwind) then

    hnode_su = inStream(InFlow.h_outflow);
    hnode_ex = h;
  else
    // Upwind scheme with smoothing (not implemented here)

    hnode_ex = if M_dot >= 0 then h else inStream(OutFlow.h_outflow);
    hnode_su = if M_dot <= 0 then h else inStream(InFlow.h_outflow);
  end if;

  //* BOUNDARY CONDITIONS *//
  /* Enthalpies */
  hnode_su = InFlow.h_outflow;
  OutFlow.h_outflow = hnode_ex;
  hnode_su1 = InFlow1.h_outflow;
  OutFlow1.h_outflow = hnode_ex1;
  /* pressures */
  p = OutFlow.p;
  InFlow.p = p;
  p = OutFlow1.p;
  InFlow1.p = p;
  /*Mass Flow*/
  //
  //   M_dot = InFlow.m_flow;
  //   OutFlow.m_flow = -M_dot;
  M_dot = InFlow.m_flow;
  InFlow.m_flow + OutFlow.m_flow + InFlow1.m_flow + OutFlow1.m_flow = 0;
  InFlow.Xi_outflow = inStream(OutFlow.Xi_outflow);
  OutFlow.Xi_outflow = inStream(InFlow.Xi_outflow);
  InFlow1.Xi_outflow = inStream(OutFlow1.Xi_outflow);
  OutFlow1.Xi_outflow = inStream(InFlow1.Xi_outflow);
  /* Thermal port boundary condition */
  // /*Temperatures */
  //   Wall_int.T = T_wall;
  //  /*Heat flow */
  //   Wall_int.phi = qdot;
initial equation
  if steadystate then
    der(h) = 0;
  end if;

equation
  connect(heatTransfer.thermalPortL[1], Wall_int) annotation (Line(
      points={{-2.2,2.6},{-2.2,25.3},{2,25.3},{2,50}},
      color={255,0,0},
      smooth=Smooth.None));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-86,86},{64,-82}},
          lineColor={0,0,255},
          fillColor={0,255,255},
          fillPattern=FillPattern.CrossDiag)}));
end MixedTank4Flange;
