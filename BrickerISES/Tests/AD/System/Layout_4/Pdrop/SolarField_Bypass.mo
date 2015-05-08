within BrickerISES.Tests.AD.System.Layout_4.Pdrop;
model SolarField_Bypass

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
    Unom=300,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    N=10,
    Ns=2,
    Nt=6,
    Mdotnom=1.3833,
    Tstart_inlet=423.15,
    Tstart_outlet=523.15,
    pstart=150000) annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-73,15})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=150000)
    annotation (Placement(transformation(extent={{66,80},{86,100}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-130,36},{-120,46}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-130,14},{-120,24}})));
  Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
    annotation (Placement(transformation(extent={{-130,-6},{-120,4}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-130,-26},{-120,-16}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-114,-46},{-104,-36}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,-62},{-78,-50}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_EX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-28,64},{-14,78}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{22,-72},{10,-60}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank1(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{6,72},{18,60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_BM_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{38,50},{50,62}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ORC_EX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{48,-66},{36,-54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.947,
    p=300000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{96,-72},{76,-52}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ByPass_SF(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{36,-28},{24,-16}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    UseNom=false,
    A=5e3,
    Mdot_nom=1.3833,
    k=7.74e7,
    p_nom=300000,
    T_nom=513.15,
    DELTAp_start=150000)
    annotation (Placement(transformation(extent={{-68,58},{-48,78}})));

  ThermoCycle.Components.Units.PdropAndValves.Valve valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.5857,
    UseNom=false,
    Afull=3.8e-5,
    DELTAp_0=150000,
    p_nom=150000,
    T_nom=523.15)
    annotation (Placement(transformation(extent={{24,2},{4,22}})));
equation
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-103.5,-41},{-59.56,-41},{-59.56,-3.06}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_SU.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (
      Line(
      points={{-76.2,-58.88},{-76.2,-18},{-73.42,-18},{-73.42,-5.58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank1.port_2, Sens_BM_SU.InFlow) annotation (Line(
      points={{18,66},{32,66},{32,53.12},{39.8,53.12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_BM_SU.OutFlow, sinkP.flangeB) annotation (Line(
      points={{48.2,53.12},{56,53.12},{56,90},{67.6,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_ORC_EX.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{46.2,-62.88},{55.1,-62.88},{55.1,-62},{77,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_ORC_EX.OutFlow, TJ_ExpTank.port_1) annotation (Line(
      points={{37.8,-62.88},{30,-62.88},{30,-66},{22,-66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-119.5,41},{-106,41},{-106,30.54},{-92.32,30.54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-119.5,19},{-92.53,19},{-92.53,20.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-119.5,-1},{-106,-1},{-106,10.17},{-92.53,10.17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-119.5,-21},{-100,-21},{-100,0.72},{-92.32,0.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Sens_SF_SU.InFlow, TJ_ExpTank.port_2) annotation (Line(
      points={{-67.8,-58.88},{-40,-58.88},{-40,-66},{10,-66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, TJ_ExpTank1.port_3) annotation (Line(
      points={{5,12},{-6,12},{-6,38},{12,38},{12,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank.port_3, Sens_ByPass_SF.InFlow) annotation (Line(
      points={{16,-60},{16,-42},{52,-42},{52,-24.88},{34.2,-24.88}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_ByPass_SF.OutFlow, valve1.InFlow) annotation (Line(
      points={{25.8,-24.88},{18,-24.88},{18,-6},{38,-6},{38,10},{23,10},{
          23,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.OutFlow, dP.InFlow) annotation (Line(
      points={{-73.42,35.58},{-73.42,68},{-67,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Sens_SF_EX.InFlow) annotation (Line(
      points={{-49,68},{-40,68},{-40,67.64},{-25.9,67.64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_EX.OutFlow, TJ_ExpTank1.port_1) annotation (Line(
      points={{-16.1,67.64},{-7.05,67.64},{-7.05,66},{6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end SolarField_Bypass;
