within BrickerISES.Tests.FA;
model TestStraTankOil

  Components.StraTank straTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    N=31,
    wnomIN=2.7766,
    wnomOUT=2.7766,
    Vlstart=36.7,
    k_fluid=0.01,
    k_wall=15,
    U_env_bottom=0,
    U_env_wall=0,
    U_env_top=0,
    V_tank=56,
    H_D=3,
    d_met=0.004763,
    Tstart=(200 + 273.15)*ones(30),
    p=400000) annotation (Placement(transformation(extent={{-44,-40},{2,22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.7766,
    UseT=false,
    h_0=3.03e6,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p=400000) annotation (Placement(transformation(extent={{-92,14},{-72,34}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66)
    annotation (Placement(transformation(extent={{-64,-78},{-84,-58}})));
  Modelica.Blocks.Sources.Constant const(k=30 + 273.15)
    annotation (Placement(transformation(extent={{-94,-24},{-74,-4}})));
  Modelica.Blocks.Sources.Constant const1(k=200 + 273.15)
    annotation (Placement(transformation(extent={{-106,56},{-86,76}})));
equation
  connect(sourceMdot.flangeB, straTank.portHotSF) annotation (Line(
      points={{-73,24},{-58,24},{-58,18.59},{-40.78,18.59}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, straTank.portColdSF) annotation (Line(
      points={{-64.2,-68},{-54,-68},{-54,-37.21},{-40.32,-37.21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, straTank.T_env) annotation (Line(
      points={{-73,-14},{-56,-14},{-56,-10.24},{-37.33,-10.24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, sourceMdot.in_T) annotation (Line(
      points={{-85,66},{-84,66},{-84,30},{-82.2,30}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3600, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end TestStraTankOil;
