within BrickerISES.Tests.AD.TestComponents.Layout_I;
model Test_HX

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
    annotation (Placement(transformation(extent={{-40,-22},{10,22}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Mdot_0=2.6,
    p=350000,
    T_0=518.15) annotation (Placement(transformation(extent={{22,36},{42,56}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
    annotation (Placement(transformation(extent={{-64,46},{-44,66}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
    redeclare package Medium = ThermoCycle.Media.R245fa_CP,
    Mdot_0=3,
    p=100000,
    T_0=308.15)
    annotation (Placement(transformation(extent={{-88,-34},{-68,-14}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
      Medium = ThermoCycle.Media.R245fa_CP, p0=2500000)
    annotation (Placement(transformation(extent={{42,-40},{62,-20}})));

  ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
      Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
    annotation (Placement(transformation(extent={{-52,4},{-72,24}})));
equation
  connect(sourceMdot.flangeB, hx1DInc.inlet_fl2) annotation (Line(
      points={{41,46},{50,46},{50,10.1538},{3.84615,10.1538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sourceMdot1.flangeB, hx1DInc.inlet_fl1) annotation (Line(
      points={{-69,-24},{-62,-24},{-62,-22},{-50,-22},{-50,-8.46154},{-34.2308,
          -8.46154}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(hx1DInc.outlet_fl1, sinkP1.flangeB) annotation (Line(
      points={{4.23077,-8.46154},{14,-8.46154},{14,-28},{43.6,-28},{43.6,-30}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(sensTp.InFlow, hx1DInc.outlet_fl2) annotation (Line(
      points={{-55,9.2},{-48,9.2},{-48,9.81538},{-33.8462,9.81538}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
      points={{-69,9.2},{-82,9.2},{-82,56},{-62.4,56}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
                    graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput);
end Test_HX;
