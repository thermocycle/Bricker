within BrickerISES.Tests.AD.TestComponents;
package SF_Validation

  model Therminol_SP_States
  replaceable package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;
  parameter Modelica.SIunits.Pressure pressure = 1e5 "pressure at the inlet";
  parameter Modelica.SIunits.Temperature T_su = 150 + 273
      "Temperature at the inlet";
  parameter Modelica.SIunits.Temperature T_ex_100 = 250 + 273.15
      "Temperature at the outlet of solar collector";
  parameter Modelica.SIunits.Temperature T_ex_50 = 200 + 273.15
      "Temperature at the outlet of solar collector";
  parameter Modelica.SIunits.Temperature T_ex_33 = 188 + 273.15
      "Temperature at the outlet of solar collector";
  final parameter Modelica.SIunits.VolumeFlowRate V_100 = 6360/(3600*1E3);
  final parameter Modelica.SIunits.VolumeFlowRate V_50 = 13008/(3600*1E3);
  final parameter Modelica.SIunits.VolumeFlowRate V_33 = 19836/(3600*1E3);

  /* Mass flow*/
  Modelica.SIunits.MassFlowRate Mdot_100;
  Modelica.SIunits.MassFlowRate Mdot_50;
  Modelica.SIunits.MassFlowRate Mdot_33;

  /* Density */
  Medium.Density rho_su;
  Medium.Density rho_ex_100;
  Medium.Density rho_ex_50;
  Medium.Density rho_ex_33;

  /* Average Density */
  Medium.Density rho_ave_100;
  Medium.Density rho_ave_50;
  Medium.Density rho_ave_33;

  /* Thermodynamic properties */
  Medium.ThermodynamicState fluidState_su
      "FluidState at the outlet of Sol+Biomass";
  Medium.ThermodynamicState fluidState_ex_100
      "FluidState at the inlet of the biomass boiler";
  Medium.ThermodynamicState fluidState_ex_50
      "FluidState at evaporator inlet - ORC side";
  Medium.ThermodynamicState fluidState_ex_33
      "FluidState at evaporator inlet - ORC side";

  equation
  fluidState_su = Medium.setState_pT(pressure,T_su);

  fluidState_ex_100 = Medium.setState_pT(pressure,T_ex_100);

  fluidState_ex_50 = Medium.setState_pT(pressure,T_ex_50);

  fluidState_ex_33 = Medium.setState_pT(pressure,T_ex_33);

  rho_su = Medium.density(fluidState_su);

  rho_ex_100 = Medium.density(fluidState_ex_100);

  rho_ex_50 = Medium.density(fluidState_ex_50);

  rho_ex_33 = Medium.density(fluidState_ex_33);

  rho_ave_100 = (rho_su + rho_ex_100)/2;
  rho_ave_50 = (rho_su + rho_ex_50)/2;
  rho_ave_33 = (rho_su + rho_ex_33)/2;

  Mdot_100 = V_100*rho_ave_100;
  Mdot_50 = V_100*rho_ave_50;
  Mdot_33 = V_100*rho_ave_33;

  end Therminol_SP_States;

  model Test_SolarField_series_DT_100

  // Simulation to validate the solar field model based on the data provided by Soltigua in excel
  // DELTA T per trough = 100 °C
    ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
      solarField_Soltigua_Inc(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      N=10,
      Mdotnom=1.7,
      Nt=2,
      Ns=6,
      Unom=10000,
      Tstart_inlet=423.15,
      Tstart_outlet=523.15,
      pstart=150000) annotation (Placement(transformation(
          extent={{21,21},{-21,-21}},
          rotation=-90,
          origin={-1,1})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000,
      T_0=423.15)
      annotation (Placement(transformation(extent={{80,-74},{60,-54}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
      annotation (Placement(transformation(extent={{62,56},{82,76}})));
    Modelica.Blocks.Sources.Constant V_wind(k=0)
      annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
    Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
      annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
    Modelica.Blocks.Sources.Constant DNI(k=800)
      annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-88,-52},{-78,-42}})));
    ParametrizedComponents.Pump_solar
                                pump(V_dot_max=0.0017)
      annotation (Placement(transformation(extent={{36,-82},{16,-62}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{46,-58},{30,-42}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{14,46},{26,58}})));

  parameter Real Eff = 64 "Efficiency from Soltigua data";
  parameter Real Q = 332 "Power from Soltigua data";

  Real Dev_eff "Deviation from Reference data for efficiency";
  Real Dev_Q "Deviation from Reference data for deliverable power";

  Real Eff_sim "Value of efficiency from simulation";
  Real Q_sim "Value of deliverable power from simulation";

  equation
   Eff_sim = solarField_Soltigua_Inc.Summary.Eta_solarCollector*100;
   Dev_eff = (Eff -Eff_sim)*100/Eff;

   Q_sim =solarField_Soltigua_Inc.Summary.Q_htf/1000;
   Dev_Q = (Q - Q_sim)*100/Q;

    connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
        points={{-79.5,-25},{-56,-25},{-56,-13.6576},{6.10606,-13.6576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
        points={{-79.5,-5},{-1.72121,-5},{-1.72121,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
        points={{-79.5,15},{-36,15},{-36,-13.4242},{-10.1212,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
        points={{-79.5,37},{-48,37},{-48,-12.9576},{-18.1394,-12.9576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
        Line(
        points={{-77.5,-47},{14.3152,-47},{14.3152,-13.4242}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(pump.InFlow, sourceP.flange) annotation (Line(
        points={{33.2,-71.5},{48,-71.5},{48,-64},{60.6,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarField_Soltigua_Inc.OutFlow, sensTp1.InFlow) annotation (Line(
        points={{-21.1939,12.2424},{-21.1939,46.36},{20,46.36}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{20.2,47.12},{52,47.12},{52,66},{63.6,66}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
        points={{38,-57.52},{6,-57.52},{6,-64.6},{20.4,-64.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
        points={{32.4,-51.84},{26,-51.84},{26,9.44242},{20.8061,9.44242}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
        points={{38,-57.52},{48,-57.52},{48,-52},{26,-52},{26,9.44242},{20.8061,
            9.44242}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput);
  end Test_SolarField_series_DT_100;

  model Test_SolarField_series_DT_50

  // Simulation to validate the solar field model based on the data provided by Soltigua in excel
  // DELTA T per trough = 50 °C
    ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
      solarField_Soltigua_Inc(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      N=10,
      Mdotnom=1.7,
      Unom=10000,
      Ns=3,
      Nt=4,
      Tstart_inlet=423.15,
      Tstart_outlet=473.15,
      pstart=150000) annotation (Placement(transformation(
          extent={{21,21},{-21,-21}},
          rotation=-90,
          origin={-1,1})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000,
      T_0=423.15)
      annotation (Placement(transformation(extent={{80,-74},{60,-54}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
      annotation (Placement(transformation(extent={{62,56},{82,76}})));
    Modelica.Blocks.Sources.Constant V_wind(k=0)
      annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
    Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
      annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
    Modelica.Blocks.Sources.Constant DNI(k=800)
      annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-88,-52},{-78,-42}})));
    ParametrizedComponents.Pump_solar
                                pump(V_dot_max=0.003613333)
      annotation (Placement(transformation(extent={{36,-82},{16,-62}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{4,-62},{-12,-46}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{14,46},{26,58}})));
  parameter Real Eff = 65 "Efficiency from Soltigua data";
  parameter Real Q = 344 "Power from Soltigua data";

  Real Dev_eff "Deviation from Reference data for efficiency";
  Real Dev_Q "Deviation from Reference data for deliverable power";

  Real Eff_sim "Value of efficiency from simulation";
  Real Q_sim "Value of deliverable power from simulation";

  equation
   Eff_sim = solarField_Soltigua_Inc.Summary.Eta_solarCollector*100;
   Dev_eff = (Eff -Eff_sim)*100/Eff;

   Q_sim =solarField_Soltigua_Inc.Summary.Q_htf/1000;
   Dev_Q = (Q - Q_sim)*100/Q;

    connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
        points={{-79.5,-25},{-56,-25},{-56,-13.6576},{6.10606,-13.6576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
        points={{-79.5,-5},{-1.72121,-5},{-1.72121,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
        points={{-79.5,15},{-36,15},{-36,-13.4242},{-10.1212,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
        points={{-79.5,37},{-48,37},{-48,-12.9576},{-18.1394,-12.9576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
        Line(
        points={{-77.5,-47},{14.3152,-47},{14.3152,-13.4242}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(pump.InFlow, sourceP.flange) annotation (Line(
        points={{33.2,-71.5},{48,-71.5},{48,-64},{60.6,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarField_Soltigua_Inc.OutFlow, sensTp1.InFlow) annotation (Line(
        points={{-21.1939,12.2424},{-21.1939,46.36},{20,46.36}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{24.2,49.12},{56,49.12},{56,66},{63.6,66}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
        points={{1.6,-57.84},{6,-57.84},{6,-64.6},{20.4,-64.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
        points={{-9.6,-57.84},{-16,-57.84},{-16,9.44242},{20.8061,9.44242}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput);
  end Test_SolarField_series_DT_50;

  model Test_SolarField_series_DT_33

  // Simulation to validate the solar field model based on the data provided by Soltigua in excel
  // DELTA T per trough = 50 °C
    ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc
      solarField_Soltigua_Inc(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.ConvectiveHeatTransfer.Ideal,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      N=10,
      Mdotnom=1.7,
      Unom=10000,
      Ns=2,
      Nt=6,
      Tstart_inlet=423.15,
      Tstart_outlet=461.15,
      pstart=150000) annotation (Placement(transformation(
          extent={{21,21},{-21,-21}},
          rotation=-90,
          origin={-1,1})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=100000,
      T_0=423.15)
      annotation (Placement(transformation(extent={{80,-74},{60,-54}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=150000)
      annotation (Placement(transformation(extent={{62,56},{82,76}})));
    Modelica.Blocks.Sources.Constant V_wind(k=0)
      annotation (Placement(transformation(extent={{-90,32},{-80,42}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-90,10},{-80,20}})));
    Modelica.Blocks.Sources.Constant Tamb(k=35 + 273.15)
      annotation (Placement(transformation(extent={{-90,-10},{-80,0}})));
    Modelica.Blocks.Sources.Constant DNI(k=800)
      annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-70,-42},{-60,-32}})));
    ParametrizedComponents.Pump_solar
                                pump(V_dot_max=0.00551)
      annotation (Placement(transformation(extent={{36,-82},{16,-62}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{54,-40},{38,-24}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{14,46},{26,58}})));
  parameter Real Eff = 66 "Efficiency from Soltigua data";
  parameter Real Q = 346 "Power from Soltigua data";

  Real Dev_eff "Deviation from Reference data for efficiency";
  Real Dev_Q "Deviation from Reference data for deliverable power";

  Real Eff_sim "Value of efficiency from simulation";
  Real Q_sim "Value of deliverable power from simulation";

  equation
   Eff_sim = solarField_Soltigua_Inc.Summary.Eta_solarCollector*100;
   Dev_eff = (Eff -Eff_sim)*100/Eff;

   Q_sim =solarField_Soltigua_Inc.Summary.Q_htf/1000;
   Dev_Q = (Q - Q_sim)*100/Q;
    connect(DNI.y, solarField_Soltigua_Inc.DNI) annotation (Line(
        points={{-79.5,-25},{-56,-25},{-56,-13.6576},{6.10606,-13.6576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarField_Soltigua_Inc.Tamb) annotation (Line(
        points={{-79.5,-5},{-1.72121,-5},{-1.72121,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarField_Soltigua_Inc.Theta) annotation (Line(
        points={{-79.5,15},{-36,15},{-36,-13.4242},{-10.1212,-13.4242}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_wind.y, solarField_Soltigua_Inc.v_wind) annotation (Line(
        points={{-79.5,37},{-48,37},{-48,-12.9576},{-18.1394,-12.9576}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarField_Soltigua_Inc.Defocusing) annotation (
        Line(
        points={{-59.5,-37},{14.3152,-37},{14.3152,-13.4242}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(pump.InFlow, sourceP.flange) annotation (Line(
        points={{33.2,-71.5},{48,-71.5},{48,-64},{60.6,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarField_Soltigua_Inc.OutFlow, sensTp1.InFlow) annotation (Line(
        points={{-21.1939,12.2424},{-21.1939,46.36},{20,46.36}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{24.2,49.12},{56,49.12},{56,66},{63.6,66}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, pump.OutFlow) annotation (Line(
        points={{46,-39.52},{6,-39.52},{6,-64.6},{20.4,-64.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, solarField_Soltigua_Inc.InFlow) annotation (Line(
        points={{62.4,-39.84},{56,-39.84},{56,9.44242},{20.8061,9.44242}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput);
  end Test_SolarField_series_DT_33;
annotation (Documentation(info="<html>
<p>In this package the three simulations reported by soltigua in the Combinations_V4 document are
reproduced. Total efficiency and total deliverable power are compared with the results of Soltigua</p>

<p> For both compared variable there is a descrepancy of the order of max 3.5%. At the same time the 
DeltaT (i.e. the difference in temperature at the inlet and outlet of the solar field) 
in the simulation results smaller then the DeltaT in the Soltigua results.</p>
<p> This leads to two possible conclusions:</p>
<ul>
<li> The total net surface considered by Soltigua is bigger than the one reported in the data sheet
<li> The calculation of the efficiency as it is reported in the datasheet of the collector is not the same one used by Soltigua
</ul>

<p> Missing data:</p>
<ul>
<li> Ambient temperature --> imposed to be 35 °C in the simulations performed
</ul>

</html>"));
end SF_Validation;
