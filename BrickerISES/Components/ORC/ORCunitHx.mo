within BrickerISES.Components.ORC;
model ORCunitHx
  replaceable package MediumSf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid"   annotation (choicesAllMatching = true);
  replaceable package MediumWf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid"   annotation (choicesAllMatching = true);
  // Define the parameters of the model and the fluid
  // Test it alone and in the cycle

  /******************************** GEOMETRIES ***********************************/

parameter Integer N=5 "Number of nodes for the heat exchanger";
parameter Integer Nt(min=1)=1 "Number of tubes in parallel";
parameter Modelica.SIunits.Volume Vsf= 0.03781 "Volume secondary fluid";
parameter Modelica.SIunits.Volume Vwf= 0.03781 "Volume primary fluid";
parameter Modelica.SIunits.Area Asf = 16.18 "Area secondary fluid";
parameter Modelica.SIunits.Area Awf = 16.18 "Area primary fluid";

/*************************** HEAT TRANSFER ************************************/
parameter Boolean CounterCurrent = true
    "Swap temperature and flux vector order";
/*Secondary fluid*/
replaceable model Medium2HeatTransferModel =
    ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
   constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
                                                                                                      annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);
parameter Modelica.SIunits.CoefficientOfHeatTransfer UnomSf = 369
    "Coefficient of heat transfer, secondary fluid" annotation (Dialog(group="Heat transfer", tab="General"));

/*Working fluid*/
replaceable model Medium1HeatTransferModel =
    ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
   constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
                                                                                                      annotation (Dialog(group="Heat transfer", tab="General"),choicesAllMatching=true);
parameter Modelica.SIunits.CoefficientOfHeatTransfer UnomL=300
    "if HTtype = LiqVap: heat transfer coeff, liquid zone." annotation (Dialog(group="Heat transfer", tab="General"));
parameter Modelica.SIunits.CoefficientOfHeatTransfer UnomTp=700
    "if HTtype = LiqVap: heat transfer coeff, two-phase zone." annotation (Dialog(group="Heat transfer", tab="General"));
parameter Modelica.SIunits.CoefficientOfHeatTransfer UnomV=400
    "if HTtype = LiqVap: heat transfer coeff, vapor zone." annotation (Dialog(group="Heat transfer", tab="General"));

/*********************** METAL WALL   *******************************/
parameter Modelica.SIunits.Mass Mwall= 69
    "Mass of the metal wall between the two fluids";
parameter Modelica.SIunits.SpecificHeatCapacity cwall= 500
    "Specific heat capacity of metal wall";

/*******************************  MASS FLOW   ***************************/

parameter Modelica.SIunits.MassFlowRate MdotnomSf= 3
    "Nominal flow rate of secondary fluid";
parameter Modelica.SIunits.MassFlowRate MdotnomWf= 0.2588
    "Nominal flow rate of working fluid";

/***************************** INITIAL VALUES **********************************/

  /*pressure*/
parameter Modelica.SIunits.Pressure pStartSf = 1e5
    "Nominal inlet pressure of secondary fluid"  annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Pressure pStartWf= 23.57e5
    "Nominal inlet pressure of working fluid"  annotation (Dialog(tab="Initialization"));
/*Temperatures*/
parameter Modelica.SIunits.Temperature TstartInletWf = 334.9
    "Initial value of working fluid temperature at the inlet"  annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature TstartOutletWf = 413.15
    "Initial value of working fluid temperature at the outlet"  annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature TstartInletSf = 418.15
    "Initial value of secondary fluid temperature at the inlet"  annotation (Dialog(tab="Initialization"));
parameter Modelica.SIunits.Temperature TstartOutletSf = 408.45
    "Initial value of secondary fluid temperature at the outlet"  annotation (Dialog(tab="Initialization"));
/*steady state */
 parameter Boolean SteadyStateTSf=false
    "if true, sets the derivative of T_sf (secondary fluids Temperature in each cell) to zero during Initialization"
    annotation (Dialog(group="Initialization options", tab="Initialization"));
parameter Boolean SteadyStateHWf=false
    "if true, sets the derivative of h of primary fluid (working fluids enthalpy in each cell) to zero during Initialization"
    annotation (Dialog(group="Initialization options", tab="Initialization"));
parameter Boolean SteadyStateTWall=false
    "if true, sets the derivative of T_wall to zero during Initialization"    annotation (Dialog(group="Initialization options", tab="Initialization"));

