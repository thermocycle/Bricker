within BrickerISES.Tests.AD.System.Layout_1;
model Test_Layout1

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

  ThermoCycle.Components.Units.PdropAndValves.DP DpBMIn(
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
  ThermoCycle.Components.Units.PdropAndValves.DP DpBMOut(
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
  Components.Biomass.Flow1DIncHeatInput BiomassBoiler(
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

  Modelica.Blocks.Sources.Constant QBM(k=1)
    annotation (Placement(transformation(extent={{-148,38},{-134,52}})));
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
ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc SF(
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
    steadystate_T_fl=true,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-88,-112},{-46,-42}})));

  Modelica.Blocks.Sources.Constant Vwind(k=0)
    annotation (Placement(transformation(extent={{-162,-40},{-148,-26}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-160,-66},{-146,-52}})));
  Modelica.Blocks.Sources.Constant Tamb(k=25)
    annotation (Placement(transformation(extent={{-162,-96},{-146,-80}})));
  Modelica.Blocks.Sources.Step DNI(
    startTime=200,
    height=0,
    offset=970)
    annotation (Placement(transformation(extent={{-162,-128},{-146,-112}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-162,-166},{-144,-148}})));
  ThermoCycle.Components.Units.Tanks.OpenTank TankBM(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    V_tank=0.02,
    L_lstart=0.99,
    Mdotnom=2.6,
    p_ext=400000,
    Tstart=518.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{116,112},{136,132}})));
  Modelica.Blocks.Sources.Constant MdotWf(k=3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={292,76})));
  Modelica.Blocks.Sources.Constant TsuWf(k=35 + 273.15) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={334,72})));
  Components.ORC.ORCunitHx ORCHx(
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
    pWf=2500000) annotation (Placement(transformation(
        extent={{-42,-37},{42,37}},
        rotation=0,
        origin={287,-2})));

 Components.Valve_lin ValveSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.42718e-05,
    CheckValve=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={54,-74})));
  Modelica.Blocks.Sources.Constant const6(k=0.04)
    annotation (Placement(transformation(extent={{18,-80},{28,-70}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
    annotation (Placement(transformation(extent={{14,-42},{34,-22}})));
  ThermoCycle.Components.Units.PdropAndValves.DP DpORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.37394e+07,
    UseHomotopy=true)
    annotation (Placement(transformation(extent={{230,-140},{210,-120}})));
 Components.Valve_lin ValveORC(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Afull=5e-05,
    Xopen=0.04) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={182,20})));
  ThermoCycle.Components.Units.Tanks.OpenTank TankSF(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    V_tank=0.02,
    L_lstart=0.1,
    p_ext=450000,
    Tstart=479.15,
    pstart=400000)
    annotation (Placement(transformation(extent={{86,-36},{106,-16}})));
equation
  connect(ValveBMExternal.InFlow, DpBMIn.InFlow) annotation (Line(
      points={{82,45},{82,2},{69,2}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ValveBMInternal.OutFlow, DpBMIn.OutFlow) annotation (Line(
      points={{12,47},{12,2},{51,2}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(QBM.y, BiomassBoiler.u) annotation (Line(
      points={{-133.3,45},{-132,45},{-132,46},{-115.8,46}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(DpBMOut.InFlow, ValveBMInternal.InFlow) annotation (Line(
      points={{43,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ValveBMInternal.OutFlow, PumpBM.InFlow) annotation (Line(
      points={{12,47},{12,2.5},{-36.8,2.5}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(BiomassBoiler.inlet_fl2, PumpBM.OutFlow) annotation (Line(
      points={{-98.64,21},{-98.64,9.4},{-49.6,9.4}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(BiomassBoiler.outlet_fl2, ValveBMInternal.InFlow) annotation (Line(
      points={{-98.12,70.5},{-96,70.5},{-96,116},{12,116},{12,65}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpBMOut.OutFlow, ValveBMExternal.OutFlow) annotation (Line(
      points={{61,116},{82,116},{82,63}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
      points={{112.4,-124.6},{-62.8,-124.6},{-62.8,-112.636}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpBMOut.OutFlow, TankBM.InFlow) annotation (Line(
      points={{61,116},{116.2,116},{116.2,113.6}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TankBM.OutFlow, ORCHx.InletSf) annotation (Line(
      points={{135.8,113.6},{243.8,113.6},{243.8,22.6667}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpSF.InFlow, SF.OutFlow) annotation (Line(
      points={{15,-32},{-60,-32},{-60,-42.6364}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ValveSF.cmd, const6.y) annotation (Line(
      points={{46,-74},{28.5,-74},{28.5,-75}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(ValveSF.OutFlow, DpSF.OutFlow) annotation (Line(
      points={{54,-65},{54,-32},{33,-32}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ValveSF.InFlow, SF.InFlow) annotation (Line(
      points={{54,-83},{54,-124},{-62.8,-124},{-62.8,-112.636}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpORC.InFlow, ORCHx.OutletSf) annotation (Line(
      points={{229,-130},{242.6,-130},{242.6,-27.4889}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpORC.OutFlow, PumpSF.InFlow) annotation (Line(
      points={{211,-130},{192,-130},{192,-132},{148,-132},{148,-131.5},{125.2,
          -131.5}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpSF.OutFlow, TankSF.InFlow) annotation (Line(
      points={{33,-32},{86.2,-32},{86.2,-34.4}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DpBMIn.InFlow, TankSF.OutFlow) annotation (Line(
      points={{69,2},{124,2},{124,-34.4},{105.8,-34.4}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ValveORC.InFlow, ORCHx.InletSf) annotation (Line(
      points={{182,29},{182,114},{243.8,114},{243.8,22.6667}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(DNI.y, SF.DNI) annotation (Line(
      points={{-145.2,-120},{-114,-120},{-114,-88.1364},{-85.9,-88.1364}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(Tamb.y, SF.Tamb) annotation (Line(
      points={{-145.2,-88},{-120,-88},{-120,-75.0909},{-85.6667,-75.0909}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(Theta.y, SF.Theta) annotation (Line(
      points={{-145.3,-59},{-136,-59},{-136,-61.0909},{-85.6667,-61.0909}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(Vwind.y, SF.v_wind) annotation (Line(
      points={{-147.3,-33},{-110,-33},{-110,-47.7273},{-85.2,-47.7273}},
      color={0,0,127},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(booleanConstant.y, SF.Defocusing) annotation (Line(
      points={{-143.1,-157},{-102,-157},{-102,-101.818},{-85.6667,-101.818}},
      color={255,0,255},
      smooth=Smooth.None,
      thickness=0.5,
      pattern=LinePattern.Dot));
  connect(MdotWf.y, ORCHx.MdotWfORC) annotation (Line(
      points={{281,76},{276.2,76},{276.2,32.5333}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(ORCHx.TWfORCSu, TsuWf.y) annotation (Line(
      points={{306.2,32.5333},{306.2,72},{323,72}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(ValveORC.OutFlow, PumpSF.InFlow) annotation (Line(
      points={{182,11},{182,-132},{136,-132},{136,-131.5},{125.2,-131.5}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{360,140}}), graphics), Icon(coordinateSystem(extent={{-200,
            -200},{360,140}})),
    experiment(StopTime=5000),
    __Dymola_experimentSetupOutput);
end Test_Layout1;
