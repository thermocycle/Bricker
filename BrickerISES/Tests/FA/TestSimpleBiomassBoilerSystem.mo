within BrickerISES.Tests.FA;
model TestSimpleBiomassBoilerSystem

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Mdot_0=0.1,
    T_0=373.15)
    annotation (Placement(transformation(extent={{66,-28},{46,-8}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-36,60},{-16,80}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-72,58},{-52,78}})));
  Modelica.Blocks.Sources.Constant const2(k=1e6)
    annotation (Placement(transformation(extent={{-98,32},{-78,52}})));
  Components.Biomass.SimpleBiomassSystem simpleBiomassSystem(
    OversizePump=1,
    V_ExpTank=1,
    V=3,
    A_f=100,
    A_b=100,
    M_wall=100,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    pstart_f=200000,
    Tstart=373.15)
    annotation (Placement(transformation(extent={{-42,-42},{12,14}})));
equation
  connect(simpleBiomassSystem.inlet, sourceMdot.flangeB) annotation (Line(
      points={{12,-33.6},{20,-33.6},{20,-18},{47,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.PumpNominalFlowFraction, const.y) annotation (
      Line(
      points={{-9.06,12.6},{-9.06,40.3},{-15,40.3},{-15,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Tamb, const1.y) annotation (Line(
      points={{-20.4,12.6},{-20.4,39.3},{-51,39.3},{-51,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassSystem.Q, const2.y) annotation (Line(
      points={{-30.12,12.6},{-54.06,12.6},{-54.06,42},{-77,42}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestSimpleBiomassBoilerSystem;
