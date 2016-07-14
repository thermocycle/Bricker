within BrickerISES.Tests.AD.TestComponents.SF_Validation;
model Test_SolarField_series_DT_33

// Simulation to validate the solar field model based on the data provided by Soltigua in excel
// DELTA T per trough = 50 °C
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
    solarField_Soltigua_Inc(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    N=10,
    Mdotnom=1.7,
    Unom=10000,
    Ns=2,
    Nt=6,
    Tstart_inlet=423.15,
    Tstart_outlet=461.15,
    pstart=150000) annotation (Placement(transformation(
        extent={{21,21},{-21,-21}},
        rotation=-90,
        origin={-1,1})));

  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=100000,
    T_0=423.15)
    annotation (Placement(transformation(extent={{80,-74},{60,-54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
    annotation (Placement(transformation(extent={{62,56},{82,76}})));
  Modelica.Blocks.Sources.Constant V_wind(k=0)
    annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
  Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
    annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
  Modelica.Blocks.Sources.Constant DNI(k=800)
    annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-70,-42},{-60,-32}})));
  ParametrizedComponents.Pump_solar
                              pump(V_dot_max=0.00551)
    annotation (Placement(transformation(extent={{36,-82},{16,-62}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{54,-40},{38,-24}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{14,46},{26,58}})));
parameter Real Eff = 66 "Efficiency from Soltigua data";
parameter Real Q = 346 "Power from Soltigua data";

Real Dev_eff "Deviation from Reference data for efficiency";
Real Dev_Q "Deviation from Reference data for deliverable power";

Real Eff_sim "Value of efficiency from simulation";
Real Q_sim "Value of deliverable power from simulation";

equation
 Eff_sim = solarField_Soltigua_Inc.Summary.Eta_solarCollector*100;
 Dev_eff = (Eff -Eff_sim)*100/Eff;

 Q_sim =solarField_Soltigua_Inc.Summary.Q_htf/1000;
 Dev_Q = (Q - Q_sim)*100/Q;
  connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
      points={{-79.5,-25},{-56,-25},{-56,-13.6576},{6.10606,-13.6576}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
      points={{-79.5,-5},{-1.72121,-5},{-1.72121,-13.4242}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
      points={{-79.5,15},{-36,15},{-36,-13.4242},{-10.1212,-13.4242}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
      points={{-79.5,37},{-48,37},{-48,-12.9576},{-18.1394,-12.9576}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
      Line(
      points={{-59.5,-37},{14.3152,-37},{14.3152,-13.4242}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump.InFlow, sourceP.flange) annotation (Line(
      points={{33.2,-71.5},{48,-71.5},{48,-64},{60.6,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField_Soltigua_Inc.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{-21.1939,12.2424},{-21.1939,46.36},{20,46.36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{24.2,49.12},{56,49.12},{56,66},{63.6,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
      points={{46,-39.52},{6,-39.52},{6,-64.6},{20.4,-64.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
      points={{62.4,-39.84},{56,-39.84},{56,9.44242},{20.8061,9.44242}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_SolarField_series_DT_33;
