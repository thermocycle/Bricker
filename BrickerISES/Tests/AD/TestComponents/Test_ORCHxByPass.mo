within BrickerISES.Tests.AD.TestComponents;
model Test_ORCHxByPass
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
    annotation (Placement(transformation(extent={{-30,-22},{30,22}},
        rotation=0,
        origin={92,-6})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        550000)
    annotation (Placement(transformation(extent={{-76,-84},{-96,-64}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{78,80},{90,92}})));
  Modelica.Blocks.Sources.Constant const1(k=2.5)
    annotation (Placement(transformation(extent={{26,40},{40,54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    A=5e3,
    k=1.37394e+07,
    h=0) annotation (Placement(transformation(extent={{18,-78},{-2,-58}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Afull=5e-05,
    Xopen=0.04) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-12,2})));

  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.00679956,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-34,-78},{-54,-58}})));
equation
  connect(sourceP.flange, oRCunitHx.InletSf) annotation (Line(
      points={{-80.6,80},{61.1429,80},{61.1429,8.66667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, dP.InFlow) annotation (Line(
      points={{60.2857,-21.1556},{60.2857,-68},{17,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, valve.InFlow) annotation (Line(
      points={{-80.6,80},{-12,80},{-12,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, PumpSF.OutFlow) annotation (Line(
      points={{-77.6,-74},{-62,-74},{-62,-60.6},{-49.6,-60.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.InFlow, dP.OutFlow) annotation (Line(
      points={{-36.8,-67.5},{-28,-67.5},{-28,-68},{-1,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, dP.OutFlow) annotation (Line(
      points={{-12,-7},{-12,-68},{-1,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{90.6,86},{105.714,86},{105.714,14.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{40.7,47},{84.2857,47},{84.2857,14.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Test_ORCHxByPass;
