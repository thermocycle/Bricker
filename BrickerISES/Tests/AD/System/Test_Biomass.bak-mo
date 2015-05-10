within BrickerISES.Tests.AD.System;
model Test_Biomass

  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_f=2000,
    pstart_f=150000)
                   annotation (Placement(transformation(
        extent={{29,-26},{-29,26}},
        rotation=0,
        origin={9,26})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.65,
    p=150000,
    T_0=461.15)
    annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
  Modelica.Blocks.Sources.Constant const(k=335000)
    annotation (Placement(transformation(extent={{-26,64},{-6,84}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       150000)
    annotation (Placement(transformation(extent={{60,24},{80,44}})));
equation
  connect(const.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-5,74},{24.08,74},{24.08,45.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, sinkP.flangeB) annotation (Line(
      points={{38,34.32},{50,34.32},{50,34},{61.6,34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-71,32},{-46,32},{-46,35.88},{-20.58,35.88}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3000),
    __Dymola_experimentSetupOutput);
end Test_Biomass;
