within BrickerISES.Tests.AD.TestComponents.BiomassSystem._1;
model Test_ORCByPass
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
        rotation=90,
        origin={72,-12})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        550000)
    annotation (Placement(transformation(extent={{-66,-78},{-86,-58}})));
  Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
    annotation (Placement(transformation(extent={{70,-92},{82,-80}})));
  Modelica.Blocks.Sources.Constant const1(k=2.5)
    annotation (Placement(transformation(extent={{30,-92},{48,-74}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=400000,
    T_0=518.15)
    annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.37394e+07)
         annotation (Placement(transformation(extent={{18,-78},{-2,-58}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Afull=5e-05,
    Xopen=0.04) annotation (Placement(transformation(extent={{-10,-10},{10,10}},

        rotation=-90,
        origin={-14,2})));
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
    annotation (Placement(transformation(extent={{-34,-80},{-54,-60}})));
equation
  connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{48.9,-83},{67.6,-83},{67.6,-43.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{82.6,-86},{90,-86},{90,-64},{80.8,-64},{80.8,-43.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceP.flange, oRCunitHx.InletSf) annotation (Line(
      points={{-50.6,80},{58.8,80},{58.8,18.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRCunitHx.OutletSf, dP.InFlow) annotation (Line(
      points={{58.8,-41.4},{58.8,-68},{17,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceP.flange, valve.InFlow) annotation (Line(
      points={{-50.6,80},{-14,80},{-14,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP.flangeB, PumpSF.OutFlow) annotation (Line(
      points={{-67.6,-68},{-58,-68},{-58,-62.6},{-49.6,-62.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.InFlow, dP.OutFlow) annotation (Line(
      points={{-36.8,-69.5},{-28,-69.5},{-28,-68},{-1,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, dP.OutFlow) annotation (Line(
      points={{-14,-7},{-12,-7},{-12,-66},{-18,-66},{-18,-68},{-1,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Test_ORCByPass;
