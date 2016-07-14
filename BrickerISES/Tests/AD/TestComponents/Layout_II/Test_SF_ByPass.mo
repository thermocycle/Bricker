within BrickerISES.Tests.AD.TestComponents.Layout_II;
model Test_SF_ByPass

ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    N=5,
    Ns=3,
    Nt=4,
    Mdotnom=2.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
      CollectorGeometry,
    Tstart_inlet=442.15,
    Tstart_outlet=498.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-36,-28},{6,42}})));

  Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-120,54},{-100,74}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=900)
    annotation (Placement(transformation(extent={{-120,-42},{-100,-22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-6,60},{-26,80}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{46,76},{66,96}})));
 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Afull=2.60022e-05,
    Xopen=0.0923)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={132,4})));
  Modelica.Blocks.Sources.Constant const6(k=0.0923)
    annotation (Placement(transformation(extent={{90,0},{100,10}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0064588,
    M_dot_start=2.5,
    hstart=3.46e5,
    p_su_start=350000)
    annotation (Placement(transformation(extent={{48,-74},{28,-54}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=550000,
    T_0=436.15)
    annotation (Placement(transformation(extent={{190,-66},{170,-46}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
       550000)
    annotation (Placement(transformation(extent={{176,74},{196,94}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(
                                                         redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{148,80},{168,100}})));
equation
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-99,64},{-56,64},{-56,34},{-33.2,34},{-33.2,36.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-99,30},{-64,30},{-64,22.9091},{-33.6667,22.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-99,2},{-68,2},{-68,8.90909},{-33.6667,8.90909}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-99,-32},{-80,-32},{-80,-4.13636},{-33.9,-4.13636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-97,-70},{-68,-70},{-68,-17.8182},{-33.6667,-17.8182}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-9,65.2},{4,65.2},{4,50},{-8,50},{-8,41.3636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
      points={{-23,65.2},{-40,65.2},{-40,86},{47,86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, valve.OutFlow) annotation (Line(
      points={{65,86},{132,86},{132,13}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.OutFlow, sensTp1.InFlow) annotation (Line(
      points={{132,13},{132,85.2},{151,85.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{165,85.2},{177.6,85.2},{177.6,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
      points={{-10.8,-28.6364},{-10.8,-56.6},{32.4,-56.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, PumpSF.InFlow) annotation (Line(
      points={{132,-5},{132,-63.5},{45.2,-63.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.InFlow, sourceP.flange) annotation (Line(
      points={{45.2,-63.5},{154,-63.5},{154,-56},{170.6,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const6.y, valve.cmd) annotation (Line(
      points={{100.5,5},{89.25,5},{89.25,4},{124,4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-140,-160},{220,100}},
          preserveAspectRatio=false),
                      graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-140,-160},{220,100}})));
end Test_SF_ByPass;
