within BrickerISES.Tests.AD.TestComponents.Sizing.SizingSimpleValve;
model Size_ValveHxOilWater
  "Recirculation valve for the OilWater heat exchanger"

  parameter Real k(start = 0.00002, fixed = false) = 0.000021;
 ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
    annotation (Placement(transformation(extent={{58,4},{78,24}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Afull=k,
    Xopen=0.5,
    Mdot_nom=3.834)
                annotation (Placement(transformation(extent={{-2,4},{18,24}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    T_0=351.15)
    annotation (Placement(transformation(extent={{-80,4},{-60,24}})));

initial equation
  valve.Mdot = 3.6815;

equation
  connect(sourceP.flange,valve. InFlow) annotation (Line(
      points={{-60.6,14},{-1,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow,sinkP1. flangeB) annotation (Line(
      points={{17,14},{59.6,14}},
      color={0,0,255},
      smooth=Smooth.None));

    annotation (   Documentation(info="<html>
    <p>Model to size the recirculation valve for Oil-Water heat exchanger
    <p> The mass flow through it is 3.83 kg/s when the heat exchanger is delivering 40 kW
    <p> The fraction of the valve area open is set to 50% to allow a certain degree of flexibility
            
             
              
 </html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics));
end Size_ValveHxOilWater;
