within BrickerISES.Components.ORC;
model ORCunitHex
  extends Icons.ORC_unit;
  import Modelica.SIunits;
   //extends Icons.ORC_unit;
  replaceable package MediumSf =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Heat source fluid"   annotation (choicesAllMatching = true);

  replaceable package MediumWat =  ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid"   annotation (choicesAllMatching = true);

  /*******  Evaporator Parameters ************/
          parameter SIunits.Area Aeva=16 "Evaporator area";
        parameter SIunits.Volume Veva=0.03781 "Evaporator Volume";

        parameter SIunits.MassFlowRate Mdotnomeva=1
    "Evaporator nominal mass flow rate";
  replaceable model HeatTransferModelEva =
      ThermoCycle.Components.HeatFlow.HeatTransfer.MassFlowDependence
    constrainedby
    ThermoCycle.Components.HeatFlow.HeatTransfer.BaseClasses.PartialHeatTransferZones
    annotation (Dialog(group="Heat transfer eva", tab="General"),
      choicesAllMatching=true);
  parameter SIunits.CoefficientOfHeatTransfer UnomEva=500
    "WF: Heat transfer coefficient evaporator"
    annotation (Dialog(group="Heat transfer eva", tab="General"));

   /***** Condenser Parameters  ********/
  parameter SIunits.MassFlowRate Mdotnomcond=1
    "Condenser nominal mass flow rate";
    parameter SIunits.Area Acond=16 "Condenser area";
        parameter SIunits.Volume Vcond=0.03781 "Condenser Volume";
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

  Modelica.SIunits.Temperature   T_sf_su;
  Modelica.SIunits.Temperature   T_cf_su;

   ThermoCycle.Interfaces.Fluid.FlangeA InletEvap(redeclare package Medium =
        MediumSf) annotation (Placement(transformation(extent={{-110,52},{-90,
            72}}),
        iconTransformation(extent={{-110,52},{-90,72}})));

  ThermoCycle.Interfaces.Fluid.FlangeB OutletEvap(redeclare package Medium =
        MediumSf) annotation (Placement(transformation(extent={{-110,10},{-90,
            30}}),  iconTransformation(extent={{-110,10},{-90,30}})));

  Modelica.Blocks.Interfaces.RealInput QevapORC annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-50,104}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,82})));

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
        iconTransformation(extent={{4,-86},{24,-66}})));

  ThermoCycle.Interfaces.Fluid.FlangeB Outletcond(redeclare package Medium =
        MediumWat) annotation (Placement(transformation(extent={{72,20},{92,40}}),
        iconTransformation(extent={{4,-40},{24,-20}})));

  Modelica.Blocks.Interfaces.RealInput QcondORC annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-6,106}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=-90,
        origin={-33,83})));

  Modelica.Blocks.Interfaces.RealOutput Pelnet
    "ORC Electrical Net Output Power [W]"                                            annotation (Placement(
        transformation(extent={{10,50},{30,70}}), iconTransformation(extent={{10,
            50},{30,70}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SensTcfSu(redeclare package
      Medium =
        MediumWat)
    annotation (Placement(transformation(extent={{-28,-54},{-8,-32}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp SensTevaSu(redeclare package
      Medium =
        MediumSf)
    annotation (Placement(transformation(extent={{-74,72},{-60,84}})));

equation
  T_sf_su = SensTevaSu.T;
  T_cf_su = SensTcfSu.T;
  /* ORC electric net power - thermal secondary fluid power - thermal cold fluid power */
   Pelnet=(-784.063642254152+6.3795011254995*(T_sf_su-273.15)+0.573454935901057*(T_cf_su-273.15)-0.0111841887964628*(T_sf_su-273.15)^2-0.00756316130343174*(T_cf_su-273.15)^2-0.00299598323974696*(T_sf_su-273.15)*(T_cf_su-273.15))*1e3+25e3;

  connect(Eva.outlet_fl2, OutletEvap) annotation (Line(
      points={{-71.2,-29.68},{-71.2,-50},{-100,-50},{-100,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Eva.inlet_fl2, InletEvap) annotation (Line(
      points={{-70.9,2},{-70.9,62},{-100,62}},
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
      points={{9.2,1.68},{9.2,30},{82,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(QcondORC, Cond.u) annotation (Line(
      points={{-6,106},{-6,-14},{-1,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SensTcfSu.InFlow, Cond.inlet_fl2) annotation (Line(
      points={{-18,-53.34},{-18,-68},{8.9,-68},{8.9,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SensTevaSu.InFlow, InletEvap) annotation (Line(
      points={{-67,72.36},{-67,62},{-100,62}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{20,80}}),   graphics), Icon(coordinateSystem(
          preserveAspectRatio=false,extent={{-100,-100},{20,80}}),   graphics));
end ORCunitHex;
