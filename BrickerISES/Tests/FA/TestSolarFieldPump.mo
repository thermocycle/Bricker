within BrickerISES.Tests.FA;
model TestSolarFieldPump

  Components.SolarField solarField(
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Np=2,
    Unom=1500,
    Mdotnom=1.5,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Constant,
    Ns=3,
    redeclare package Medium1 =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    Tstart_inlet=423.15,
    Tstart_outlet=573.15,
    pstart=100000)
    annotation (Placement(transformation(extent={{-30,-18},{10,22}})));

  Modelica.Blocks.Sources.BooleanStep Defocusing(startValue=true, startTime=150)
    annotation (Placement(transformation(extent={{-46,-22},{-36,-12}})));
  Modelica.Blocks.Sources.Step DNI(
    height=-1000,
    offset=1000,
    startTime=300)
    annotation (Placement(transformation(extent={{0,74},{20,94}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
  Modelica.Blocks.Sources.Constant Theta(k=0.5)
    annotation (Placement(transformation(extent={{-66,70},{-46,90}})));
  Modelica.Blocks.Sources.Constant v_wind(k=0)
    annotation (Placement(transformation(extent={{-92,72},{-72,92}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p0=115794,
    T_0=423.15)
    annotation (Placement(transformation(extent={{-90,-6},{-70,14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP1(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    p0=863885,
    T_0=573.15)
    annotation (Placement(transformation(extent={{64,-2},{44,18}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66,
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=1,
    V_dot_max=5e-3)
    annotation (Placement(transformation(extent={{-60,-6},{-40,14}})));
  Modelica.Blocks.Sources.Constant pumpFlowFraction(k=1)
    annotation (Placement(transformation(extent={{-80,28},{-70,38}})));
equation
  connect(solarField.v_wind, v_wind.y) annotation (Line(
      points={{-24.2,20.2},{-24.2,50.1},{-71,50.1},{-71,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solarField.Theta, Theta.y) annotation (Line(
      points={{-16.3,20.3},{-20.4,20.3},{-20.4,80},{-45,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, solarField.Tamb) annotation (Line(
      points={{-19,84},{-4,84},{-4,20.3},{-9.5,20.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DNI.y, solarField.DNI) annotation (Line(
      points={{21,84},{14,84},{14,20.4},{-2.4,20.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpFlowFraction.y, pump.flow_in) annotation (Line(
      points={{-69.5,33},{-69.5,23.5},{-53.2,23.5},{-53.2,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceP.flange, pump.InFlow) annotation (Line(
      points={{-70.6,4},{-64,4},{-64,4.5},{-57.2,4.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, solarField.InFlow) annotation (Line(
      points={{-44.4,11.4},{-37.2,11.4},{-37.2,4.4},{-29.2,4.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarField.OutFlow, sourceP1.flange) annotation (Line(
      points={{8.8,4.4},{26.4,4.4},{26.4,8},{44.6,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Defocusing.y, solarField.Defocusing) annotation (Line(
      points={{-35.5,-17},{-32.75,-17},{-32.75,-11},{-28,-11}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=1000, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end TestSolarFieldPump;
