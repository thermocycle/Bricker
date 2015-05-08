within BrickerISES.Tests.AD.System.Layout_4.Sizing_Components;
model Sizing_Pdrop_SF
parameter Real k( start=1,fixed=false) = 1;

  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=1.974,
    rho_nom=5000,
    UseNom=false,
    h=0,
    k=k*1,
    A=5e3,
    DELTAp_0=20000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
    annotation (Placement(transformation(extent={{68,30},{88,50}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.3833,
    p=150000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));

Modelica.SIunits.Pressure DELTAp_ = dP.DELTAp;
initial equation
DELTAp_ = 1.5*10^5;

equation
  connect(dP.OutFlow, sinkP.flangeB) annotation (Line(
      points={{1,0},{34,0},{34,40},{69.6,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
      points={{-61,40},{-40,40},{-40,0},{-17,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end Sizing_Pdrop_SF;
