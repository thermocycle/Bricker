within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_I.SizingSimpleValve;
model Size_ValveBMExternal "External valve to bypass the biomass system"
parameter Real k(start = 0.00002, fixed = false) = 0.000021;
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000)
    annotation (Placement(transformation(extent={{58,-12},{78,8}})));
BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Afull=k,
    Mdot_nom=0.1,
    Xopen=0.307,
    CheckValve=true)
                annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=450000,
    T_0=481.15)
    annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

initial equation
  valve.Mdot = 0.8;

equation

  connect(sourceP.flange, valve.InFlow) annotation (Line(
      points={{-60.6,-2},{-1,-2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{17,-2},{59.6,-2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 0.8 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 30.7% which is 
            <p> the percentage of flow with respect to the nominal one: 2.6*30.7/100 = 0.8
            
             
</html>"));
end Size_ValveBMExternal;
