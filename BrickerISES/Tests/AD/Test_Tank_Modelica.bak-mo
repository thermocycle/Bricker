within BrickerISES.Tests.AD;
model Test_Tank_Modelica
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    Mdot_0=2,
    p=500000,
    T_0=313.15)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    h_0=167691,
    Mdot_0=1,
    pstart=500000)
    annotation (Placement(transformation(extent={{78,12},{98,32}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    nPorts=2,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    m_flow_small=0.001,
    V=5,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.02,
        height=0)},
    p_start=500000,
    T_start=313.15,
    use_portsData=false)
    annotation (Placement(transformation(extent={{10,72},{30,92}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{86,74},{106,94}})));
equation
  connect(sourceMdot.flangeB, volume.ports[1]) annotation (Line(
      points={{-71,20},{-38,20},{-38,24},{18,24},{18,72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(volume.ports[2], sinkMdot.flangeB) annotation (Line(
      points={{22,72},{22,22},{78.2,22}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-100},{120,100}},
          preserveAspectRatio=true),                                   graphics),
      Icon(coordinateSystem(extent={{-80,-100},{120,100}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_Tank_Modelica;
