within BrickerISES.Tests.AD.System.Layout_1;
model Test_BiomassSystem8New_3_6_Tsensor

  BrickerISES.Components.Valve_lin ValveBMExternal(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.307,
    Afull=5.21173e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,54})));

  ThermoCycle.Components.Units.PdropAndValves.DP PdropBMin(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.06049e+07,
    UseHomotopy=true,
    t_init=100,
    constinit=false,
    DELTAp_start=50000)
    annotation (Placement(transformation(extent={{70,-8},{50,12}})));
  ThermoCycle.Components.Units.PdropAndValves.DP PdropBMout(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.95179e+07,
    UseHomotopy=true,
    t_init=100,
    constinit=false,
    DELTAp_start=50000)
    annotation (Placement(transformation(extent={{42,106},{62,126}})));
 BrickerISES.Components.Valve_lin ValveBMInternal(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    CheckValve=true,
    Xopen=0.8085,
    Afull=0.000188002) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={12,56})));
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
        origin={-95,46})));

  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-152,40},{-138,54}})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
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
    annotation (Placement(transformation(extent={{-34,-8},{-54,12}})));
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
    annotation (Placement(transformation(extent={{128,-142},{108,-122}})));
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
    annotation (Placement(transformation(extent={{-88,-118},{-46,-48}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-180,4},{-160,24}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-180,-38},{-160,-18}})));
  Modelica.Blocks.Sources.Constant const2(
                                         k=25)
    annotation (Placement(transformation(extent={{-180,-70},{-160,-50}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=730)
    annotation (Placement(transformation(extent={{-180,-104},{-160,-84}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-178,-142},{-158,-122}})));
  ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
    redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom_sf=2.6,
    Mdotnom_wf=2.5,
    N=15,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_sf=1000,
    Unom_l=1000,
    Unom_tp=8000,
    Unom_v=2000,
    A_sf=80,
    A_wf=80,
    steadystate_T_wall=true,
    pstart_sf=350000,
    pstart_wf=1800000,
    Tstart_inlet_wf=333.15,
    Tstart_outlet_wf=403.15,
    Tstart_inlet_sf=518.15,
    Tstart_outlet_sf=427.15)
    annotation (Placement(transformation(extent={{-25,-22},{25,22}},
        rotation=90,
        origin={207,48})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=2.5,
    p=100000,
    T_0=333.15)
    annotation (Placement(transformation(extent={{226,-24},{246,-4}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=2500000)
    annotation (Placement(transformation(extent={{264,104},{284,124}})));
  ThermoCycle.Components.Units.Tanks.OpenTank Tank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.02,
    L_lstart=0.99,
    Mdotnom=2.6,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{116,112},{136,132}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{162,100},{182,120}})));
equation
  connect(ValveBMExternal.InFlow, PdropBMin.InFlow) annotation (Line(
      points={{82,45},{82,2},{69,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveBMInternal.OutFlow, PdropBMin.OutFlow) annotation (Line(
      points={{12,47},{12,2},{51,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, flow1DIncHeatInput.u) annotation (Line(
      points={{-137.3,47},{-132,47},{-132,46},{-115.8,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PdropBMout.InFlow, ValveBMInternal.InFlow) annotation (Line(
      points={{43,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveBMInternal.OutFlow, PumpBM.InFlow) annotation (Line(
      points={{12,47},{12,2.5},{-36.8,2.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-98.64,21},{-98.64,9.4},{-49.6,9.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(flow1DIncHeatInput.outlet_fl2, ValveBMInternal.InFlow) annotation (
      Line(
      points={{-98.12,70.5},{-96,70.5},{-96,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
      points={{-159,14},{-142,14},{-142,-53.7273},{-85.2,-53.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
      points={{-159,-28},{-148,-28},{-148,-67.0909},{-85.6667,-67.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, solarCollectorIncSchott.Tamb) annotation (Line(
      points={{-159,-60},{-144,-60},{-144,-81.0909},{-85.6667,-81.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-159,-94},{-136,-94},{-136,-94.1364},{-85.9,-94.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-157,-132},{-148,-132},{-148,-130},{-122,-130},{-122,-107.818},{
          -85.6667,-107.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(PdropBMout.OutFlow, ValveBMExternal.OutFlow) annotation (Line(
      points={{61,116},{82,116},{82,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{245,-14},{266,-14},{266,10},{215.462,10},{215.462,28.7692}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkP1.flangeB, hx1DInc.outlet_fl1) annotation (Line(
      points={{265.6,114},{215.462,114},{215.462,67.2308}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(hx1DInc.outlet_fl2, PumpSF.InFlow) annotation (Line(
      points={{197.185,29.1538},{197.185,-131.5},{125.2,-131.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.OutFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{112.4,-124.6},{-62.8,-124.6},{-62.8,-118.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(solarCollectorIncSchott.OutFlow, PdropBMin.InFlow) annotation (Line(
      points={{-60,-48.6364},{-60,-30.6364},{150,-30.6364},{150,2},{69,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PdropBMout.OutFlow, Tank.InFlow) annotation (Line(
      points={{61,116},{116.2,116},{116.2,113.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank.OutFlow, sensTp.InFlow) annotation (Line(
      points={{135.8,113.6},{150,113.6},{150,105.2},{165,105.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
      points={{179,105.2},{196.846,105.2},{196.846,66.8462}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{300,140}}), graphics), Icon(coordinateSystem(extent={{-200,
            -200},{300,140}})));
end Test_BiomassSystem8New_3_6_Tsensor;
