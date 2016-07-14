within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_ORCHx
  Components.ORC.ORCunitHx oRCunitHx(
    redeclare package MediumSf =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
    N=15,
    UnomL=1000,
    UnomTp=8000,
    UnomV=2000,
    UseT=true,
    SteadyStateTWall=true,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    MdotnomWf=2.45,
    MdotnomSf=2.8,
    MdotWf=2.8,
    UnomSf=3000,
    Asf=100,
    Awf=100,
    pStartSf=350000,
    pStartWf=2500000,
    TstartInletWf=333.15,
    TstartOutletWf=403.15,
    TstartInletSf=498.15,
    TstartOutletSf=441.15,
    TWf_0=333.15,
    pWf=2500000)
    annotation (Placement(transformation(extent={{-14,-42},{46,2}})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.8,
    p=400000,
    T_0=498.15) annotation (Placement(transformation(extent={{-62,38},{-42,58}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       400000)
    annotation (Placement(transformation(extent={{-12,-74},{8,-54}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{22,48},{42,68}})));
  Modelica.Blocks.Sources.Constant const1(k=2.45)
    annotation (Placement(transformation(extent={{18,74},{-2,94}})));
equation
  connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{-3,84},{-4,84},{-4,22},{2,22},{2,0.533333},{8.28571,0.533333}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{43,58},{56,58},{56,22},{32,22},{32,0.533333},{29.7143,0.533333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sinkP.flangeB, oRCunitHx.OutletSf) annotation (Line(
      points={{-10.4,-64},{-46,-64},{-46,-35.1556},{-15.7143,-35.1556}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, oRCunitHx.InletSf) annotation (Line(
      points={{-43,48},{-36,48},{-36,-5.33333},{-14.8571,-5.33333}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_ORCHx;
