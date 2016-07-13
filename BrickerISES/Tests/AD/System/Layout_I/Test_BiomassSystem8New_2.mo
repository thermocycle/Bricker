within BrickerISES.Tests.AD.System.Layout_I;
model Test_BiomassSystem8New_2

  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
        400000) annotation (Placement(transformation(extent={{90,78},{110,98}})));
  BrickerISES.Components.Valve_lin valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.307,
    Afull=5.21173e-05)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,28})));

  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{68,-34},{48,-14}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{40,80},{60,100}})));
 BrickerISES.Components.Valve_lin valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={10,30})));
  Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
    N=10,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    QcombustionNominal=258e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    QcombustionStart=258e3,
    CombustionInitialization=Modelica.Blocks.Types.Init.SteadyState,
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    pstart=100000,
    Tstart_inlet=523.15,
    Tstart_outlet=533.15,
    Tstart_inlet_wall=528.15,
    Tstart_outlet_wall=538.15) annotation (Placement(transformation(
        extent={{25,-26},{-25,26}},
        rotation=90,
        origin={-97,20})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-154,14},{-140,28}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0264686,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{-36,-34},{-56,-14}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    X_pp0=0.5,
    eta_is=0.7,
    M_dot_start=9.4,
    hstart=564.9e3,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    V_dot_max=0.0070114,
    p_su_start=400000)
    annotation (Placement(transformation(extent={{140,-42},{120,-22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    p0=450000,
    T_0=424.15)
    annotation (Placement(transformation(extent={{40,-150},{20,-130}})));
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
    Mdotnom=0.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare model FluidHeatTransferModel =
        ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
    Ns=19,
    N=2,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=450000,
    steadystate_T_fl=true)
    annotation (Placement(transformation(extent={{-100,-134},{-58,-64}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-182,-22},{-162,-2}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-182,-64},{-162,-44}})));
  Modelica.Blocks.Sources.Constant const2(
                                         k=25)
    annotation (Placement(transformation(extent={{-182,-96},{-162,-76}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=1000)
    annotation (Placement(transformation(extent={{-182,-130},{-162,-110}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-180,-168},{-160,-148}})));
equation
  connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
      points={{80,37},{80,88},{91.6,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, dP.InFlow) annotation (Line(
      points={{80,19},{80,-24},{67,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
      points={{59,90},{76,90},{76,88},{91.6,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, dP.OutFlow) annotation (Line(
      points={{10,21},{10,-24},{49,-24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-139.3,21},{-134,21},{-134,20},{-117.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP1.InFlow, valve1.InFlow) annotation (Line(
      points={{41,90},{10,90},{10,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, pump.InFlow) annotation (Line(
      points={{10,21},{10,-23.5},{-38.8,-23.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
      points={{-100.64,-5},{-100.64,-16.6},{-51.6,-16.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, valve1.InFlow) annotation (Line(
      points={{-100.12,44.5},{-98,44.5},{-98,90},{10,90},{10,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.InFlow, pump1.OutFlow) annotation (Line(
      points={{67,-24},{104,-24},{104,-24.6},{124.4,-24.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-161,-12},{-144,-12},{-144,-69.7273},{-97.2,-69.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-161,-54},{-150,-54},{-150,-83.0909},{-97.6667,-83.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-161,-86},{-146,-86},{-146,-97.0909},{-97.6667,-97.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-161,-120},{-138,-120},{-138,-110.136},{-97.9,-110.136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-159,-158},{-150,-158},{-150,-156},{-124,-156},{-124,-123.818},{
          -97.6667,-123.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.InFlow, sourceP.flange) annotation (Line(
      points={{-74.8,-134.636},{-74.8,-140},{20.6,-140}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, pump1.InFlow) annotation (Line(
      points={{-72,-64.6364},{-72,-56},{160,-56},{160,-31.5},{137.2,-31.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -160},{200,120}}), graphics), Icon(coordinateSystem(extent={{-160,
            -160},{200,120}})));
end Test_BiomassSystem8New_2;
