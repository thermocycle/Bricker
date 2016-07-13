within BrickerISES.Tests.AD.System.Layout_1;
model Test_BiomassSystem8New_3_6_ORCUnit151ByPassSFByPassORC

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
    steadystate_T_fl=true,
    Tstart_inlet=424.15,
    Tstart_outlet=482.15,
    pstart=450000)
    annotation (Placement(transformation(extent={{-88,-118},{-46,-48}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-180,4},{-160,24}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-180,-38},{-160,-18}})));
  Modelica.Blocks.Sources.Constant const2(
                                         k=25)
    annotation (Placement(transformation(extent={{-186,-84},{-166,-64}})));
  Modelica.Blocks.Sources.Step step(
    startTime=200,
    height=0,
    offset=970)
    annotation (Placement(transformation(extent={{-190,-118},{-170,-98}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-152,-140},{-132,-120}})));
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
  Modelica.Blocks.Sources.Constant const4(k=3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={302,116})));
  Modelica.Blocks.Sources.Constant const5(k=35 + 273.15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={344,102})));
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
    pWf=2500000) annotation (Placement(transformation(
        extent={{-30,-22},{30,22}},
        rotation=0,
        origin={292,24})));

 Components.Valve_lin             valve(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Xopen=0.04,
    Mdot_nom=0.1,
    Afull=2.42718e-05,
    CheckValve=true)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-78})));

  Modelica.Blocks.Sources.Constant const6(k=0.04)
    annotation (Placement(transformation(extent={{-12,-84},{-2,-74}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=2.96368e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{-28,-44},{-8,-24}})));
  ThermoCycle.Components.Units.PdropAndValves.DP dP1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    h=0,
    A=5e3,
    k=1.37394e+07,
    UseHomotopy=true)
         annotation (Placement(transformation(extent={{226,-112},{206,-92}})));
 Components.Valve_lin             valve1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_nom=0.1,
    Afull=5e-05,
    Xopen=0.04) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={194,-32})));

  ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdotnom=2.6,
    V_tank=0.02,
    p_ext=450000,
    Tstart=479.15,
    pstart=400000,
    L_lstart=0.1)
    annotation (Placement(transformation(extent={{66,-36},{86,-16}})));
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
      points={{-165,-74},{-144,-74},{-144,-81.0909},{-85.6667,-81.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
      points={{-169,-108},{-136,-108},{-136,-94.1364},{-85.9,-94.1364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
      Line(
      points={{-131,-130},{-122,-130},{-122,-107.818},{-85.6667,-107.818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(PdropBMout.OutFlow, ValveBMExternal.OutFlow) annotation (Line(
      points={{61,116},{82,116},{82,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PumpSF.OutFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{112.4,-124.6},{-62.8,-124.6},{-62.8,-118.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PdropBMout.OutFlow, Tank.InFlow) annotation (Line(
      points={{61,116},{116.2,116},{116.2,113.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tank.OutFlow, oRCunitHx.InletSf) annotation (Line(
      points={{135.8,113.6},{261.143,113.6},{261.143,38.6667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const4.y, oRCunitHx.MdotWfORC) annotation (Line(
      points={{302,127},{288,127},{288,122},{284.286,122},{284.286,44.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, oRCunitHx.TWfORCSu) annotation (Line(
      points={{344,113},{344,44.5333},{305.714,44.5333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dP.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
      points={{-27,-34},{-60,-34},{-60,-48.6364}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.cmd, const6.y) annotation (Line(
      points={{22,-78},{14,-78},{14,-76},{-1.5,-76},{-1.5,-79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valve.OutFlow, dP.OutFlow) annotation (Line(
      points={{30,-69},{30,-34},{-9,-34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve.InFlow, solarCollectorIncSchott.InFlow) annotation (Line(
      points={{30,-87},{30,-124},{-62.8,-124},{-62.8,-118.636}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(valve1.OutFlow, dP1.OutFlow) annotation (Line(
      points={{194,-41},{196,-41},{196,-100},{190,-100},{190,-102},{207,-102}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(valve1.InFlow, oRCunitHx.InletSf) annotation (Line(
      points={{194,-23},{192,-23},{192,116},{184,116},{184,114},{261.143,114},{
          261.143,38.6667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.InFlow, oRCunitHx.OutletSf) annotation (Line(
      points={{225,-102},{260.286,-102},{260.286,8.84444}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP1.OutFlow, PumpSF.InFlow) annotation (Line(
      points={{207,-102},{194,-102},{194,-100},{150,-100},{150,-131.5},{125.2,
          -131.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
      points={{-9,-34},{66.2,-34},{66.2,-34.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(PdropBMin.InFlow, Tank1.OutFlow) annotation (Line(
      points={{69,2},{124,2},{124,-34.4},{85.8,-34.4}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{360,140}}), graphics), Icon(coordinateSystem(extent={{-200,
            -200},{360,140}})));
end Test_BiomassSystem8New_3_6_ORCUnit151ByPassSFByPassORC;