/*************************  NUMERICAL OPTIONS ******************************************/

  import ThermoCycle.Functions.Enumerations.Discretizations;
  parameter Discretizations Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff
    "Selection of the spatial discretization scheme"  annotation (Dialog(tab="Numerical options"));
/*Working fluid*/
  parameter Boolean MdotConstWf=false
    "Set to yes to assume constant mass flow rate of primary fluid at each node (easier convergence)"
    annotation (Dialog(tab="Numerical options"));
  parameter Boolean MaxDerWf=false
    "Set to yes to limit the density derivative of primary fluid during phase transitions"
    annotation (Dialog(tab="Numerical options"));
  parameter Boolean FilterDmDtWf=false
    "Set to yes to filter dMdt of primary fluid with a first-order filter"
    annotation (Dialog(tab="Numerical options"));
  parameter Real MaxDrhoDtWf=100
    "Maximum value for the density derivative of primary fluid"
    annotation (Dialog(enable=max_der, tab="Numerical options"));
  parameter Modelica.SIunits.Time TTWf=1
    "Integration time of the first-order filter"
    annotation (Dialog(enable=FilterDmDt, tab="Numerical options"));

/*************************  EVAPORATOR ORC - WORKING FLUID SIDE ******************************************/
  parameter Modelica.SIunits.MassFlowRate MdotWf=0
    "ORC Wf evaporator inlet: Mass flowrate if no connector" annotation (Dialog(group="ORC unit", tab="General"));
    parameter Boolean UseT=true "Use temperature as input instead of enthalpy" annotation (Dialog(group="ORC unit", tab="General"));
  parameter Modelica.SIunits.Temperature TWf_0=298.15
    "ORC Wf evaporator inlet:: Temperature if no connector"                                                 annotation (Dialog(enable=UseT,group="ORC unit", tab="General"));
  parameter Modelica.SIunits.SpecificEnthalpy hWf_0=0
    "ORC Wf evaporator inlet: Enthalpy if no connector"                                                   annotation (Dialog(enable=not UseT,group="ORC unit", tab="General"));
  parameter Modelica.SIunits.Pressure pWf=1.01325e5
    "ORC Wf evaporator outlet: Nominal pressure"                                                annotation (Dialog(group="ORC unit", tab="General"));
  parameter Modelica.SIunits.SpecificEnthalpy hWfOut=1e5
    "ORC Wf evaporator outlet: Nominal specific enthalpy"
                                                         annotation (Dialog(group="ORC unit", tab="General"));
   parameter Modelica.SIunits.Temperature T_cf_su = 60 + 273.15
    "ORC Cf condenser inlet:Temperature";
   Modelica.SIunits.Temperature T_sf_su
    "Secondary fluid evaporator inlet temperature";
    /* ORC powers */
Modelica.SIunits.Power Pel_gross
    "Electrical power generated by the ORC Unit - Rank";
Modelica.SIunits.Power Pth_SfRank
    "Thermal power of evaporator secondary fluid - Rank";
