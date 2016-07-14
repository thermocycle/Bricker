within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_II.SizingSimpleValve;
model Size_PumpSf
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    X_pp0=0.5,
    M_dot_start=2.5,
    hstart=3.46e5,
    V_dot_max=0.0064588,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-8,-26},{12,-6}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h_0=564.9e3,
    UseT=true,
    p0=350000,
    T_0=436.15)
    annotation (Placement(transformation(extent={{-64,4},{-50,18}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=400000)
    annotation (Placement(transformation(extent={{54,2},{70,16}})));
equation
  connect(sourceP.flange,pump. InFlow) annotation (Line(
      points={{-50.42,11},{-28.21,11},{-28.21,-15.5},{-5.2,-15.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow,sinkP. flangeB) annotation (Line(
      points={{7.6,-8.6},{30,-8.6},{30,9},{55.28,9}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Size_PumpSf;
