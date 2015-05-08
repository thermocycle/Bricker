within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model Pump_BM

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=150000,
    T_0=513.15)
    annotation (Placement(transformation(extent={{-74,8},{-54,28}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=150000)
    annotation (Placement(transformation(extent={{52,6},{72,26}})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    X_pp0=1,
    hstart=548005,
    eta_em=1,
    eta_is=1,
    epsilon_v=1,
    M_dot_start=5.28,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    V_dot_max=0.0073)
    annotation (Placement(transformation(extent={{-20,14},{0,34}})));

equation
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-54.6,18},{-46,18},{-46,20},{-36,20},{-36,24.5},{-17.2,
          24.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-4.4,31.4},{16,31.4},{16,16},{53.6,16}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end Pump_BM;