Modelica.SIunits.Power Pth_CfRank
    "Thermal power of condenser secondary fluid - Rank";

  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc( redeclare
      package Medium2 =      MediumSf, redeclare package Medium1 =
                           MediumWf,
    redeclare final model Medium1HeatTransferModel =
        Medium1HeatTransferModel,
        redeclare final model Medium2HeatTransferModel =
        Medium2HeatTransferModel,
    N=N,
    Nt=Nt,
    V_sf=Vsf,
    V_wf=Vwf,
    A_sf=Asf,
    A_wf=Awf,
    counterCurrent=CounterCurrent,
    Unom_sf=UnomSf,
    Unom_l=UnomL,
    Unom_tp=UnomTp,
    Unom_v=UnomV,
    M_wall=Mwall,
    c_wall=cwall,
    Mdotnom_sf=MdotnomSf,
    Mdotnom_wf=MdotnomWf,
    pstart_sf=pStartSf,
    pstart_wf=pStartWf,
    Tstart_inlet_wf=TstartOutletWf,
    Tstart_outlet_wf=TstartInletWf,
    Tstart_inlet_sf=TstartInletSf,
    Tstart_outlet_sf=TstartOutletSf,
    steadystate_T_sf=SteadyStateTSf,
    steadystate_h_wf=SteadyStateHWf,
    steadystate_T_wall=SteadyStateTWall,
    Discretization=Discretization,
    Mdotconst_wf=MdotConstWf,
    max_der_wf=MaxDerWf,
    filter_dMdt_wf=FilterDmDtWf,
    max_drhodt_wf=MaxDrhoDtWf,
    TT_wf=TTWf)
    annotation (Placement(transformation(extent={{-26,14},{26,66}})));
  ThermoCycle.Interfaces.Fluid.FlangeA InletSf( redeclare package Medium =                MediumSf)
    annotation (Placement(transformation(extent={{92,50},{112,70}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutletSf(redeclare package Medium =
        MediumSf)
    annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot SourceMdotWfORC(
    redeclare package Medium = MediumWf,
    Mdot_0=MdotWf,
    UseT=UseT,
    T_0=TWf_0,
    h_0=hWf_0) annotation (Placement(transformation(extent={{-72,0},{-52,20}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP( redeclare package
      Medium =                                                                            MediumWf,
    p0=pWf,
    h=hWfOut)
    annotation (Placement(transformation(extent={{60,2},{80,22}})));
  Modelica.Blocks.Interfaces.RealInput MdotWfORC
    annotation (Placement(transformation(extent={{-126,0},{-86,40}}),
        iconTransformation(extent={{-126,0},{-86,40}})));
  Modelica.Blocks.Interfaces.RealInput TWfORCSu annotation (Placement(
        transformation(extent={{-126,-60},{-86,-20}}), iconTransformation(
          extent={{-126,-60},{-86,-20}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpSfInlet( redeclare
      package Medium =                                                                    MediumSf)
    annotation (Placement(transformation(extent={{64,62},{44,82}})));
  Modelica.Blocks.Interfaces.RealOutput Pel
    annotation (Placement(transformation(extent={{86,-42},{128,0}})));
  Modelica.Blocks.Interfaces.RealOutput PthCooling
    annotation (Placement(transformation(extent={{86,-82},{130,-38}})));
equation

  /* ORC electric gross power - thermal secondary fluid power - thermal cold fluid power */
  T_sf_su = sensTpSfInlet.T;

  Pel_gross=3.50023941E+02+1.78363865E-01*T_cf_su+2.73921968E-03*T_cf_su^2-1.52334799E+00*T_sf_su+4.29020532E-03*T_sf_su^2-5.82324751E-03*T_cf_su*T_sf_su; /*from Rank */
  Pth_SfRank=1.07263808E+03-8.28851563E-01*T_cf_su+1.12637224E-02*T_cf_su^2-4.33581774E+00*T_sf_su+1.24455582E-02*T_sf_su^2-1.55675521E-02*T_cf_su*T_sf_su; /*from Rank */
  Pth_CfRank=5.50172587E+02+4.14338074E-01*T_cf_su+6.76291805E-03*T_cf_su^2-2.68956889E+00*T_sf_su+9.31672163E-03*T_sf_su^2-1.26345843E-02*T_cf_su*T_sf_su; /*from Rank */

  Pel_gross = Pel;
  Pth_CfRank = PthCooling;
//       if cardinality(MdotWfORC) ==0 then
//        MdotWfORC = MdotWf;
//       end if;
//       if cardinality( TWfORCSu) == 0 then
//         TWfORCSu = TWf_0;
//       end if;

  connect(hx1DInc.outlet_fl2, OutletSf) annotation (Line(
      points={{-19.6,51.6},{-60,51.6},{-60,60},{-98,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SourceMdotWfORC.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{-53,10},{-42,10},{-42,30},{-20,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl1, sinkP.flangeB) annotation (Line(
      points={{20,30},{36,30},{36,12},{61.6,12}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(MdotWfORC, SourceMdotWfORC.in_Mdot) annotation (Line(
      points={{-106,20},{-68,20},{-68,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TWfORCSu, SourceMdotWfORC.in_T) annotation (Line(
      points={{-106,-40},{-74,-40},{-74,32},{-62.2,32},{-62.2,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensTpSfInlet.InFlow, InletSf) annotation (Line(
      points={{61,67.2},{74,67.2},{74,60},{102,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpSfInlet.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
      points={{47,67.2},{32,67.2},{32,52},{19.6,52}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-98,24},{-18,-30}},
          lineColor={0,0,255},
          textString="MassFlowORCSu"),
        Text(
          extent={{-94,-58},{-40,-96}},
          lineColor={0,0,255},
          textString="TORCSu"),
        Text(
          extent={{18,80},{98,26}},
          lineColor={0,0,255},
          textString="SfORCInlet"),
        Text(
          extent={{-98,110},{-18,56}},
          lineColor={0,0,255},
          textString="SfORCOutlet")}));
end ORCunitHx;
