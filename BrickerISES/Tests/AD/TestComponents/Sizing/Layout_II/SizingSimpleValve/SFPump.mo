within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_II.SizingSimpleValve;
model SFPump

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    M_dot_start=2.7,
    hstart=346.6e3,
    V_dot_max=0.007,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{-14,-16},{6,4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h_0=564.9e3,
    UseT=true,
    p0=350000,
    T_0=437.15)
    annotation (Placement(transformation(extent={{-70,14},{-56,28}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=550000)
    annotation (Placement(transformation(extent={{48,12},{64,26}})));
equation
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-56.42,21},{-34.21,21},{-34.21,-5.5},{-11.2,-5.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, sinkP.flangeB) annotation (Line(
      points={{1.6,1.4},{24,1.4},{24,19},{49.28,19}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SFPump;
