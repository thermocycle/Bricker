within BrickerISES.Tests.AD.TestComponents.Sizing.Layout_II.SizingSimpleValve;
model Size_ValveToHxOW "Bypass valve for the solar field"

parameter Real k(start = 0.00002, fixed = false) = 0.000021;
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=350000)
    annotation (Placement(transformation(extent={{58,-12},{78,8}})));
 BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Afull=k,
    Mdot_nom=0.1,
    Xopen=0.04) annotation (Placement(transformation(extent={{-2,-14},{18,6}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

initial equation
  valve.Mdot = 0.25;

equation

  connect(sourceP.flange, valve.InFlow) annotation (Line(
      points={{-60.6,-2},{-30,-2},{-30,-4},{-1,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{17,-4},{38,-4},{38,-2},{59.6,-2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 0.25 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 9.25% which is 
            <p> the percentage of flow with respect to the nominal one: 9.25*4/100 = 0.25
            
             
</html>"));
end Size_ValveToHxOW;
