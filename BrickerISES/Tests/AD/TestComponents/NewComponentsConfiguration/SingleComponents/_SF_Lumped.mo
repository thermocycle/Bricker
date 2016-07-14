within BrickerISES.Tests.AD.TestComponents.NewComponentsConfiguration.SingleComponents;
model _SF_Lumped

  Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-44,62},{-36,70}})));
  Modelica.Blocks.Sources.Constant Theta(k=0)
    annotation (Placement(transformation(extent={{-34,74},{-26,82}})));
  Modelica.Blocks.Sources.Constant V_Wind(k=0)
    annotation (Placement(transformation(extent={{-36,86},{-28,94}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    p=100000,
    T_0=446.15)
    annotation (Placement(transformation(extent={{78,20},{58,40}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000)
    annotation (Placement(transformation(extent={{62,74},{82,94}})));
Components.SF.SF_SoltiguaL_IncNoWall SF_lumped(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Nt=4,
    Ns=3,
    Unom=1000,
    Mdotnom=2.5,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-2,36},{30,84}})));
  Components.SF.SolarField_SoltiguaWall_Inc SF_discretized(
    Ns=3,
    Nt=4,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    steadystate_T_fl=true,
    steadystate_T_wall=true,
    Unom=1000,
    Mwall=26.64,
    cwall=480,
    Tstart_inlet_wall=163 + 10,
    Tstart_outlet_wall=203 + 10,
    N=5,
    Mdotnom=2.5,
    pstart=100000,
    Tstart_inlet=436.15,
    Tstart_outlet=476.15)
    annotation (Placement(transformation(extent={{-8,-76},{22,-22}})));

  Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-50,-66},{-40,-56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.5,
    p=100000,
    T_0=446.15)
    annotation (Placement(transformation(extent={{72,-88},{52,-68}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                          redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000)
    annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
  Components.DNISources.AM_DNI aM_DNI1(
                                      redeclare package AmbientDataTable =
        BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
    annotation (Placement(transformation(extent={{-48,46},{-38,56}})));
  Modelica.Blocks.Sources.Constant Tamb1(
                                        k=25 + 273.15)
    annotation (Placement(transformation(extent={{-58,-48},{-50,-40}})));
  Modelica.Blocks.Sources.Constant Theta1(
                                         k=0)
    annotation (Placement(transformation(extent={{-48,-36},{-40,-28}})));
  Modelica.Blocks.Sources.Constant V_Wind1(
                                          k=0)
    annotation (Placement(transformation(extent={{-50,-18},{-42,-10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-40,-88},{-30,-78}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant1(k=false)
    annotation (Placement(transformation(extent={{-50,26},{-40,36}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_Disc(redeclare
      package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{16,-12},{30,0}})));
  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_L(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{24,90},{34,100}})));
equation
  connect(SF_discretized.OutFlow, sinkP1.flangeB) annotation (Line(
      points={{12,-22.4909},{12,-20},{51.6,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF_discretized.InFlow, sourceMdot1.flangeB) annotation (Line(
      points={{10,-76.4909},{12,-76.4909},{12,-78},{53,-78}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aM_DNI.DNI, SF_discretized.DNI) annotation (Line(
      points={{-39.9,-61},{-6.5,-61},{-6.5,-57.5909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aM_DNI1.DNI, SF_lumped.DNI) annotation (Line(
      points={{-37.9,51},{-16,51},{-16,52.3636},{-0.4,52.3636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tamb.y, SF_lumped.Tamb) annotation (Line(
      points={{-35.6,66},{-22,66},{-22,61.3091},{-0.222222,61.3091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta.y, SF_lumped.Theta) annotation (Line(
      points={{-25.6,78},{-20,78},{-20,70.9091},{-0.222222,70.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind.y, SF_lumped.v_wind) annotation (Line(
      points={{-27.6,90},{-22,90},{-22,88},{-12,88},{-12,80.0727},{0.133333,
          80.0727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SF_lumped.OutFlow, sinkP.flangeB) annotation (Line(
      points={{19.3333,83.5636},{19.3333,84},{63.6,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SF_lumped.InFlow, sourceMdot.flangeB) annotation (Line(
      points={{17.2,35.5636},{17.2,30},{59,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Tamb1.y, SF_discretized.Tamb) annotation (Line(
      points={{-49.6,-44},{-36,-44},{-36,-47.5273},{-6.33333,-47.5273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Theta1.y, SF_discretized.Theta) annotation (Line(
      points={{-39.6,-32},{-32,-32},{-32,-36.7273},{-6.33333,-36.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Wind1.y, SF_discretized.v_wind) annotation (Line(
      points={{-41.6,-14},{-34,-14},{-34,-26.4182},{-6,-26.4182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, SF_discretized.Defocusing) annotation (Line(
      points={{-29.5,-83},{-20,-83},{-20,-68.1455},{-6.33333,-68.1455}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanConstant1.y, SF_lumped.Defocusing) annotation (Line(
      points={{-39.5,31},{-28,31},{-28,40},{-0.222222,40},{-0.222222,
          42.9818}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sensTp_SF_Disc.InFlow, sinkP1.flangeB) annotation (Line(
      points={{23,-11.64},{23,-20},{51.6,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp_SF_L.InFlow, sinkP.flangeB) annotation (Line(
      points={{29,90.3},{29,88},{38,88},{38,84},{63.6,84}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StartTime=-5000, StopTime=50000),
    __Dymola_experimentSetupOutput);
end _SF_Lumped;
