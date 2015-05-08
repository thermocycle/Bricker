within BrickerISES.Tests.AD.System.Layout_4;
model Tank_
  ThermoCycle.Components.Units.Tanks.OpenTank openTank(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=1,
    V_tank=1,
    Mdotnom=1.947,
    p_ext=150000,
    Tstart=547.15,
    pstart=150000)
    annotation (Placement(transformation(extent={{-304,194},{-280,218}})));
  Modelica.Blocks.Math.Gain Efficiency(k=0.85)
    annotation (Placement(transformation(extent={{-282,144},{-302,164}})));
  Modelica.Blocks.Sources.Constant const(k=500000)
    annotation (Placement(transformation(extent={{-242,144},{-262,164}})));
  Components.Biomass.SimpleBiomassBoiler simpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    N=5,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    pstart_f=150000,
    Tstart_inlet_f=515.15,
    Tstart_outlet_f=543.15) annotation (Placement(transformation(
        extent={{17,18},{-17,-18}},
        rotation=90,
        origin={-333,146})));

  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ1(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-216,206},{-196,186}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal TJ2(redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-194,58},{-214,78}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensMdot sensM_ByPass(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={-211,153})));
  ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
    PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    eta_em=1,
    eta_is=1,
    epsilon_v=1,
    M_dot_start=5,
    V_dot_max=0.0074,
    X_pp0=1,
    hstart=548005)
    annotation (Placement(transformation(extent={{-276,58},{-296,78}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_SBM_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-242,200})));
  Components.ORC_Unit oRC_Unit(p_start=150000)
    annotation (Placement(transformation(extent={{-88,152},{-54,196}})));
  ParametrizedComponents.Pump_solar
                              pump1(
    M_dot_start=1.974,
    V_dot_max=0.00273,
    hstart=552473)
    annotation (Placement(transformation(extent={{-148,190},{-128,210}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=150000)
    annotation (Placement(transformation(extent={{-70,112},{-50,132}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=1.974,
    p=150000,
    T_0=489.15)
    annotation (Placement(transformation(extent={{-86,68},{-106,88}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp Sens_ORC_SU(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,204})));
equation
  connect(const.y, Efficiency.u) annotation (Line(
      points={{-263,154},{-280,154}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simpleBiomassBoiler.outlet, openTank.InFlow) annotation (Line(
      points={{-327.24,163},{-327.24,195.92},{-303.76,195.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Efficiency.y, simpleBiomassBoiler.Q) annotation (Line(
      points={{-303,154},{-304,154},{-304,154.84},{-319.5,154.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(openTank.OutFlow, Sens_SBM_SU.InFlow) annotation (Line(
      points={{-280.24,195.92},{-254,195.92},{-254,195.2},{-249,195.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Sens_SBM_SU.OutFlow, TJ1.port_1) annotation (Line(
      points={{-235,195.2},{-226.5,195.2},{-226.5,196},{-216,196}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ1.port_3, sensM_ByPass.InFlow) annotation (Line(
      points={{-206,186},{-206,172},{-206,158.2},{-205.8,158.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.InFlow, TJ2.port_2) annotation (Line(
      points={{-278.8,68.5},{-278.8,68},{-214,68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump.OutFlow, simpleBiomassBoiler.inlet) annotation (Line(
      points={{-291.6,75.4},{-326.16,75.4},{-326.16,128.66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensM_ByPass.OutFlow, TJ2.port_3) annotation (Line(
      points={{-205.8,147.8},{-205.8,78},{-204,78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pump1.OutFlow, oRC_Unit.InFlow) annotation (Line(
      points={{-132.4,207.4},{-87.3818,207.4},{-87.3818,193.492}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(oRC_Unit.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-87.6909,156.56},{-87.6909,122},{-68.4,122}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(TJ2.port_1, sourceMdot.flangeB) annotation (Line(
      points={{-194,68},{-158,68},{-158,78},{-105,78}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TJ1.port_2, Sens_ORC_SU.InFlow) annotation (Line(
      points={{-196,196},{-192,196},{-192,192},{-186,192},{-186,199.2},{
          -177,199.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Sens_ORC_SU.OutFlow, pump1.InFlow) annotation (Line(
      points={{-163,199.2},{-154.5,199.2},{-154.5,200.5},{-145.2,200.5}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -380,-100},{100,220}}), graphics), Icon(coordinateSystem(extent=
           {{-380,-100},{100,220}})));
end Tank_;
