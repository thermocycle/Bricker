within BrickerISES.Tests.AD.TestComponents.Layout_I;
model Test_ORCHx
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
    annotation (Placement(transformation(extent={{-46,-62},{14,-18}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{-94,18},{-74,38}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        350000)
    annotation (Placement(transformation(extent={{-44,-94},{-24,-74}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{-10,28},{10,48}})));
  Modelica.Blocks.Sources.Constant const1(k=2.5)
    annotation (Placement(transformation(extent={{-14,54},{-34,74}})));
equation
  connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{-35,64},{-36,64},{-36,2},{-30,2},{-30,-19.4667},{-23.7143,
          -19.4667}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{11,38},{24,38},{24,2},{0,2},{0,-19.4667},{-2.28571,-19.4667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP.flangeB, oRCunitHx.OutletSf) annotation (Line(
      points={{-42.4,-84},{-78,-84},{-78,-55.1556},{-47.7143,-55.1556}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, oRCunitHx.InletSf) annotation (Line(
      points={{-75,28},{-68,28},{-68,-25.3333},{-46.8571,-25.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORCHx;
