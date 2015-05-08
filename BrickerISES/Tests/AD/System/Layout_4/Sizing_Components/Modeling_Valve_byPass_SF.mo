within BrickerISES.Tests.AD.System.Layout_4.Sizing_Components;
model Modeling_Valve_byPass_SF
//parameter Real k( start = 1,fixed = false) = 1;

//Modelica.SIunits.MassFlowRate Mdot = valve.Mdot;

  ThermoCycle.Components.Units.PdropAndValves.Valve valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.5857,
    UseNom=false,
    Afull=3.8e-5,
    DELTAp_0=150000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-28,20},{-8,40}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=300000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
    annotation (Placement(transformation(extent={{50,20},{70,40}})));
//initial equation

//Mdot = 0.5857;

equation
  connect(sourceP.flange, valve.InFlow) annotation (Line(
      points={{-60.6,30},{-27,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-9,30},{51.6,30}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Modeling_Valve_byPass_SF;
