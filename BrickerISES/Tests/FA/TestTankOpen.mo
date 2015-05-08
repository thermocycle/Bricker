within BrickerISES.Tests.FA;
model TestTankOpen

  Components.Tank.Open_Tank open_Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    H_D=1,
    V_tank=1,
    Mdotnom=0.1,
    L_lstart=0.1,
    V0=0,
    p_ext=300000,
    Tstart=293.15,
    pstart=200000)
    annotation (Placement(transformation(extent={{-38,-8},{-4,36}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Mdot_0=0.1,
    p=200000,
    T_0=323.15)
    annotation (Placement(transformation(extent={{-84,0},{-64,20}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(sourceMdot.flangeB, open_Tank.InFlow) annotation (Line(
      points={{-65,10},{-52,10},{-52,0.36},{-38.34,0.36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, open_Tank.OutFlow) annotation (Line(
      points={{20.2,0},{8,0},{8,-0.52},{-4.34,-0.52}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput);
end TestTankOpen;
