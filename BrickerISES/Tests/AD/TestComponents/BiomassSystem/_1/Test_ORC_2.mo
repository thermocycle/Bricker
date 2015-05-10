within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model Test_ORC_2
  Components.ORC.ORCunitHx oRCunitHx(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    N=15,
    Asf=80,
    Awf=80,
    UnomSf=1000,
    UnomL=1000,
    UnomTp=8000,
    UnomV=2000,
    MdotnomSf=2.6,
    MdotnomWf=2.5,
    MdotWf=2.5,
    UseT=true,
    SteadyStateTWall=true,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    pStartSf=350000,
    pStartWf=2500000,
    TstartInletWf=333.15,
    TstartOutletWf=403.15,
    TstartInletSf=518.15,
    TstartOutletSf=427.15,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{-44,-20},{16,24}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{32,46},{52,66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        350000)
    annotation (Placement(transformation(extent={{-54,56},{-34,76}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{-102,-62},{-82,-42}})));
  Modelica.Blocks.Sources.Constant const1(k=2.5)
    annotation (Placement(transformation(extent={{-100,-22},{-80,-2}})));
equation
  connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{-79,-12},{-76,-12},{-76,-10},{-70,-10},{-70,6.4},{-45.8,6.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{-81,-52},{-74,-52},{-74,-46},{-66,-46},{-66,-6.8},{-45.8,-6.8}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sourceMdot.flangeB, oRCunitHx.InletSf) annotation (Line(
      points={{51,56},{58,56},{58,54},{66,54},{66,15.2},{16.6,15.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, sinkP.flangeB) annotation (Line(
      points={{-43.4,15.2},{-60,15.2},{-60,46},{-72,46},{-72,66},{-52.4,66}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORC_2;