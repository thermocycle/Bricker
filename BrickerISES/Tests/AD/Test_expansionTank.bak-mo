within BrickerISES.Tests.AD;
model Test_expansionTank
  Components.Tank.ExpansionTank expansionTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    H_D=2.5,
    V_tank=5,
    Tstart=313.15,
    pstart=200000,
    L_lstart=0.2,
    Mdotnom=2,
    Unom=1) annotation (Placement(transformation(extent={{-22,-4},{8,36}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Mdot_0=2,
    p=200000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-94,-40},{-74,-20}})));
equation
  connect(sourceMdot.flangeB, expansionTank.InFlow) annotation (Line(
      points={{-75,-30},{-7,-30},{-7,-3.6}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end Test_expansionTank;
