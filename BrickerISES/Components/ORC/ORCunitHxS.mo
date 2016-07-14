within BrickerISES.Components.ORC;
model ORCunitHxS
   extends Icons.ORC_unit;
  replaceable package MediumSf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Heat source fluid"   annotation (choicesAllMatching = true);
  replaceable package MediumWf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid"   annotation (choicesAllMatching = true);

  /******************************* PARAMETERS *****************************/
  /*Metal Wall*/
  parameter Modelica.SIunits.Mass M_wall= 69 "Mass of the Wall";
  parameter Modelica.SIunits.SpecificHeatCapacity c_wall= 500
    "Specific heat capacity of the metal wall";

  parameter Modelica.SIunits.Mass Mwf = 300 "Mass of the fluid"
                        annotation (Dialog(group="Evaporator working fluid side", tab="General"));
  parameter Modelica.SIunits.MassFlowRate MdotNom_wf = 1
    "Nominal mass flow rate" annotation (Dialog(group="Evaporator working fluid side", tab="General"));

  parameter Modelica.SIunits.Mass Msf = 300 "Mass of the fluid"
                        annotation (Dialog(group="Evaporator secondary side", tab="General"));
  parameter Modelica.SIunits.MassFlowRate MdotNom_sf = 1
    "Nominal mass flow rate" annotation (Dialog(group="Evaporator secondary side", tab="General"));

  /****************** Heat Transfer parameter  ******************/
  parameter Boolean Use_AU=false "if true, uses the global thermal conductance"
                                                                                 annotation (Dialog(group="Evaporator Heat transfer", tab="General"));
  parameter Modelica.SIunits.Area A_wf=0.03 "Heat transfer area working fluid" annotation (Dialog(group="Evaporator Heat transfer", tab="General", enable=(not Use_AU)));
  parameter Modelica.SIunits.Area A_sf=0.03
    "Heat transfer area secondary fluid"                                                                annotation (Dialog(group="Evaporator Heat transfer", tab="General", enable=(not Use_AU)));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_wf
    "Constant heat transfer coefficient working fluid" annotation (Dialog(group="Evaporator Heat transfer", tab="General"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_sf
    "Constant heat transfer coefficient secondary fluid" annotation (Dialog(group="Evaporator Heat transfer", tab="General"));
  parameter Modelica.SIunits.ThermalConductance AU_global=27240
    "Global Thermal conductance"                                                    annotation (Dialog(group="Evaporator Heat transfer", tab="General", enable=(Use_AU)));

    /****************** START VALUES ******************/
  parameter Modelica.SIunits.AbsolutePressure p_wf_start=50E5
    "Initial pressure" annotation (Dialog( group="Evaporator working fluid side",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_wf_su_start=394.95
    "Initial value of inlet temperature"                                                    annotation (Dialog(group="Evaporator working fluid side",tab="Initialization"));
    parameter Modelica.SIunits.Temperature T_wf_ex_start=516.25
    "Initial value of outlet temperature"                                                    annotation (Dialog(group="Evaporator working fluid side",tab="Initialization"));

  parameter Modelica.SIunits.AbsolutePressure p_sf_start=50E5
    "Initial pressure" annotation (Dialog(group="Evaporator secondary fluid side",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_sf_su_start=599.15
    "Initial value of inlet temperature"                                                    annotation (Dialog(group="Evaporator secondary fluid side",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_sf_ex_start=443.35
    "Initial value of outlet temperature"                                                    annotation (Dialog(group="Evaporator secondary fluid side",tab="Initialization"));

  parameter Modelica.SIunits.Temperature T_w_1_start=(T_wf_su_start+T_sf_ex_start)/2
    "Initial value of wall temperature at T_ps_su and T_ss_ex"                                                  annotation (Dialog(group="Metal wall",tab="Initialization"));
  parameter Modelica.SIunits.Temperature T_w_2_start=(T_wf_ex_start+T_sf_su_start)/2
    "Initial value of wall temperature at T_ps_ex and T_ss_su"                                                  annotation (Dialog(group="Metal wall",tab="Initialization"));
  parameter Boolean steadystate_T_wall=false
    "if true, sets the derivative of T_wall to zero during Initialization"    annotation (Dialog(group="Metal wall", tab="Initialization"));
  parameter Boolean T_wall_fixed=false
    "if true, imposes the initial wall temperature"                                    annotation (Dialog(group="Metal wall", tab="Initialization"));

  parameter Boolean Cp_constant=false
    "if true, sets the specific heat capacity Cp to a constant value computed with inital conditions";

/*************************  EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS ******************************************/
  parameter Modelica.SIunits.MassFlowRate MdotWf=0
    "Inlet Mass flowrate if no connector" annotation (Dialog(group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));
    parameter Boolean UseT=true "Use temperature as input instead of enthalpy" annotation (Dialog(group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));
  parameter Modelica.SIunits.Temperature TWf_0=298.15
    "Inlet Temperature if no connector"                                                 annotation (Dialog(enable=UseT,group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));
  parameter Modelica.SIunits.SpecificEnthalpy hWf_0=0
    "Inlet Enthalpy if no connector"                                                   annotation (Dialog(enable=not UseT,group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));
  parameter Modelica.SIunits.Pressure pWf=1.01325e5 "Nominal pressure"
                                                                      annotation (Dialog(group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));
  parameter Modelica.SIunits.SpecificEnthalpy hWfOut=1e5
    "OutletNominal specific enthalpy"
                                     annotation (Dialog(group="EVAPORATOR ORC - WORKING FLUID SIDE BOUNDARY CONDITIONS", tab="General"));

  parameter Modelica.SIunits.Temperature T_cf_su = 60 + 273.15
    "ORC Cf condenser inlet:Temperature";

 /* ORC variables */
Modelica.SIunits.Temperature T_sf_su
    "Secondary fluid evaporator inlet temperature";

Modelica.SIunits.Power Pel_net
    "Electrical power generated by the ORC Unit - Rank";
Modelica.SIunits.Power Pth_SfRank
    "Thermal power of evaporator secondary fluid - Rank";
Modelica.SIunits.Power Pth_CfRank
    "Thermal power of condenser secondary fluid - Rank";
Modelica.SIunits.Power Q_orc_eva "Thermal power at evaporator - calculated";

  ThermoCycle.Interfaces.Fluid.FlangeA InletSf( redeclare package Medium =                MediumSf)
    annotation (Placement(transformation(extent={{-112,40},{-92,60}}),
        iconTransformation(extent={{-112,40},{-92,60}})));
  ThermoCycle.Interfaces.Fluid.FlangeB OutletSf(redeclare package Medium =
        MediumSf)
    annotation (Placement(transformation(extent={{-114,-82},{-94,-62}}),
        iconTransformation(extent={{-114,-82},{-94,-62}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot SourceMdotWfORC(
    redeclare package Medium = MediumWf,
    Mdot_0=MdotWf,
    UseT=UseT,
    T_0=TWf_0,
    h_0=hWf_0) annotation (Placement(transformation(extent={{-56,-86},{-36,-66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP( redeclare package
      Medium =                                                                            MediumWf,
    p0=pWf,
    h=hWfOut)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,36})));
  Modelica.Blocks.Interfaces.RealInput MdotWfORC
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-60,96}),
        iconTransformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-48,74})));
  Modelica.Blocks.Interfaces.RealInput TWfORCSu annotation (Placement(
        transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,94}),                                iconTransformation(
          extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={2,74})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTpSfInlet( redeclare
      package Medium =                                                                    MediumSf)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-68,32})));
  Modelica.Blocks.Interfaces.RealOutput Pel
    annotation (Placement(transformation(extent={{34,-2},{76,40}}),
        iconTransformation(extent={{30,-52},{56,-26}})));
  Modelica.Blocks.Interfaces.RealOutput PthCooling
    annotation (Placement(transformation(extent={{34,-58},{78,-14}}),
        iconTransformation(extent={{30,-96},{58,-68}})));
  Modelica.Blocks.Interfaces.RealOutput T_cf_ex annotation (Placement(
        transformation(extent={{34,46},{76,88}}), iconTransformation(extent={{28,
            28},{54,54}})));

  HX_singlephase Evaporator(
  redeclare package MediumPs = MediumWf,
  redeclare package MediumSs = MediumSf,
    M_wall=M_wall,
    c_wall=c_wall,
    M_ps=Mwf,
    MdotNom_ps=MdotNom_wf,
    M_ss=Msf,
    MdotNom_ss=MdotNom_sf,
    Use_AU=Use_AU,
    A_ps=A_wf,
    A_ss=A_sf,
    U_ps=U_wf,
    U_ss=U_sf,
    AU_global=AU_global,
    Cp_constant=Cp_constant,
    p_ps_start=p_wf_start,
    T_ps_su_start=T_wf_su_start,
    T_ps_ex_start=T_wf_ex_start,
    p_ss_start=p_sf_start,
    T_w_1_start=T_w_1_start,
    T_w_2_start=T_w_2_start,
    steadystate_T_wall=steadystate_T_wall,
    T_wall_fixed=T_wall_fixed,
    T_ss_su_start=T_sf_su_start,
    T_ss_ex_start=T_sf_ex_start) annotation (Placement(transformation(
        extent={{-15,-19},{15,19}},
        rotation=90,
        origin={-59,-13})));
equation
  T_sf_su = sensTpSfInlet.T;

  /* ORC electric net power - thermal secondary fluid power - thermal cold fluid power */
  Pel_net=(-784.063642254152+6.3795011254995*(T_sf_su-273.15)+0.573454935901057*(T_cf_su-273.15)-0.0111841887964628*(T_sf_su-273.15)^2-0.00756316130343174*(T_cf_su-273.15)^2-0.00299598323974696*(T_sf_su-273.15)*(T_cf_su-273.15))*1e3;
  Pth_SfRank=(1.07263808E+03-8.28851563E-01*T_cf_su+1.12637224E-02*T_cf_su^2-4.33581774E+00*T_sf_su+1.24455582E-02*T_sf_su^2-1.55675521E-02*T_cf_su*T_sf_su)*1e3; /*from Rank */
  Pth_CfRank=(5.50172587E+02+4.14338074E-01*T_cf_su+6.76291805E-03*T_cf_su^2-2.68956889E+00*T_sf_su+9.31672163E-03*T_sf_su^2-1.26345843E-02*T_cf_su*T_sf_su)*1e3; /*from Rank */

  Pel_net = Pel;
  Pth_CfRank = PthCooling;

  T_cf_ex = (5.67957076559994-0.165606558984694*(T_cf_su-273.15)+1.18629126631948*(T_sf_su-273.15)+0.000862506044054514*(T_cf_su-273.15)^2-0.0000942893421415677*(T_sf_su-273.15)^2-0.000963296687100146*(T_sf_su-273.15)*(T_cf_su-273.15)) + 273.15;
  Q_orc_eva = Evaporator.InFlowSs.m_flow*(Evaporator.InFlowSs.h_outflow - Evaporator.OutFlowSs.h_outflow);

  connect(InletSf, sensTpSfInlet.InFlow) annotation (Line(
      points={{-102,50},{-77.4,50},{-77.4,32}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(MdotWfORC, SourceMdotWfORC.in_Mdot) annotation (Line(
      points={{-60,96},{-60,50},{-24,50},{-24,-44},{-52,-44},{-52,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SourceMdotWfORC.in_T, TWfORCSu) annotation (Line(
      points={{-46.2,-70},{-46.2,-64},{-64,-64},{-64,-92},{0,-92},{0,94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Evaporator.OutFlowSs, OutletSf) annotation (Line(
      points={{-44.94,-26.5},{-42,-26.5},{-42,-36},{-82,-36},{-82,-72},{-104,
          -72}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(SourceMdotWfORC.flangeB, Evaporator.InFlowPs) annotation (Line(
      points={{-37,-76},{-34,-76},{-34,-74},{-32,-74},{-32,-56},{-62,-56},{-62,
          -29.5},{-58.62,-29.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Evaporator.OutFlowPs, sinkP.flangeB) annotation (Line(
      points={{-58.62,3.5},{-58.62,14},{-40,14},{-40,27.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTpSfInlet.InFlow, Evaporator.InFlowSs) annotation (Line(
      points={{-77.4,32},{-77.4,0.5},{-72.68,0.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{40,80}}),   graphics), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{40,80}}),   graphics={
        Text(
          extent={{-100,30},{-20,-24}},
          lineColor={0,0,255},
          textString="MassFlowORCSu"),
        Text(
          extent={{-100,-52},{-46,-90}},
          lineColor={0,0,255},
          textString="TORCSu"),
        Text(
          extent={{0,-20},{32,-40}},
          lineColor={0,0,255},
          textString="Pel"),
        Text(
          extent={{-16,-42},{22,-90}},
          lineColor={0,0,255},
          textString="PthCond"),
        Text(
          extent={{-4,48},{28,28}},
          lineColor={0,0,255},
          textString="T_cf_ex")}));
end ORCunitHxS;
