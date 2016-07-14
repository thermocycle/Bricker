within BrickerISES.Components.ORC;
model ORCunitHex
  extends Icons.ORC_unit;
  import Modelica.SIunits;
   //extends Icons.ORC_unit;
  replaceable package MediumSf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Heat source fluid"   annotation (choicesAllMatching = true);

  replaceable package MediumWat =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid"   annotation (choicesAllMatching = true);

  ThermoCycle.Interfaces.Fluid.FlangeA InletEvap(redeclare package Medium =
        MediumSf) annotation (Placement(transformation(extent={{-130,50},{-110,70}}),
        iconTransformation(extent={{-130,50},{-110,70}})));

  ThermoCycle.Interfaces.Fluid.FlangeB OutletEvap(redeclare package Medium =
        MediumSf) annotation (Placement(transformation(extent={{-130,-82},{-110,
            -62}}), iconTransformation(extent={{-130,-82},{-110,-62}})));

  Modelica.Blocks.Interfaces.RealInput QevapORC annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-50,104}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-48,86})));

  BrickerISES.Components.ORC.HEX Eva(
    redeclare package Medium = MediumSf,
    Aint=Aeva,
    Aext=Aeva,
    Vint=Veva,
    Mdotnom=Mdotnomeva,
    Unom=UnomEva,
    Tstart_inlet=TstartEva_inlet,
    Tstart_outlet=TstartEva_outlet,
    pstart=pstartEva) annotation (Placement(transformation(
        extent={{-16,15},{16,-15}},
        rotation=90,
        origin={-73,-14})));

  BrickerISES.Components.ORC.HEX Cond(
    redeclare package Medium = MediumWat,
    Vint=Vcond,
    Aint=Acond,
    Aext=Acond,
    Mdotnom=Mdotnomcond,
    Unom=UnomCond,
    Tstart_inlet=TstartCond_inlet,
    Tstart_outlet=TstartCond_outlet,
    pstart=pstartCond) annotation (Placement(transformation(
        extent={{16,-15},{-16,15}},
        rotation=90,
        origin={11,-14})));

  ThermoCycle.Interfaces.Fluid.FlangeA InletCond(redeclare package Medium =
        MediumWat) annotation (Placement(transformation(extent={{76,-78},{96,-58}}),
        iconTransformation(extent={{70,-76},{90,-56}})));

  ThermoCycle.Interfaces.Fluid.FlangeB Outletcond(redeclare package Medium =
        MediumWat) annotation (Placement(transformation(extent={{68,50},{88,70}}),
        iconTransformation(extent={{70,68},{90,88}})));

  Modelica.Blocks.Interfaces.RealInput QcondORC annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-6,106}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={14,86})));

        parameter SIunits.Area Aeva=16 "Evaporator area";
        parameter SIunits.Volume Veva=0.03781 "Evaporator Volume";
        parameter SIunits.Area Acond=16 "Condenser area";
        parameter SIunits.Volume Vcond=0.03781 "Condenser Volume";
        parameter SIunits.MassFlowRate Mdotnomeva=1
    "Evaporator nominal mass flow rate";
        parameter SIunits.MassFlowRate Mdotnomcond=1
    "Condenser nominal mass flow rate";

      /*************************** HEAT TRANSFER ************************************/
  /*Evaporator*/
  replaceable model HeatTransferModelEva =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
    annotation (Dialog(group="Heat transfer eva", tab="General"),
      choicesAllMatching=true);
  parameter SIunits.CoefficientOfHeatTransfer UnomEva=500
    "WF: Heat transfer coefficient evaporator"
    annotation (Dialog(group="Heat transfer eva", tab="General"));

   /*Condenser*/
  replaceable model HeatTransferModelCond =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
    annotation (Dialog(group="Heat transfer cond", tab="General"),
      choicesAllMatching=true);
  parameter SIunits.CoefficientOfHeatTransfer UnomCond=500
    "WF: Heat transfer coefficient condenser"
    annotation (Dialog(group="Heat transfer cond", tab="General"));

  /***************************** INITIAL VALUES EVA **********************************/
  /* Eva Pressure */
  parameter SIunits.Pressure pstartEva= 101325 "Nominal eva side pressure "
    annotation (Dialog(tab="Initialization"));
  parameter SIunits.Temperature TstartEva_inlet= 298.15
    "Nominal eva side temperature at the inlet"
    annotation (Dialog(tab="Initialization"));
  parameter SIunits.Temperature TstartEva_outlet= 298.15
    "Nominal eva side temperature at the outlet"
    annotation (Dialog(tab="Initialization"));

  /***************************** INITIAL VALUES COND **********************************/
  /* Cond Pressure */
  parameter SIunits.Pressure pstartCond= 101325 "Nominal cond side pressure "
    annotation (Dialog(tab="Initialization"));
  parameter SIunits.Temperature TstartCond_inlet= 298.15
    "Nominal cond side temperature at the inlet"
    annotation (Dialog(tab="Initialization"));
  parameter SIunits.Temperature TstartCond_outlet= 298.15
    "Nominal cond side temperature at the outlet"
    annotation (Dialog(tab="Initialization"));

