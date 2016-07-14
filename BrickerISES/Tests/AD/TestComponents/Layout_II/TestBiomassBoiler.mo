within BrickerISES.Tests.AD.TestComponents.Layout_II;
model TestBiomassBoiler

  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
    QcombustionStart=10e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    Unom=1000,
    QcombustionNominal=200e3,
    pstart=100000,
    Tstart_inlet=525.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-31,10})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=9.4,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p=100000,
    T_0=525.15)
    annotation (Placement(transformation(extent={{-76,-94},{-56,-74}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       100000)  annotation (Placement(transformation(extent={{12,48},{32,68}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-94,0},{-74,20}})));

  Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-14,70},{-32,86}})));
equation
  connect(sourceMdot.flangeB, flow1DIncHeatInput.inlet_fl2) annotation (Line(
      points={{-57,-84},{-34.64,-84},{-34.64,-15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.u, const.y) annotation (Line(
      points={{-51.8,10},{-73,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, temperature_OUT_SF.port) annotation (
     Line(
      points={{-34.12,34.5},{-34.12,62},{-23,62},{-23,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, temperature_OUT_SF.port) annotation (Line(
      points={{13.6,58},{0,58},{0,60},{-24,60},{-24,62},{-23,62},{-23,70}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=100),
    __Dymola_experimentSetupOutput);
end TestBiomassBoiler;
