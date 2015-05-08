within BrickerISES.Tests.AD.System.Layout_4.Sizing_Components;
model Modeling_Pdrop_BM
//parameter Real k( start=1,fixed=false) = 1;

  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=1.974,
    rho_nom=5000,
    UseNom=false,
    h=0,
    A=5e3,
    k=2.69e7,
    DELTAp_0=20000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=250000)
    annotation (Placement(transformation(extent={{66,30},{86,50}})));
//Modelica.SIunits.Pressure DELTAp_ = dP.DELTAp;
//Modelica.SIunits.MassFlowRate Mdot = dP.Mdot;
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=450000,
    T_0=523.15)
    annotation (Placement(transformation(extent={{-88,-2},{-68,18}})));

// initial equation
// Mdot = 5.28;

equation
  connect(dP.OutFlow, sinkP.flangeB) annotation (Line(
      points={{1,0},{34,0},{34,40},{67.6,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, dP.InFlow) annotation (Line(
      points={{-68.6,8},{-56,8},{-56,6},{-42,6},{-42,0},{-17,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),        graphics));
end Modeling_Pdrop_BM;
