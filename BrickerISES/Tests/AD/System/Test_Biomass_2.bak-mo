within BrickerISES.Tests.AD.System;
model Test_Biomass_2

  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    M_wall=10,
    pstart_f=150000,
    Tstart=495.15) annotation (Placement(transformation(
        extent={{29,-26},{-29,26}},
        rotation=0,
        origin={9,26})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.2,
    p=150000,
    T_0=493.15)
    annotation (Placement(transformation(extent={{-104,20},{-84,40}})));
  Modelica.Blocks.Sources.Constant const(k=150)
    annotation (Placement(transformation(extent={{-26,64},{-6,84}})));
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=2.5,
    V_tank=5,
    L_lstart=0.6,
    Mdotnom=2.2,
    p_ext=150000,
    Tstart=493.15,
    pstart=150000)
    annotation (Placement(transformation(extent={{-56,32},{-36,52}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2,
    pstart=150000)
    annotation (Placement(transformation(extent={{72,12},{92,32}})));
equation
  connect(const.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-5,74},{24.08,74},{24.08,45.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, openTank.InFlow) annotation (Line(
      points={{-85,30},{-62,30},{-62,33.6},{-55.8,33.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(openTank.OutFlow, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-36.2,33.6},{-30,33.6},{-30,35.88},{-20.58,35.88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, sinkMdot.flangeB) annotation (Line(
      points={{38,34.32},{50,34.32},{50,22},{72.2,22}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3000),
    __Dymola_experimentSetupOutput);
end Test_Biomass_2;
