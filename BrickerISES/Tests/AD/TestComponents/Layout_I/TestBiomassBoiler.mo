within BrickerISES.Tests.AD.TestComponents.Layout_I;
model TestBiomassBoiler
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    QcombustionStart=10e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-31,8})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=523.15)
    annotation (Placement(transformation(extent={{-76,-94},{-56,-74}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        100000) annotation (Placement(transformation(extent={{12,48},{32,68}})));
  Modelica.Blocks.Sources.Constant const(k=258e3)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
equation
  connect(sourceMdot.flangeB, flow1DIncHeatInput.inlet_fl2) annotation (Line(
      points={{-57,-84},{-34.64,-84},{-34.64,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.u, const.y) annotation (Line(
      points={{-51.8,8},{-64,8},{-64,30},{-79,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, sinkP.flangeB) annotation (Line(
      points={{-34.12,32.5},{-34.12,58},{13.6,58}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=100),
    __Dymola_experimentSetupOutput);
end TestBiomassBoiler;
