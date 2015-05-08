within BrickerISES.Tests.AD.System.Layout_4;
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
    Mdotnom=1.38,
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
  ParametrizedComponents.Pump_solar
                              pump(V_dot_max=0.0017)
    annotation (Placement(transformation(extent={{-14,-76},{-34,-56}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-66,-62},{-78,-50}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SF_EX(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-34,62},{-22,74}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{22,-72},{10,-60}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ_ExpTank1(redeclare package Medium
      = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{12,50},{24,38}})));
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
    p=150000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{96,-72},{76,-52}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ByPass_SF(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{12,-10},{24,2}})));
equation
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-103.5,-41},{-59.56,-41},{-59.56,-3.06}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.OutFlow, Sens_SF_EX.InFlow)
                                                           annotation (Line(
      points={{-73.42,35.58},{-73.42,65.12},{-32.2,65.12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_SU.InFlow, pump.OutFlow)
                                       annotation (Line(
      points={{-67.8,-58.88},{-66,-58.88},{-66,-58.6},{-29.6,-58.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_EX.OutFlow, TJ_ExpTank1.port_1) annotation (Line(
      points={{-23.8,65.12},{-18,65.12},{-18,44},{12,44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, TJ_ExpTank.port_2) annotation (Line(
      points={{-16.8,-65.5},{-13.4,-65.5},{-13.4,-66},{10,-66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SF_SU.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (
      Line(
      points={{-76.2,-58.88},{-76.2,-18},{-73.42,-18},{-73.42,-5.58}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ_ExpTank1.port_2, Sens_BM_SU.InFlow) annotation (Line(
      points={{24,44},{32,44},{32,53.12},{39.8,53.12}},
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
  connect(TJ_ExpTank.port_3, Sens_ByPass_SF.InFlow) annotation (Line(
      points={{16,-60},{16,-38},{6,-38},{6,-6.88},{13.8,-6.88}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_ByPass_SF.OutFlow, TJ_ExpTank1.port_3) annotation (Line(
      points={{22.2,-6.88},{34,-6.88},{34,26},{18,26},{18,38}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end SolarField_Bypass;