equation
  //T_sf_su = sensTpSfInlet.T;

  /* ORC electric net power - thermal secondary fluid power - thermal cold fluid power */
  //Pel_net=(-784.063642254152+6.3795011254995*(T_sf_su-273.15)+0.573454935901057*(T_cf_su-273.15)-0.0111841887964628*(T_sf_su-273.15)^2-0.00756316130343174*(T_cf_su-273.15)^2-0.00299598323974696*(T_sf_su-273.15)*(T_cf_su-273.15))*1e3;
  //Pth_SfRank=(1.07263808E+03-8.28851563E-01*T_cf_su+1.12637224E-02*T_cf_su^2-4.33581774E+00*T_sf_su+1.24455582E-02*T_sf_su^2-1.55675521E-02*T_cf_su*T_sf_su)*1e3; /*from Rank */
  //Pth_CfRank=(5.50172587E+02+4.14338074E-01*T_cf_su+6.76291805E-03*T_cf_su^2-2.68956889E+00*T_sf_su+9.31672163E-03*T_sf_su^2-1.26345843E-02*T_cf_su*T_sf_su)*1e3; /*from Rank */

  //Pel_net = Pel;
  //Pth_CfRank = PthCooling;

  //T_cf_ex = (5.67957076559994-0.165606558984694*(T_cf_su-273.15)+1.18629126631948*(T_sf_su-273.15)+0.000862506044054514*(T_cf_su-273.15)^2-0.0000942893421415677*(T_sf_su-273.15)^2-0.000963296687100146*(T_sf_su-273.15)*(T_cf_su-273.15)) + 273.15;
  //Q_orc_eva = Evaporator.InFlowSs.m_flow*(Evaporator.InFlowSs.h_outflow - Evaporator.OutFlowSs.h_outflow);

  connect(Eva.outlet_fl2, OutletEvap) annotation (Line(
      points={{-71.2,-29.68},{-71.2,-72},{-120,-72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Eva.inlet_fl2, InletEvap) annotation (Line(
      points={{-70.9,2},{-70.9,60},{-120,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Eva.u, QevapORC) annotation (Line(
      points={{-61,-14},{-50,-14},{-50,104}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(InletCond, Cond.inlet_fl2) annotation (Line(
      points={{86,-68},{8.9,-68},{8.9,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Cond.outlet_fl2, Outletcond) annotation (Line(
      points={{9.2,1.68},{9.2,60},{78,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(QcondORC, Cond.u) annotation (Line(
      points={{-6,106},{-6,-14},{-1,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{80,100}}),  graphics), Icon(coordinateSystem(
          preserveAspectRatio=false,extent={{-120,-100},{80,100}}),  graphics));
end ORCunitHex;
