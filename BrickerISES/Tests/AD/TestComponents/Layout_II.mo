within BrickerISES.Tests.AD.TestComponents;
package Layout_II
  model Test_SF

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=100000)
      annotation (Placement(transformation(extent={{-50,-22},{-8,48}})));

   ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.5,
      p=100000,
      T_0=436.15)
      annotation (Placement(transformation(extent={{-54,-70},{-34,-50}})));
   ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         100000)
      annotation (Placement(transformation(extent={{2,76},{22,96}})));
    Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-136,-2},{-116,18}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{-136,26},{-116,46}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{-136,60},{-116,80}})));
    Modelica.Blocks.Sources.Step step(
      startTime=200,
      height=0,
      offset=900)
      annotation (Placement(transformation(extent={{-136,-36},{-116,-16}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-134,-74},{-114,-54}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-22,66},{-42,86}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{28,-76},{48,-56}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{30,-44},{50,-24}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{34,-16},{54,4}})));
    Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{94,-114},{110,-100}})));
    Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{50,18},{32,34}})));
    Components.SF.SolarField_SoltiguaWall_Inc             solarField_SoltiguaWall_Inc(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Constant,
      Mwall=60,
      Ns=3,
      Nt=4,
      Unom=1000,
      Mdotnom=2.5,
      N=5,
      pstart=100000,
      Tstart_inlet=436.15,
      Tstart_outlet=477.15,
      Tstart_inlet_wall=443.15,
      Tstart_outlet_wall=443.15)
      annotation (Placement(transformation(extent={{94,-76},{130,-32}})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{36,-150},{54,-132}})));
    Modelica.Blocks.Sources.Constant Tamb1(k=900)
      annotation (Placement(transformation(extent={{32,-116},{52,-96}})));
   ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.5,
      p=100000,
      T_0=436.15)
      annotation (Placement(transformation(extent={{110,-154},{130,-134}})));
   ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(
                                                           redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         100000)
      annotation (Placement(transformation(extent={{166,-8},{186,12}})));
  equation
    connect(sourceMdot.flangeB, solarCollectorIncSchott.InFlow) annotation (
        Line(
        points={{-35,-60},{-24.8,-60},{-24.8,-22.6364}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-115,70},{-92,70},{-92,42},{-47.2,42},{-47.2,42.2727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-115,36},{-92,36},{-92,28.9091},{-47.6667,28.9091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-115,8},{-92,8},{-92,14.9091},{-47.6667,14.9091}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-115,-26},{-92,-26},{-92,1.86364},{-47.9,1.86364}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
        Line(
        points={{-113,-64},{-84,-64},{-84,-11.8182},{-47.6667,-11.8182}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-25,71.2},{-12,71.2},{-12,56},{-22,56},{-22,47.3636}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, sinkP.flangeB) annotation (Line(
        points={{-39,71.2},{-48,71.2},{-48,94},{-10,94},{-10,86},{3.6,86}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y,solarField_SoltiguaWall_Inc. v_wind) annotation (Line(
        points={{55,-6},{66,-6},{66,-20},{96.4,-20},{96.4,-35.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y,solarField_SoltiguaWall_Inc. Theta) annotation (Line(
        points={{51,-34},{62,-34},{62,-44},{96,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y,solarField_SoltiguaWall_Inc. Tamb) annotation (Line(
        points={{49,-66},{58,-66},{58,-54},{96,-54},{96,-52.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y,solarField_SoltiguaWall_Inc. Defocusing) annotation (
        Line(
        points={{54.9,-141},{82,-141},{82,-70},{96,-70},{96,-69.6}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(temperature_OUT_SF.T,hysteresis. u) annotation (Line(
        points={{34.7,26},{6,26},{6,-136},{18,-136},{18,-141},{34.2,-141}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(temperature_OUT_SF.port,solarField_SoltiguaWall_Inc. OutFlow)
      annotation (Line(
        points={{41,18},{102,18},{102,0},{118,0},{118,-32.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tamb1.y,solarField_SoltiguaWall_Inc. DNI) annotation (Line(
        points={{53,-106},{66,-106},{66,-104},{76,-104},{76,-61},{95.8,-61}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solarField_SoltiguaWall_Inc.InFlow, sourceMdot1.flangeB)
      annotation (Line(
        points={{115.6,-76.4},{115.6,-98},{150,-98},{150,-144},{129,-144}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarField_SoltiguaWall_Inc.OutFlow, sinkP1.flangeB) annotation (
        Line(
        points={{118,-32.4},{118,2},{167.6,2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(temperature_IN_SF.port, sourceMdot1.flangeB) annotation (Line(
        points={{102,-114},{104,-114},{104,-120},{128,-120},{128,-98},{150,-98},
            {150,-144},{129,-144}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-140,-160},{180,100}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-140,-160},{180,100}})));
  end Test_SF;

  model Test_SF_ByPass

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
        CollectorGeometry,
      Tstart_inlet=442.15,
      Tstart_outlet=498.15,
      pstart=100000)
      annotation (Placement(transformation(extent={{-36,-28},{6,42}})));

    Modelica.Blocks.Sources.Constant const(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{-120,54},{-100,74}})));
    Modelica.Blocks.Sources.Step step(
      startTime=200,
      height=0,
      offset=900)
      annotation (Placement(transformation(extent={{-120,-42},{-100,-22}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-118,-80},{-98,-60}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-6,60},{-26,80}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=2.96368e+07,
      UseHomotopy=true)
           annotation (Placement(transformation(extent={{46,76},{66,96}})));
   Components.Valve_lin             valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_nom=0.1,
      CheckValve=true,
      Afull=2.60022e-05,
      Xopen=0.0923)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={132,4})));
    Modelica.Blocks.Sources.Constant const6(k=0.0923)
      annotation (Placement(transformation(extent={{90,0},{100,10}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{48,-74},{28,-54}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=550000,
      T_0=436.15)
      annotation (Placement(transformation(extent={{190,-66},{170,-46}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         550000)
      annotation (Placement(transformation(extent={{176,74},{196,94}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp1(
                                                           redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{148,80},{168,100}})));
  equation
    connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-99,64},{-56,64},{-56,34},{-33.2,34},{-33.2,36.2727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-99,30},{-64,30},{-64,22.9091},{-33.6667,22.9091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-99,2},{-68,2},{-68,8.90909},{-33.6667,8.90909}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-99,-32},{-80,-32},{-80,-4.13636},{-33.9,-4.13636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
        Line(
        points={{-97,-70},{-68,-70},{-68,-17.8182},{-33.6667,-17.8182}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-9,65.2},{4,65.2},{4,50},{-8,50},{-8,41.3636}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
        points={{-23,65.2},{-40,65.2},{-40,86},{47,86}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, valve.OutFlow) annotation (Line(
        points={{65,86},{132,86},{132,13}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.OutFlow, sensTp1.InFlow) annotation (Line(
        points={{132,13},{132,85.2},{151,85.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{165,85.2},{177.6,85.2},{177.6,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-10.8,-28.6364},{-10.8,-56.6},{32.4,-56.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, PumpSF.InFlow) annotation (Line(
        points={{132,-5},{132,-63.5},{45.2,-63.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpSF.InFlow, sourceP.flange) annotation (Line(
        points={{45.2,-63.5},{154,-63.5},{154,-56},{170.6,-56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const6.y, valve.cmd) annotation (Line(
        points={{100.5,5},{89.25,5},{89.25,4},{124,4}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-140,-160},{220,100}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-140,-160},{220,100}})));
  end Test_SF_ByPass;

  model Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing

    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-228,26},{-208,46}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-226,52},{-206,72}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-222,80},{-202,100}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-80,-14},{-100,6}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         450000)
      annotation (Placement(transformation(
          extent={{-8,-8},{8,8}},
          rotation=0,
          origin={108,82})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.075)   annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={16,50})));
    Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-162,-18},{-146,-4}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      UseT=true,
      Mdot_0=2.9,
      T_0=436.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={82,-6})));
    Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-204,120},{-222,136}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-58,52})));

    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{-220,-54},{-202,-36}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={34,85})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-22,-4})));
    Modelica.Blocks.Sources.Constant Tamb1(k=670)
      annotation (Placement(transformation(extent={{-228,-4},{-208,16}})));
    Modelica.Fluid.Sensors.Temperature temperature_OUT(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{98,110},{80,126}})));
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=100000,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal)
      annotation (Placement(transformation(extent={{-180,18},{-138,88}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-22,94})));
  equation

    connect(temperature_OUT_SF.T, hysteresis.u) annotation (Line(
        points={{-219.3,128},{-250,128},{-250,-40},{-238,-40},{-238,-45},{
            -221.8,-45}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(massFlowRate1.port_a, pump.InFlow) annotation (Line(
        points={{-58,42},{-58,-3.5},{-82.8,-3.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(temperature_IN_SF.port, pump.OutFlow) annotation (Line(
        points={{-154,-18},{-154,-20},{-116,-20},{-116,3.4},{-95.6,3.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(massFlowRate2.port_b, pump.InFlow) annotation (Line(
        points={{-32,-4},{-26,-4},{-26,-3.5},{-82.8,-3.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.InFlow, massFlowRate2.port_a) annotation (Line(
        points={{16,41},{16,-4},{-12,-4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate2.port_a, sourceMdot.flangeB) annotation (Line(
        points={{-12,-4},{48,-4},{48,-6},{73,-6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{16,59},{16,86},{27,86},{27,85}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate3.port_b, sinkP.flangeB) annotation (Line(
        points={{41,85},{70.5,85},{70.5,82},{101.28,82}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(temperature_OUT.port, sinkP.flangeB) annotation (Line(
        points={{89,110},{88,110},{88,82},{101.28,82}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, pump.OutFlow) annotation (Line(
        points={{-154.8,17.3636},{-154.8,3.4},{-95.6,3.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-201,90},{-190,90},{-190,82.2727},{-177.2,82.2727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-205,62},{-192,62},{-192,68.9091},{-177.667,68.9091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-207,36},{-198,36},{-198,54.9091},{-177.667,54.9091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-207,6},{-204,6},{-204,30},{-192,30},{-192,41.8636},{-177.9,
            41.8636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
        points={{-201.1,-45},{-188,-45},{-188,28.1818},{-177.667,28.1818}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.OutFlow, massFlowRate1.port_b) annotation (
        Line(
        points={{-152,87.3636},{-152,94},{-58,94},{-58,62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(temperature_OUT_SF.port, solarCollectorIncSchott.OutFlow)
      annotation (Line(
        points={{-213,120},{-214,120},{-214,116},{-152,116},{-152,87.3636}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF.InFlow, massFlowRate1.port_b) annotation (Line(
        points={{-27.4,94},{-58,94},{-58,62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-16.6,94},{-4,94},{-4,86},{27,86},{27,85}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-240,-100},{120,160}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=2000, __Dymola_NumberOfIntervals=5000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-240,-100},{120,160}})));
  end Test_SF_Adriano_Soltigua_valve_hysteresis_V1_1_no_defocusing;

  model Test_Chiller
    Components.Chiller.Chiller_v1 chiller_v1_1(redeclare package Medium =
          ThermoCycle.Media.Water, CpConst=false)
      annotation (Placement(transformation(extent={{-16,-8},{36,38}})));
    Modelica.Blocks.Sources.Constant const(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-88,44},{-68,64}})));
    Modelica.Blocks.Sources.Constant const1(k=7.96)
      annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica.Blocks.Sources.Constant const2(k=250000)
      annotation (Placement(transformation(extent={{54,52},{74,72}})));
  equation
    connect(const.y, chiller_v1_1.Tsu) annotation (Line(
        points={{-67,54},{-52,54},{-52,33.4},{-17.56,33.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, chiller_v1_1.mdotsu) annotation (Line(
        points={{-65,18},{-48,18},{-48,20},{-38,20},{-38,21.44},{-17.56,21.44}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const2.y, chiller_v1_1.Q_td) annotation (Line(
        points={{75,62},{88,62},{88,23.74},{38.08,23.74}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end Test_Chiller;

  model Test_HX_OilWater
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Unom_l=2500,
      Unom_tp=2500,
      Unom_v=2500,
      Mdotnom_sf=4.8,
      Mdotnom_wf=3.9,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=354.15,
      Tstart_outlet_sf=347.15)
      annotation (Placement(transformation(extent={{-26,-6},{24,46}})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=4.8,
      p=100000,
      T_0=340.15)
      annotation (Placement(transformation(extent={{-76,-30},{-56,-10}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=3.9,
      p=400000,
      T_0=354.15)
      annotation (Placement(transformation(extent={{48,46},{68,66}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{44,-26},{64,-6}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000)
      annotation (Placement(transformation(extent={{-52,46},{-32,66}})));
  equation
    connect(sourceMdot.flangeB, hx1DInc.inlet_fl1) annotation (Line(
        points={{-57,-20},{-40,-20},{-40,10},{-20.2308,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc.outlet_fl1, sinkP.flangeB) annotation (Line(
        points={{18.2308,10},{30,10},{30,-16},{45.6,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot1.flangeB, hx1DInc.inlet_fl2) annotation (Line(
        points={{67,56},{70,56},{70,32},{17.8462,32}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sinkP1.flangeB, hx1DInc.outlet_fl2) annotation (Line(
        points={{-50.4,56},{-66,56},{-66,31.6},{-19.8462,31.6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end Test_HX_OilWater;

  model Test_HX_OilWater_loop
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom_sf=3.93,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Mdotnom_wf=7.96,
      counterCurrent=true,
      Unom_l=1600,
      Unom_tp=1600,
      Unom_v=1600,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=350.15,
      Tstart_outlet_sf=345.15) annotation (Placement(transformation(
          extent={{-25,-26},{25,26}},
          rotation=90,
          origin={21,12})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-54})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={66,82})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      M_dot_start=3.93,
      hstart=140.2e3,
      X_pp0=1,
      V_dot_max=0.0047,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-16,-56},{-36,-36}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-92,-38})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=0.25,
      p=350000,
      T_0=518.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-86,80})));
   Components.Valve_lin             valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Xopen=0.5,
      Afull=0.0001555,
      Mdot_nom=3.68)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-54,26})));

  equation
    connect(sourceMdot.flangeB, hx1DInc.inlet_fl1) annotation (Line(
        points={{60,-45},{60,-30},{31,-30},{31,-7.23077}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sinkP.flangeB, hx1DInc.outlet_fl1) annotation (Line(
        points={{66,73.6},{66,58},{31,58},{31,31.2308}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc.outlet_fl2, pump.InFlow) annotation (Line(
        points={{9.4,-6.84615},{9.4,-45.5},{-18.8,-45.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump.OutFlow, sinkP1.flangeB) annotation (Line(
        points={{-31.6,-38.6},{-78,-38.6},{-78,-38},{-83.6,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, sinkP1.flangeB) annotation (Line(
        points={{-54,17},{-54,-38},{-83.6,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot1.flangeB, valve.OutFlow) annotation (Line(
        points={{-77,80},{-54,80},{-54,35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
        points={{-54,35},{-54,80},{9,80},{9,30.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end Test_HX_OilWater_loop;

  model Test_HX_OilWater_II

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-54})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={66,82})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      V_dot_max=0.00909278,
      M_dot_start=3.9,
      hstart=145528,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-42,-10},{-62,10}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         350000) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-92,-38})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=0.1,
      p=350000,
      T_0=498.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-86,80})));

    Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-50,-38})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc1(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Unom_l=2500,
      Unom_tp=2500,
      Unom_v=2500,
      Mdotnom_sf=4.8,
      Mdotnom_wf=3.9,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=354.15,
      Tstart_outlet_sf=347.15)
      annotation (Placement(transformation(extent={{-25,-26},{25,26}},
          rotation=90,
          origin={19,16})));
  equation
    connect(sinkP1.flangeB, massFlowRate2.port_b) annotation (Line(
        points={{-83.6,-38},{-60,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot1.flangeB, hx1DInc1.inlet_fl2) annotation (Line(
        points={{-77,80},{-56,80},{-56,78},{7,78},{7,34.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
        points={{7.4,-2.84615},{7.4,-38},{-40,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump.InFlow, massFlowRate2.port_a) annotation (Line(
        points={{-44.8,0.5},{-28,0.5},{-28,-38},{-40,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
        points={{-57.6,7.4},{-57.6,60},{-40,60},{-40,78},{7,78},{7,34.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
        points={{60,-45},{60,-26},{34,-26},{34,-3.23077},{29,-3.23077}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl1, sinkP.flangeB) annotation (Line(
        points={{29,35.2308},{29,52},{66,52},{66,73.6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics));
  end Test_HX_OilWater_II;

  model Test_HX_OilWater_IIChiller

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={46,-54})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={52,82})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      V_dot_max=0.00909278,
      M_dot_start=3.9,
      hstart=145528,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-42,-10},{-62,10}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         350000) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-98,-56})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=0.1,
      p=350000,
      T_0=498.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-96,74})));

    Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-50,-38})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc1(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Unom_l=2500,
      Unom_tp=2500,
      Unom_v=2500,
      Mdotnom_sf=4.8,
      Mdotnom_wf=3.9,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=354.15,
      Tstart_outlet_sf=347.15)
      annotation (Placement(transformation(extent={{-25,-26},{25,26}},
          rotation=90,
          origin={5,16})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium
        = ThermoCycle.Media.Water)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={38,59})));
    Components.Chiller.Chiller_v2 chiller_v1_1(T_start_su=343.15, m_start=8)
      annotation (Placement(transformation(extent={{126,12},{184,66}})));
    Modelica.Blocks.Sources.Constant const(k=250000)
      annotation (Placement(transformation(extent={{162,100},{182,120}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{6,52},{26,72}})));
  equation
    connect(sinkP1.flangeB, massFlowRate2.port_b) annotation (Line(
        points={{-89.6,-56},{-70,-56},{-70,-38},{-60,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot1.flangeB, hx1DInc1.inlet_fl2) annotation (Line(
        points={{-87,74},{-70,74},{-70,78},{-7,78},{-7,34.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
        points={{-6.6,-2.84615},{-6.6,-38},{-40,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump.InFlow, massFlowRate2.port_a) annotation (Line(
        points={{-44.8,0.5},{-28,0.5},{-28,-38},{-40,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
        points={{-57.6,7.4},{-57.6,60},{-54,60},{-54,78},{-7,78},{-7,34.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
        points={{46,-45},{46,-26},{20,-26},{20,-3.23077},{15,-3.23077}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate1.port_b, sinkP.flangeB) annotation (Line(
        points={{45,59},{52,59},{52,73.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(massFlowRate1.m_flow, chiller_v1_1.mdotsu) annotation (Line(
        points={{38,65.6},{38,68},{78,68},{78,46.56},{124.26,46.56}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, chiller_v1_1.Q_td) annotation (Line(
        points={{183,110},{220,110},{220,52},{186.32,52},{186.32,49.26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl1, sensTp.InFlow) annotation (Line(
        points={{15,35.2308},{15,46},{2,46},{2,57.2},{9,57.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, massFlowRate1.port_a) annotation (Line(
        points={{23,57.2},{28,57.2},{28,59},{31,59}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.T, chiller_v1_1.Tsu) annotation (Line(
        points={{24,68},{28,68},{28,106},{86,106},{86,60.6},{124.26,60.6}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{240,180}}),      graphics), Icon(coordinateSystem(extent={{-100,
              -100},{240,180}})));
  end Test_HX_OilWater_IIChiller;

  model TestBiomassBoiler

    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionStart=10e3,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Unom=1000,
      QcombustionNominal=200e3,
      pstart=100000,
      Tstart_inlet=525.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{25,-26},{-25,26}},
          rotation=90,
          origin={-31,10})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      Mdot_0=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p=100000,
      T_0=525.15)
      annotation (Placement(transformation(extent={{-76,-94},{-56,-74}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         100000)  annotation (Placement(transformation(extent={{12,48},{32,68}})));
    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-94,0},{-74,20}})));

    Modelica.Fluid.Sensors.Temperature temperature_OUT_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-14,70},{-32,86}})));
  equation
    connect(sourceMdot.flangeB, flow1DIncHeatInput.inlet_fl2) annotation (Line(
        points={{-57,-84},{-34.64,-84},{-34.64,-15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.u, const.y) annotation (Line(
        points={{-51.8,10},{-73,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, temperature_OUT_SF.port) annotation (
       Line(
        points={{-34.12,34.5},{-34.12,62},{-23,62},{-23,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sinkP.flangeB, temperature_OUT_SF.port) annotation (Line(
        points={{13.6,58},{0,58},{0,60},{-24,60},{-24,62},{-23,62},{-23,70}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics),
      experiment(StopTime=100),
      __Dymola_experimentSetupOutput);
  end TestBiomassBoiler;

  model Test_BiomassSystem

    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000)  annotation (Placement(transformation(extent={{114,54},{134,74}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.9,
      p=450000,
      T_0=471.15)
      annotation (Placement(transformation(extent={{152,-62},{132,-42}})));
    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.40698e-05,
      Xopen=0.344,
      Mdot_nom=0.93)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,0})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.08063e+07)
           annotation (Placement(transformation(extent={{56,-62},{36,-42}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.98666e+07)
           annotation (Placement(transformation(extent={{40,52},{60,72}})));
   BrickerISES.Components.Valve_lin valve1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=0.000188098,
      Xopen=0.8106,
      Mdot_nom=7.62)
                  annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={10,2})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionNominal=210e3,
      Unom=2500,
      QcombustionStart=210e3,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState)
                                 annotation (Placement(transformation(
          extent={{25,-26},{-25,26}},
          rotation=90,
          origin={-97,-8})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-156,-14},{-142,0}})));
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
      annotation (Placement(transformation(extent={{-36,-62},{-56,-42}})));
  equation
    connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
        points={{133,-52},{80,-52},{80,-9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.OutFlow, sinkP.flangeB) annotation (Line(
        points={{80,9},{80,64},{115.6,64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, dP.InFlow) annotation (Line(
        points={{80,-9},{80,-52},{55,-52}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{59,62},{76,62},{76,64},{115.6,64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve1.OutFlow, dP.OutFlow) annotation (Line(
        points={{10,-7},{10,-52},{37,-52}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-141.3,-7},{-134,-7},{-134,-8},{-117.8,-8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(dP1.InFlow, valve1.InFlow) annotation (Line(
        points={{41,62},{10,62},{10,11}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve1.OutFlow, pump.InFlow) annotation (Line(
        points={{10,-7},{10,-51.5},{-38.8,-51.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-100.64,-33},{-100.64,-44.6},{-51.6,-44.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, valve1.InFlow) annotation (Line(
        points={{-100.12,16.5},{-98,16.5},{-98,62},{10,62},{10,11}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
              -140},{160,120}}), graphics), Icon(coordinateSystem(extent={{-160,-140},
              {160,120}})));
  end Test_BiomassSystem;

  model Test_BiomassSystem_II

    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000)  annotation (Placement(transformation(extent={{126,52},{146,72}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.9,
      p=450000,
      T_0=471.15)
      annotation (Placement(transformation(extent={{152,-62},{132,-42}})));
    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=9.88372e-05)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,0})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.93032e+07,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{40,52},{60,72}})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionStart=210e3,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionNominal=200e3,
      Unom=1000,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{20.5,-27.5},{-20.5,27.5}},
          rotation=90,
          origin={-98.5,0.5})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-156,8},{-142,22}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.026507,
      hstart=575410,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-36,-62},{-56,-42}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{52,-60},{32,-40}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-2,-6},{18,14}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-108,74},{-80,96}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{90,78},{104,90}})));
  equation
    connect(sourceMdot.flangeB, valve.InFlow) annotation (Line(
        points={{133,-52},{80,-52},{80,-9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-141.3,15},{-134,15},{-134,0.5},{-120.5,0.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-102.35,-20},{-102.35,-44.6},{-51.6,-44.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.InFlow, Mflow_BmRecirculation.port_a) annotation (Line(
        points={{41,62},{20,62},{20,60},{-18,60},{-18,4},{-2,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, MflowSfToBm.port_a) annotation (Line(
        points={{133,-52},{52,-52},{52,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
        points={{32,-50},{-4,-50},{-4,-51.5},{-38.8,-51.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
        points={{18,4},{18,-44},{14,-44},{14,-51.5},{-38.8,-51.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
        points={{59,62},{80,62},{80,9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{59,62},{127.6,62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMSysOut.port, sinkP.flangeB) annotation (Line(
        points={{97,78},{98,78},{98,62},{127.6,62}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, Mflow_BmRecirculation.port_a)
      annotation (Line(
        points={{-101.8,20.59},{-101.8,50},{-18,50},{-18,4},{-2,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, Mflow_BmRecirculation.port_a) annotation (Line(
        points={{-94,74},{-94,50},{-18,50},{-18,4},{-2,4}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
              -140},{160,120}}), graphics), Icon(coordinateSystem(extent={{-160,-140},
              {160,120}})));
  end Test_BiomassSystem_II;

  model Test_ORCHx
    Components.ORC.ORCunitHx oRCunitHx(
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      N=15,
      UnomL=1000,
      UnomTp=8000,
      UnomV=2000,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      MdotnomSf=2.8,
      MdotWf=2.8,
      UnomSf=3000,
      Asf=100,
      Awf=100,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=498.15,
      TstartOutletSf=441.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{-14,-42},{46,2}})));

    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.8,
      p=400000,
      T_0=498.15) annotation (Placement(transformation(extent={{-62,38},{-42,58}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000)
      annotation (Placement(transformation(extent={{-12,-74},{8,-54}})));
    Modelica.Blocks.Sources.Constant const(k=60 + 273.15)
      annotation (Placement(transformation(extent={{22,48},{42,68}})));
    Modelica.Blocks.Sources.Constant const1(k=2.45)
      annotation (Placement(transformation(extent={{18,74},{-2,94}})));
  equation
    connect(const1.y, oRCunitHx.MdotWfORC) annotation (Line(
        points={{-3,84},{-4,84},{-4,22},{2,22},{2,0.533333},{8.28571,0.533333}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{43,58},{56,58},{56,22},{32,22},{32,0.533333},{29.7143,0.533333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sinkP.flangeB, oRCunitHx.OutletSf) annotation (Line(
        points={{-10.4,-64},{-46,-64},{-46,-35.1556},{-15.7143,-35.1556}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, oRCunitHx.InletSf) annotation (Line(
        points={{-43,48},{-36,48},{-36,-5.33333},{-14.8571,-5.33333}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput);
  end Test_ORCHx;

  model Test_SF_ByPassBiomass

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Tstart_inlet=442.15,
      Tstart_outlet=498.15,
      pstart=100000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
        CollectorGeometry)
      annotation (Placement(transformation(extent={{-46,-116},{-4,-46}})));

    Modelica.Blocks.Sources.Constant const(k=25)
      annotation (Placement(transformation(extent={{-132,-96},{-112,-76}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{-132,-68},{-112,-48}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{-132,-34},{-112,-14}})));
    Modelica.Blocks.Sources.Step step(
      startTime=200,
      height=0,
      offset=960)
      annotation (Placement(transformation(extent={{-132,-130},{-112,-110}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-130,-168},{-110,-148}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-18,-42},{-38,-22}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=2.96368e+07,
      UseHomotopy=true)
           annotation (Placement(transformation(extent={{32,-22},{52,-2}})));
   Components.Valve_lin             valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_nom=0.1,
      CheckValve=true,
      Afull=2.60022e-05,
      Xopen=0.0923)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={72,-82})));
    Modelica.Blocks.Sources.Constant const6(k=0.0923)
      annotation (Placement(transformation(extent={{26,-84},{36,-74}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      hstart=564.9e3,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.007,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{128,-168},{108,-148}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      p0=350000,
      T_0=437.15)
      annotation (Placement(transformation(extent={{178,-154},{158,-134}})));
    Components.Valve_lin             valve1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=5.40698e-05,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={74,68})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.08063e+07)
           annotation (Placement(transformation(extent={{62,6},{42,26}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.98666e+07)
           annotation (Placement(transformation(extent={{34,120},{54,140}})));
   Components.Valve_lin             valve2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=0.000188098,
      Xopen=0.8106,
      Mdot_nom=7.62)
                  annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={4,70})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionNominal=210e3,
      Unom=2500,
      QcombustionStart=210e3,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState)
                                 annotation (Placement(transformation(
          extent={{25,-26},{-25,26}},
          rotation=90,
          origin={-103,60})));

    Modelica.Blocks.Sources.Constant const2(
                                           k=1)
      annotation (Placement(transformation(extent={{-162,54},{-148,68}})));
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
      annotation (Placement(transformation(extent={{-42,6},{-62,26}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      V_tank=0.02,
      L_lstart=0.9,
      p_ext=450000,
      Tstart=479.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{88,-18},{108,2}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      V_tank=0.02,
      Mdotnom=2.6,
      p_ext=400000,
      Tstart=518.15,
      pstart=400000,
      L_lstart=0.001)
      annotation (Placement(transformation(extent={{116,112},{136,132}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkMdot sinkMdot(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_0=2.703,
      pstart=400000)
      annotation (Placement(transformation(extent={{160,104},{180,124}})));
  equation
    connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-111,-24},{-68,-24},{-68,-54},{-43.2,-54},{-43.2,-51.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-111,-58},{-76,-58},{-76,-65.0909},{-43.6667,-65.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-111,-86},{-80,-86},{-80,-79.0909},{-43.6667,-79.0909}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-111,-120},{-68,-120},{-68,-92.1364},{-43.9,-92.1364}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
        Line(
        points={{-109,-158},{-80,-158},{-80,-105.818},{-43.6667,-105.818}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(sensTp.InFlow, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-21,-36.8},{-18,-36.8},{-18,-46.6364}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-20.8,-116.636},{-20.8,-150.6},{112.4,-150.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const6.y, valve.cmd) annotation (Line(
        points={{36.5,-79},{53.25,-79},{53.25,-82},{64,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
        points={{-35,-36.8},{-48,-36.8},{-48,-12},{33,-12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceP.flange, PumpSF.InFlow) annotation (Line(
        points={{158.6,-144},{144,-144},{144,-157.5},{125.2,-157.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{72,-91},{72,-150.6},{112.4,-150.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, valve.OutFlow) annotation (Line(
        points={{51,-12},{72,-12},{72,-73}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.InFlow, dP2.InFlow) annotation (Line(
        points={{4,79},{4,130},{35,130}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const2.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-147.3,61},{-140,61},{-140,60},{-123.8,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(dP2.InFlow,valve2. InFlow) annotation (Line(
        points={{35,130},{4,130},{4,79}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.OutFlow,pump. InFlow) annotation (Line(
        points={{4,61},{4,16.5},{-44.8,16.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
        points={{-106.64,35},{-106.64,23.4},{-57.6,23.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2,valve2. InFlow) annotation (Line(
        points={{-106.12,84.5},{-104,84.5},{-104,130},{4,130},{4,79}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, pump.InFlow) annotation (Line(
        points={{43,16},{32,16},{32,14},{4,14},{4,16},{-44.8,16.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, valve1.OutFlow) annotation (Line(
        points={{53,130},{74,130},{74,77}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve1.InFlow, dP1.InFlow) annotation (Line(
        points={{74,59},{74,16},{61,16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
        points={{51,-12},{82,-12},{82,-16.4},{88.2,-16.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
        points={{107.8,-16.4},{134,-16.4},{134,16},{61,16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
        points={{53,130},{94,130},{94,112},{116.2,112},{116.2,113.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank.OutFlow, sinkMdot.flangeB) annotation (Line(
        points={{135.8,113.6},{147.9,113.6},{147.9,114},{160.2,114}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-140,-160},{240,140}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-140,-160},{240,140}})));
  end Test_SF_ByPassBiomass;

  model Test_SF_ByPassBiomassORC

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Tstart_inlet=442.15,
      Tstart_outlet=498.15,
      pstart=100000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
        CollectorGeometry)
      annotation (Placement(transformation(extent={{-104,-110},{-62,-40}})));

    Modelica.Blocks.Sources.Constant const(k=25)
      annotation (Placement(transformation(extent={{-180,-88},{-160,-68}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{-180,-60},{-160,-40}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{-180,-26},{-160,-6}})));
    Modelica.Blocks.Sources.Step step(
      startTime=200,
      height=0,
      offset=960)
      annotation (Placement(transformation(extent={{-180,-122},{-160,-102}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-178,-160},{-158,-140}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-72,-24},{-52,-4}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=2.96368e+07,
      UseHomotopy=true)
           annotation (Placement(transformation(extent={{32,-28},{52,-8}})));
   Components.Valve_lin             valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_nom=0.1,
      CheckValve=true,
      Afull=2.60022e-05,
      Xopen=0.0923)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={72,-82})));
    Modelica.Blocks.Sources.Constant const6(k=0.0923)
      annotation (Placement(transformation(extent={{26,-84},{36,-74}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      hstart=564.9e3,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.007,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{128,-168},{108,-148}})));
    Components.Valve_lin             valve1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=5.40698e-05,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={74,68})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.08063e+07)
           annotation (Placement(transformation(extent={{62,6},{42,26}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.98666e+07)
           annotation (Placement(transformation(extent={{34,120},{54,140}})));
   Components.Valve_lin             valve2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=0.000188098,
      Xopen=0.8106,
      Mdot_nom=7.62)
                  annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={4,70})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionNominal=210e3,
      Unom=2500,
      QcombustionStart=210e3,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState)
                                 annotation (Placement(transformation(
          extent={{25,-26},{-25,26}},
          rotation=90,
          origin={-103,60})));

    Modelica.Blocks.Sources.Constant const2(
                                           k=1)
      annotation (Placement(transformation(extent={{-162,54},{-148,68}})));
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
      annotation (Placement(transformation(extent={{-42,6},{-62,26}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      L_lstart=0.9,
      V_tank=0.05,
      p_ext=450000,
      Tstart=479.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{88,-14},{108,6}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      L_lstart=0.001,
      V_tank=0.05,
      p_ext=400000,
      Tstart=518.15,
      pstart=400000)
      annotation (Placement(transformation(extent={{130,114},{150,134}})));
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
      MdotWf=2.5,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=518.15,
      TstartOutletSf=427.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{204,-32},{264,12}})));
    Modelica.Blocks.Sources.Constant const4(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{240,58},{260,78}})));
    Modelica.Blocks.Sources.Constant const5(k=2.45)
      annotation (Placement(transformation(extent={{236,84},{216,104}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=3.13021e+07)
           annotation (Placement(transformation(extent={{200,-160},{180,-140}})));
   Components.Valve_lin             valve3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdot_nom=0.1,
      Xopen=0.04,
      Afull=0.000125)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={164,2})));

  equation
    connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-159,-16},{-116,-16},{-116,-46},{-101.2,-46},{-101.2,-45.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-159,-50},{-124,-50},{-124,-59.0909},{-101.667,-59.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-159,-78},{-128,-78},{-128,-73.0909},{-101.667,-73.0909}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-159,-112},{-116,-112},{-116,-86.1364},{-101.9,-86.1364}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
        Line(
        points={{-157,-150},{-128,-150},{-128,-99.8182},{-101.667,-99.8182}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-78.8,-110.636},{-78.8,-150.6},{112.4,-150.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const6.y, valve.cmd) annotation (Line(
        points={{36.5,-79},{53.25,-79},{53.25,-82},{64,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{72,-91},{72,-150.6},{112.4,-150.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, valve.OutFlow) annotation (Line(
        points={{51,-18},{72,-18},{72,-73}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.InFlow, dP2.InFlow) annotation (Line(
        points={{4,79},{4,130},{35,130}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const2.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-147.3,61},{-140,61},{-140,60},{-123.8,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(dP2.InFlow,valve2. InFlow) annotation (Line(
        points={{35,130},{4,130},{4,79}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.OutFlow,pump. InFlow) annotation (Line(
        points={{4,61},{4,16.5},{-44.8,16.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
        points={{-106.64,35},{-106.64,23.4},{-57.6,23.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2,valve2. InFlow) annotation (Line(
        points={{-106.12,84.5},{-104,84.5},{-104,130},{4,130},{4,79}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, pump.InFlow) annotation (Line(
        points={{43,16},{32,16},{32,14},{4,14},{4,16},{-44.8,16.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, valve1.OutFlow) annotation (Line(
        points={{53,130},{74,130},{74,77}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve1.InFlow, dP1.InFlow) annotation (Line(
        points={{74,59},{74,16},{61,16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
        points={{51,-18},{82,-18},{82,-12.4},{88.2,-12.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
        points={{107.8,-12.4},{122,-12.4},{122,16},{61,16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
        points={{53,130},{94,130},{94,118},{130.2,118},{130.2,115.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const5.y,oRCunitHx. MdotWfORC) annotation (Line(
        points={{215,94},{214,94},{214,32},{220,32},{220,10.5333},{226.286,
            10.5333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{261,68},{274,68},{274,32},{250,32},{250,10.5333},{247.714,
            10.5333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tank.OutFlow, oRCunitHx.InletSf) annotation (Line(
        points={{149.8,115.6},{203.143,115.6},{203.143,4.66667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(oRCunitHx.OutletSf, dP3.InFlow) annotation (Line(
        points={{202.286,-25.1556},{202.286,-150},{199,-150}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpSF.InFlow, dP3.OutFlow) annotation (Line(
        points={{125.2,-157.5},{140,-157.5},{140,-150},{181,-150}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve3.InFlow, oRCunitHx.InletSf) annotation (Line(
        points={{164,11},{164,116},{203.143,116},{203.143,4.66667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve3.OutFlow, dP3.OutFlow) annotation (Line(
        points={{164,-7},{164,-150},{181,-150}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.OutFlow, sensTp.InFlow) annotation (Line(
        points={{-76,-40.6364},{-76,-18},{-69,-18},{-69,-18.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
        points={{-55,-18.8},{33,-18.8},{33,-18}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-140,-160},{240,140}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=1000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-140,-160},{240,140}})));
  end Test_SF_ByPassBiomassORC;

  model Test_SF_ByPassBiomassORCHx

  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Tstart_inlet=442.15,
      Tstart_outlet=498.15,
      pstart=100000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_30
        CollectorGeometry)
      annotation (Placement(transformation(extent={{-118,-78},{-76,-8}})));

    Modelica.Blocks.Sources.Constant const(k=25)
      annotation (Placement(transformation(extent={{-194,-56},{-174,-36}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{-194,-28},{-174,-8}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{-194,6},{-174,26}})));
    Modelica.Blocks.Sources.Step step(
      startTime=200,
      height=0,
      offset=960)
      annotation (Placement(transformation(extent={{-194,-90},{-174,-70}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
      annotation (Placement(transformation(extent={{-192,-128},{-172,-108}})));
    ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=2.96368e+07,
      UseHomotopy=true,
      Mdot_nom=2.45,
      DELTAp_lin_nom=100000,
      DELTAp_start=100000)
           annotation (Placement(transformation(extent={{-14,4},{6,24}})));
   Components.Valve_lin             valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=2.60022e-05,
      Xopen=0.0923,
      Mdot_nom=0.25,
      DELTAp_nom=100000)
                  annotation (Placement(transformation(extent={{-10,-9},{10,9}},
          rotation=90,
          origin={57,-50})));
    Modelica.Blocks.Sources.Constant const6(k=0.0923)
      annotation (Placement(transformation(extent={{12,-52},{32,-32}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      hstart=564.9e3,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.007,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{114,-136},{94,-116}})));
    Components.Valve_lin             valve1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Afull=5.40698e-05,
      Mdot_nom=0.6,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,100})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.08063e+07,
      Mdot_nom=1.77,
      DELTAp_lin_nom=50000,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{48,38},{28,58}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.98666e+07,
      Mdot_nom=1.77,
      DELTAp_lin_nom=50000,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{20,152},{40,172}})));
   Components.Valve_lin             valve2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=0.000188098,
      Xopen=0.8106,
      Mdot_nom=6.62,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-10,102})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionNominal=210e3,
      Unom=2500,
      QcombustionStart=210e3,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState)
                                 annotation (Placement(transformation(
          extent={{25,-26},{-25,26}},
          rotation=90,
          origin={-117,92})));

    Modelica.Blocks.Sources.Constant const2(
                                           k=1)
      annotation (Placement(transformation(extent={{-176,86},{-162,100}})));
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
      annotation (Placement(transformation(extent={{-56,38},{-76,58}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      L_lstart=0.9,
      V_tank=0.05,
      p_ext=450000,
      Tstart=479.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{78,14},{98,34}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      L_lstart=0.000001,
      V_tank=0.5,
      p_ext=400000,
      Tstart=518.15,
      pstart=400000)
      annotation (Placement(transformation(extent={{116,146},{136,166}})));
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
      MdotWf=2.5,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=518.15,
      TstartOutletSf=427.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{310,2},{370,46}})));
    Modelica.Blocks.Sources.Constant const4(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{346,92},{366,112}})));
    Modelica.Blocks.Sources.Constant const5(k=2.45)
      annotation (Placement(transformation(extent={{342,118},{322,138}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=3.13021e+07,
      UseHomotopy=true,
      Mdot_nom=2.45,
      DELTAp_lin_nom=50000,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{306,-126},{286,-106}})));
   Components.Valve_lin             valve3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Xopen=0.04,
      Afull=0.000125,
      Mdot_nom=0.1,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={150,90})));

    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom_sf=3.93,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Mdotnom_wf=7.96,
      counterCurrent=true,
      Unom_l=1600,
      Unom_tp=1600,
      Unom_v=1600,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=350.15,
      Tstart_outlet_sf=345.15) annotation (Placement(transformation(
          extent={{-25,-26},{25,26}},
          rotation=90,
          origin={261,24})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={272,-36})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={278,96})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=140.2e3,
      X_pp0=1,
      V_dot_max=0.0047,
      M_dot_start=2.93,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{224,-44},{204,-24}})));
   Components.Valve_lin             valve4(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Xopen=0.5,
      Afull=0.0001555,
      Mdot_nom=3.68,
      DELTAp_nom=50000)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={176,14})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.6,
      L_lstart=0.99,
      V_tank=0.5,
      p_ext=350000,
      Tstart=518.15,
      pstart=350000)
      annotation (Placement(transformation(extent={{208,60},{228,80}})));
    ThermoCycle.Components.Units.PdropAndValves.DP dP4(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      k=1.66623e+08,
      UseHomotopy=true,
      Mdot_nom=0.25,
      DELTAp_lin_nom=50000,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{170,-82},{150,-62}})));
  equation
    connect(const3.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-173,16},{-130,16},{-130,-14},{-115.2,-14},{-115.2,-13.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-173,-18},{-138,-18},{-138,-27.0909},{-115.667,-27.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-173,-46},{-142,-46},{-142,-41.0909},{-115.667,-41.0909}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(step.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-173,-80},{-130,-80},{-130,-54.1364},{-115.9,-54.1364}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanConstant.y, solarCollectorIncSchott.Defocusing) annotation (
        Line(
        points={{-171,-118},{-142,-118},{-142,-67.8182},{-115.667,-67.8182}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-92.8,-78.6364},{-92.8,-118.6},{98.4,-118.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const6.y, valve.cmd) annotation (Line(
        points={{33,-42},{39.25,-42},{39.25,-50},{49.8,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(valve.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{57,-59},{57,-118.6},{98.4,-118.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, valve.OutFlow) annotation (Line(
        points={{5,14},{57,14},{57,-41}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.InFlow, dP2.InFlow) annotation (Line(
        points={{-10,111},{-10,162},{21,162}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const2.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-161.3,93},{-154,93},{-154,92},{-137.8,92}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(dP2.InFlow,valve2. InFlow) annotation (Line(
        points={{21,162},{-10,162},{-10,111}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve2.OutFlow,pump. InFlow) annotation (Line(
        points={{-10,93},{-10,48.5},{-58.8,48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2,pump. OutFlow) annotation (Line(
        points={{-120.64,67},{-120.64,55.4},{-71.6,55.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2,valve2. InFlow) annotation (Line(
        points={{-120.12,116.5},{-118,116.5},{-118,162},{-10,162},{-10,111}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, pump.InFlow) annotation (Line(
        points={{29,48},{18,48},{18,46},{-10,46},{-10,48},{-58.8,48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, valve1.OutFlow) annotation (Line(
        points={{39,162},{60,162},{60,109}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve1.InFlow, dP1.InFlow) annotation (Line(
        points={{60,91},{60,48},{47,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP.OutFlow, Tank1.InFlow) annotation (Line(
        points={{5,14},{68,14},{68,15.6},{78.2,15.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, dP1.InFlow) annotation (Line(
        points={{97.8,15.6},{108,15.6},{108,48},{47,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP2.OutFlow, Tank.InFlow) annotation (Line(
        points={{39,162},{80,162},{80,150},{116.2,150},{116.2,147.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const5.y,oRCunitHx. MdotWfORC) annotation (Line(
        points={{321,128},{320,128},{320,66},{326,66},{326,44.5333},{332.286,
            44.5333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{367,102},{380,102},{380,66},{356,66},{356,44.5333},{353.714,
            44.5333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tank.OutFlow, oRCunitHx.InletSf) annotation (Line(
        points={{135.8,147.6},{309.143,147.6},{309.143,38.6667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(oRCunitHx.OutletSf, dP3.InFlow) annotation (Line(
        points={{308.286,8.84444},{308.286,-116},{305,-116}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpSF.InFlow, dP3.OutFlow) annotation (Line(
        points={{111.2,-125.5},{126,-125.5},{126,-116},{287,-116}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve3.InFlow, oRCunitHx.InletSf) annotation (Line(
        points={{150,99},{150,150},{309.143,150},{309.143,38.6667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB,hx1DInc. inlet_fl1) annotation (Line(
        points={{272,-27},{272,-18},{271,-18},{271,4.76923}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sinkP.flangeB,hx1DInc. outlet_fl1) annotation (Line(
        points={{278,87.6},{278,70},{271,70},{271,43.2308}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc.outlet_fl2, pump1.InFlow) annotation (Line(
        points={{249.4,5.15385},{249.4,-33.5},{221.2,-33.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve4.InFlow, pump1.OutFlow) annotation (Line(
        points={{176,5},{176,-26.6},{208.4,-26.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve3.OutFlow, Tank2.InFlow) annotation (Line(
        points={{150,81},{150,61.6},{208.2,61.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve4.OutFlow, Tank2.InFlow) annotation (Line(
        points={{176,23},{176,61.6},{208.2,61.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank2.OutFlow, hx1DInc.inlet_fl2) annotation (Line(
        points={{227.8,61.6},{249,61.6},{249,42.8462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump1.OutFlow, dP4.InFlow) annotation (Line(
        points={{208.4,-26.6},{180,-26.6},{180,-72},{169,-72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP4.OutFlow, dP3.OutFlow) annotation (Line(
        points={{151,-72},{142,-72},{142,-98},{202,-98},{202,-116},{287,-116}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(solarCollectorIncSchott.OutFlow, sensTp.InFlow) annotation (Line(
        points={{-90,-8.63636},{-90,20},{-83,20},{-83,13.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sensTp.OutFlow, dP.InFlow) annotation (Line(
        points={{-69,13.2},{-26,13.2},{-26,14},{-13,14}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-200,-180},{420,200}},
            preserveAspectRatio=false),
                        graphics),
      experiment(StopTime=5000),
      __Dymola_experimentSetupOutput,
      Icon(coordinateSystem(extent={{-200,-180},{420,200}})));
  end Test_SF_ByPassBiomassORCHx;

  model Test_SF_BiomassSystem_II

    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
         400000)  annotation (Placement(transformation(extent={{118,96},{138,
              116}})));
    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=9.88372e-05)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={72,44})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.93032e+07,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{32,96},{52,116}})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionStart=210e3,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionNominal=200e3,
      Unom=1000,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{20.5,-27.5},{-20.5,27.5}},
          rotation=90,
          origin={-106.5,44.5})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-164,52},{-150,66}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.026507,
      hstart=575410,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-44,-18},{-64,2}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{44,-16},{24,4}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-10,38},{10,58}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-116,118},{-88,140}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{82,122},{96,134}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-230,-122},{-210,-102}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-228,-96},{-208,-76}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-224,-68},{-204,-48}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-82,-162},{-102,-142}})));
   Components.Valve_lin             ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.075)   annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={14,-98})));
    Modelica.Fluid.Sensors.Temperature temperature_IN_SF(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-164,-166},{-148,-152}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      UseT=true,
      Mdot_0=2.9,
      T_0=436.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={80,-154})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-206,-18},{-224,-2}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,-96})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{-222,-202},{-204,-184}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={32,-63})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-24,-152})));
    Modelica.Blocks.Sources.Constant Tamb1(k=670)
      annotation (Placement(transformation(extent={{-230,-152},{-210,-132}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{78,-48},{60,-32}})));
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=100000,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal)
      annotation (Placement(transformation(extent={{-182,-130},{-140,-60}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-24,-54})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      V_tank=0.5,
      Mdotnom=2.9,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000,
      L_lstart=0.1)
      annotation (Placement(transformation(extent={{96,-66},{116,-46}})));
  equation
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-149.3,59},{-142,59},{-142,44.5},{-128.5,44.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-110.35,24},{-110.35,-0.6},{-59.6,-0.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.InFlow, Mflow_BmRecirculation.port_a) annotation (Line(
        points={{33,106},{12,106},{12,104},{-26,104},{-26,48},{-10,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
        points={{24,-6},{-12,-6},{-12,-7.5},{-46.8,-7.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
        points={{10,48},{10,0},{6,0},{6,-7.5},{-46.8,-7.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
        points={{51,106},{72,106},{72,53}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, sinkP.flangeB) annotation (Line(
        points={{51,106},{119.6,106}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMSysOut.port, sinkP.flangeB) annotation (Line(
        points={{89,122},{90,122},{90,106},{119.6,106}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, Mflow_BmRecirculation.port_a)
      annotation (Line(
        points={{-109.8,64.59},{-109.8,94},{-26,94},{-26,48},{-10,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, Mflow_BmRecirculation.port_a) annotation (Line(
        points={{-102,118},{-102,94},{-26,94},{-26,48},{-10,48}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-221.3,-10},{-252,-10},{-252,-188},{-240,-188},{-240,-193},{
            -223.8,-193}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
        points={{-60,-106},{-60,-151.5},{-84.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(temperature_IN_SF.port, pump1.OutFlow) annotation (Line(
        points={{-156,-166},{-156,-168},{-118,-168},{-118,-144.6},{-97.6,-144.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
        points={{-34,-152},{-28,-152},{-28,-151.5},{-84.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
        points={{14,-107},{14,-152},{-14,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowToSf.port_a, sourceMdot1.flangeB) annotation (Line(
        points={{-14,-152},{46,-152},{46,-154},{71,-154}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow,massFlowRate3. port_a) annotation (Line(
        points={{14,-89},{14,-62},{25,-62},{25,-63}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
        points={{-156.8,-130.636},{-156.8,-144.6},{-97.6,-144.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-203,-58},{-192,-58},{-192,-65.7273},{-179.2,-65.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-207,-86},{-194,-86},{-194,-79.0909},{-179.667,-79.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-209,-112},{-200,-112},{-200,-93.0909},{-179.667,-93.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-209,-142},{-206,-142},{-206,-118},{-194,-118},{-194,-106.136},
            {-179.9,-106.136}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
        points={{-203.1,-193},{-190,-193},{-190,-119.818},{-179.667,-119.818}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
      annotation (Line(
        points={{-154,-60.6364},{-154,-54},{-60,-54},{-60,-86}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-215,-18},{-216,-18},{-216,-32},{-154,-32},{-154,-60.6364}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
        points={{-29.4,-54},{-60,-54},{-60,-86}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-18.6,-54},{-6,-54},{-6,-62},{25,-62},{25,-63}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
        points={{39,-63},{54,-63},{54,-64.4},{96.2,-64.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
        points={{115.8,-64.4},{126,-64.4},{126,-6},{44,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
        points={{69,-48},{70,-48},{70,-64.4},{96.2,-64.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
        points={{72,35},{72,-6},{44,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,
              -200},{160,120}}), graphics), Icon(coordinateSystem(extent={{-240,
              -200},{160,120}})));
  end Test_SF_BiomassSystem_II;

  model Test_SF_BiomassSystem_ORC_II

    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=9.88372e-05)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-78,28})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.93032e+07,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{-124,48},{-104,68}})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionStart=210e3,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionNominal=200e3,
      Unom=1000,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{20.5,-27.5},{-20.5,27.5}},
          rotation=90,
          origin={-180.5,28.5})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-238,22},{-224,36}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.026507,
      hstart=575410,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-156,-26},{-176,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-102,-26},{-122,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=-90,
          origin={-136,29})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-198,74},{-170,96}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-68,66},{-54,78}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-238,-108},{-224,-94}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-238,-86},{-226,-74}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-236,-66},{-226,-56}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-120,-162},{-140,-142}})));
   Components.Valve_lin             ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.075)   annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={-46,-88})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-188,-170},{-172,-156}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-178,-46},{-196,-30}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-108,-98})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{-222,-202},{-204,-184}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={-24,-55})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-84,-152})));
    Modelica.Blocks.Sources.Constant Tamb1(k=670)
      annotation (Placement(transformation(extent={{-238,-142},{-226,-130}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{6,-50},{-12,-34}})));
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=100000,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal)
      annotation (Placement(transformation(extent={{-194,-128},{-152,-58}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-84,-54})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      V_tank=0.5,
      Mdotnom=2.9,
      L_lstart=0.1,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
    Components.ORC.ORCunitHx oRCunitHx(
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      N=15,
      UnomL=1000,
      UnomTp=8000,
      UnomV=2000,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      MdotnomSf=2.8,
      MdotWf=2.8,
      UnomSf=3000,
      Asf=100,
      Awf=100,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=498.15,
      TstartOutletSf=441.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{90,-76},{150,-32}})));
    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{136,6},{156,26}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{154,42},{134,62}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      V_tank=0.5,
      Mdotnom=2.9,
      L_lstart=0.9,
      p_ext=400000,
      Tstart=498.15,
      pstart=400000)
      annotation (Placement(transformation(extent={{6,56},{26,76}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.00753484,
      M_dot_start=2.9,
      hstart=361133,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{30,-168},{10,-148}})));
  equation
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-223.3,29},{-216,29},{-216,28.5},{-202.5,28.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-184.35,8},{-184.35,-8.6},{-171.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
        points={{-105,58},{-78,58},{-78,37}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-193.3,-38},{-252,-38},{-252,-188},{-240,-188},{-240,-193},{
            -223.8,-193}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
        points={{-108,-108},{-108,-151.5},{-122.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
        points={{-180,-170},{-180,-172},{-152,-172},{-152,-144.6},{-135.6,
            -144.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
        points={{-46,-97},{-46,-152},{-74,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
        points={{-168.8,-128.636},{-168.8,-144.6},{-135.6,-144.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-225.5,-61},{-192,-61},{-192,-63.7273},{-191.2,-63.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-225.4,-80},{-194,-80},{-194,-77.0909},{-191.667,-77.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-223.3,-101},{-200,-101},{-200,-91.0909},{-191.667,-91.0909}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-225.4,-136},{-212,-136},{-212,-138},{-200,-138},{-200,
            -104.136},{-191.9,-104.136}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
        points={{-203.1,-193},{-190,-193},{-190,-117.818},{-191.667,-117.818}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
      annotation (Line(
        points={{-166,-58.6364},{-166,-54},{-108,-54},{-108,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-187,-46},{-188,-46},{-188,-48},{-166,-48},{-166,-58.6364}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
        points={{-89.4,-54},{-108,-54},{-108,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-78.6,-54},{-31,-54},{-31,-55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
        points={{27.8,-52.4},{34,-52.4},{34,-16},{-102,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
        points={{-78,19},{-78,-16},{-102,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
        points={{-17,-55},{3.5,-55},{3.5,-52.4},{8.2,-52.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
        points={{-183.8,48.59},{-183.8,58},{-123,58}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
        points={{-184,74},{-184,58},{-123,58}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
        points={{-136,36},{-136,58},{-123,58}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
        points={{-136,22},{-136,-15.5},{-158.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
        points={{-122,-16},{-136,-16},{-136,-15.5},{-158.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
        points={{-3,-50},{-4,-50},{-4,-58},{2,-58},{2,-64},{3.5,-64},{3.5,-52.4},
            {8.2,-52.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-46,-79},{-46,-54},{-31,-54},{-31,-55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{157,16},{162,16},{162,-22},{133.714,-22},{133.714,-33.4667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
        points={{133,52},{112.286,52},{112.286,-33.4667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
        points={{-94,-152},{-122.8,-152},{-122.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
        points={{-105,58},{6.2,58},{6.2,57.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
        points={{25.8,57.6},{89.1429,57.6},{89.1429,-39.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
        points={{-61,66},{-60,66},{-60,58},{6.2,58},{6.2,57.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(oRCunitHx.OutletSf, pump2.InFlow) annotation (Line(
        points={{88.2857,-69.1556},{88.2857,-157.5},{27.2,-157.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
        points={{14.4,-150.6},{-44,-150.6},{-44,-152},{-74,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,
              -200},{220,160}}), graphics), Icon(coordinateSystem(extent={{-240,
              -200},{220,160}})));
  end Test_SF_BiomassSystem_ORC_II;

  model Test_SF_BiomassSystem_ORC_Hx_II

    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=9.88372e-05)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-78,18})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.93032e+07,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{-122,38},{-102,58}})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionStart=210e3,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionNominal=200e3,
      Unom=1000,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{20.5,-27.5},{-20.5,27.5}},
          rotation=90,
          origin={-182.5,20.5})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-260,60},{-240,80}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.026507,
      hstart=575410,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-146,-26},{-166,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-102,-26},{-122,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=-90,
          origin={-136,13})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-194,56},{-172,70}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-66,56},{-52,68}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-236,-104},{-226,-94}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-238,-86},{-226,-74}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-236,-66},{-226,-56}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-130,-162},{-150,-142}})));
   Components.Valve_lin             ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074)   annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={-42,-94})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-188,-170},{-172,-156}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-172,-48},{-190,-32}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-108,-98})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{-232,-168},{-220,-156}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={-24,-55})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-84,-152})));
    Modelica.Blocks.Sources.Constant Tamb1(k=670)
      annotation (Placement(transformation(extent={{-236,-126},{-226,-116}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-10,-44},{-28,-28}})));
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=550000)
      annotation (Placement(transformation(extent={{-194,-128},{-152,-58}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-84,-54})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.2,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{6,-56},{26,-36}})));
    Components.ORC.ORCunitHx oRCunitHx(
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      N=15,
      UnomL=1000,
      UnomTp=8000,
      UnomV=2000,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      MdotnomSf=2.8,
      MdotWf=2.8,
      UnomSf=3000,
      Asf=100,
      Awf=100,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=498.15,
      TstartOutletSf=441.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{72,-76},{132,-32}})));
    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{120,-6},{130,4}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{108,-4},{98,6}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.9,
      V_tank=0.2,
      p_ext=400000,
      Tstart=498.15,
      pstart=400000)
      annotation (Placement(transformation(extent={{-24,46},{-4,66}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.00753484,
      M_dot_start=2.9,
      hstart=361133,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{30,-168},{10,-148}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={156,38})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={184,136})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump3(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      V_dot_max=0.00909278,
      M_dot_start=3.9,
      hstart=145528,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{92,96},{72,116}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=270,
          origin={46,-85})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc1(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Unom_l=2500,
      Unom_tp=2500,
      Unom_v=2500,
      Mdotnom_sf=4.8,
      Mdotnom_wf=3.9,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=354.15,
      Tstart_outlet_sf=347.15)
      annotation (Placement(transformation(extent={{-14.5,-11.5},{14.5,11.5}},
          rotation=90,
          origin={144.5,92.5})));
   Components.Valve_lin             ValveSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=4e-06,
      Xopen=0.5,
      Mdot_nom=0.1,
      DELTAp_nom=50000)
                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={32,90})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      L_lstart=0.9,
      Mdotnom=3.9,
      V_tank=0.2,
      p_ext=350000,
      Tstart=353.15,
      pstart=350000)
      annotation (Placement(transformation(extent={{96,132},{116,152}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={72,-108})));
  equation
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-239,70},{-220,70},{-220,20.5},{-204.5,20.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-186.35,3.55271e-015},{-186.35,-8.6},{-161.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
        points={{-103,48},{-78,48},{-78,27}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-187.3,-40},{-240,-40},{-240,-162},{-233.2,-162}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
        points={{-108,-108},{-108,-151.5},{-132.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
        points={{-180,-170},{-180,-172},{-160,-172},{-160,-144.6},{-145.6,
            -144.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
        points={{-168.8,-128.636},{-168.8,-144.6},{-145.6,-144.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-225.5,-61},{-192,-61},{-192,-63.7273},{-191.2,-63.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-225.4,-80},{-194,-80},{-194,-77.0909},{-191.667,-77.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-225.5,-99},{-200,-99},{-200,-91.0909},{-191.667,-91.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-225.5,-121},{-224,-121},{-224,-120},{-212,-120},{-212,
            -104.136},{-191.9,-104.136}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
        points={{-219.4,-162},{-206,-162},{-206,-117.818},{-191.667,-117.818}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
      annotation (Line(
        points={{-166,-58.6364},{-166,-54},{-108,-54},{-108,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-181,-48},{-166,-48},{-166,-58.6364}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
        points={{-89.4,-54},{-108,-54},{-108,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-78.6,-54},{-31,-54},{-31,-55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
        points={{25.8,-54.4},{34,-54.4},{34,-16},{-102,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
        points={{-78,9},{-78,-16},{-102,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
        points={{-17,-55},{3.5,-55},{3.5,-54.4},{6.2,-54.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
        points={{-185.8,40.59},{-185.8,48},{-121,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
        points={{-183,56},{-183,48},{-121,48}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
        points={{-136,20},{-136,48},{-121,48}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
        points={{-136,6},{-136,-15.5},{-148.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
        points={{-122,-16},{-136,-16},{-136,-15.5},{-148.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
        points={{-19,-44},{-10,-44},{-10,-50},{-8.5,-50},{-8.5,-54.4},{6.2,
            -54.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{130.5,-1},{138,-1},{138,-22},{115.714,-22},{115.714,-33.4667}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
        points={{97.5,1},{94.2857,1},{94.2857,-33.4667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
        points={{-94,-152},{-132.8,-152},{-132.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
        points={{-103,48},{-23.8,48},{-23.8,47.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
        points={{-4.2,47.6},{71.1429,47.6},{71.1429,-39.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
        points={{-59,56},{-58,56},{-58,48},{-23.8,48},{-23.8,47.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
        points={{14.4,-150.6},{-44,-150.6},{-44,-152},{-74,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
        points={{156,47},{156,58},{148,58},{148,81.3462},{148.923,81.3462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl1, sinkP.flangeB) annotation (Line(
        points={{148.923,103.654},{148.923,118},{184,118},{184,127.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
        points={{139.369,81.5692},{139.369,64},{46,64},{46,-78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump3.InFlow, massFlowRate2.port_a) annotation (Line(
        points={{89.2,106.5},{90,106.5},{90,64},{46,64},{46,-78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump3.OutFlow, Tank3.InFlow) annotation (Line(
        points={{76.4,113.4},{76.4,133.6},{96.2,133.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
        points={{115.8,133.6},{139.192,133.6},{139.192,103.431}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{70.2857,-69.1556},{70.2857,-82.5778},{72,-82.5778},{72,-102.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(DpSF1.OutFlow, pump2.InFlow) annotation (Line(
        points={{72,-113.4},{72,-160},{27.2,-160},{27.2,-157.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate2.port_b, pump2.InFlow) annotation (Line(
        points={{46,-92},{46,-160},{27.2,-160},{27.2,-157.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
        points={{-42,-103},{-42,-150},{-44,-150},{-44,-152},{-74,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-78.6,-54},{-42,-54},{-42,-85}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF1.InFlow, oRCunitHx.InletSf) annotation (Line(
        points={{32,81},{32,48},{71.1429,48},{71.1429,-39.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF1.OutFlow, Tank3.InFlow) annotation (Line(
        points={{32,99},{32,134},{78,134},{78,133.6},{96.2,133.6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{240,160}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{240,160}})));
  end Test_SF_BiomassSystem_ORC_Hx_II;

  model Test_SF_BiomassSystem_ORC_Hx_III

    BrickerISES.Components.Valve_lin valve(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Xopen=0.344,
      Mdot_nom=0.93,
      Afull=9.88372e-05)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-94,18})));

    ThermoCycle.Components.Units.PdropAndValves.DP dP1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.93032e+07,
      DELTAp_start=50000)
           annotation (Placement(transformation(extent={{-138,38},{-118,58}})));
    Components.Biomass.Flow1DIncHeatInput flow1DIncHeatInput(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
      Mdotnom=9.4,
      QcombustionStart=210e3,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      QcombustionNominal=200e3,
      Unom=1000,
      pstart=100000,
      Tstart_inlet=523.15,
      Tstart_outlet=533.15,
      Tstart_inlet_wall=528.15,
      Tstart_outlet_wall=538.15) annotation (Placement(transformation(
          extent={{20.5,-27.5},{-20.5,27.5}},
          rotation=90,
          origin={-198.5,20.5})));

    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-276,60},{-256,80}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      V_dot_max=0.026507,
      hstart=575410,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-162,-26},{-182,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfToBm(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-118,-26},{-138,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_BmRecirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=-90,
          origin={-152,13})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-210,56},{-188,70}})));
    Modelica.Fluid.Sensors.Temperature Temp_BMSysOut(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-82,56},{-68,68}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-252,-104},{-242,-94}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-254,-86},{-242,-74}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-252,-66},{-242,-56}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.0064588,
      M_dot_start=2.5,
      hstart=3.46e5,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-146,-162},{-166,-142}})));
   Components.Valve_lin             ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074)   annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={-58,-94})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-204,-170},{-188,-156}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-188,-48},{-206,-32}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSfRecriculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-124,-98})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(uHigh=523, uLow=515)
      annotation (Placement(transformation(extent={{-248,-168},{-236,-156}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={-40,-55})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSf(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-100,-152})));
    Modelica.Blocks.Sources.Constant Tamb1(k=670)
      annotation (Placement(transformation(extent={{-252,-126},{-242,-116}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-26,-44},{-44,-28}})));
  ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc        solarCollectorIncSchott(
      redeclare package Medium1 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      N=5,
      Ns=3,
      Nt=4,
      Mdotnom=2.5,
      Unom=1000,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      redeclare model FluidHeatTransferModel =
          ThermoCycle.Components.HeatFlow.HeatTransfer.Ideal,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15,
      pstart=550000)
      annotation (Placement(transformation(extent={{-210,-128},{-168,-58}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-100,-54})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.2,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{-10,-56},{10,-36}})));
    Components.ORC.ORCunitHx_v1 oRCunitHx(
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      N=15,
      UnomL=1000,
      UnomTp=8000,
      UnomV=2000,
      UseT=true,
      SteadyStateTWall=true,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      MdotnomWf=2.45,
      MdotnomSf=2.8,
      MdotWf=2.8,
      UnomSf=3000,
      Asf=100,
      Awf=100,
      pStartSf=350000,
      pStartWf=2500000,
      TstartInletWf=333.15,
      TstartOutletWf=403.15,
      TstartInletSf=498.15,
      TstartOutletSf=441.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{56,-76},{116,-32}})));
    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{104,-4},{114,6}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{92,-4},{82,6}})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.9,
      V_tank=0.2,
      p_ext=400000,
      Tstart=498.15,
      pstart=400000)
      annotation (Placement(transformation(extent={{-40,46},{-20,66}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump2(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      V_dot_max=0.00753484,
      M_dot_start=2.9,
      hstart=361133,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{14,-168},{-6,-148}})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      Mdot_0=7.96,
      p=100000,
      T_0=340.15) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={140,38})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={168,136})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump pump3(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      V_dot_max=0.00909278,
      M_dot_start=3.9,
      hstart=145528,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{76,96},{56,116}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=270,
          origin={30,-85})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc1(
      redeclare package Medium1 = ThermoCycle.Media.Water,
      redeclare package Medium2 =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      N=10,
      V_sf=0.018,
      V_wf=0.018,
      A_sf=6.4,
      A_wf=6.4,
      M_wall=35,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      Unom_sf=3000,
      Unom_l=2500,
      Unom_tp=2500,
      Unom_v=2500,
      Mdotnom_sf=4.8,
      Mdotnom_wf=3.9,
      pstart_sf=400000,
      pstart_wf=100000,
      Tstart_inlet_wf=340.15,
      Tstart_outlet_wf=343.15,
      Tstart_inlet_sf=354.15,
      Tstart_outlet_sf=347.15)
      annotation (Placement(transformation(extent={{-14.5,-11.5},{14.5,11.5}},
          rotation=90,
          origin={128.5,92.5})));
   Components.Valve_lin             ValveSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=4e-06,
      Xopen=0.5,
      Mdot_nom=0.1,
      DELTAp_nom=50000)
                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={16,90})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank3(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      L_lstart=0.9,
      Mdotnom=3.9,
      V_tank=0.2,
      p_ext=350000,
      Tstart=353.15,
      pstart=350000)
      annotation (Placement(transformation(extent={{80,132},{100,152}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={56,-108})));
    Components.Chiller.Chiller_v2 chiller_v1_1(
      redeclare package Medium = ThermoCycle.Media.Water,
      T_start_su=343.15,
      m_start=8)
      annotation (Placement(transformation(extent={{200,56},{220,94}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut1(redeclare package Medium
        = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{194,106},{176,122}})));
    Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium
        = ThermoCycle.Media.Water)
      annotation (Placement(transformation(
          extent={{-7,-6},{7,6}},
          rotation=0,
          origin={140,131})));
    Modelica.Blocks.Sources.Constant ThermalDemand(k=250000)
      annotation (Placement(transformation(extent={{216,112},{236,132}})));
    Modelica.Blocks.Sources.Constant const3(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{130,-4},{140,6}})));
  equation
    connect(const.y, flow1DIncHeatInput.u) annotation (Line(
        points={{-255,70},{-236,70},{-236,20.5},{-220.5,20.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.inlet_fl2, pump.OutFlow) annotation (Line(
        points={{-202.35,3.55271e-015},{-202.35,-8.6},{-177.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, valve.OutFlow) annotation (Line(
        points={{-119,48},{-94,48},{-94,27}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-203.3,-40},{-256,-40},{-256,-162},{-249.2,-162}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSfRecriculation.port_a, pump1.InFlow) annotation (Line(
        points={{-124,-108},{-124,-151.5},{-148.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, pump1.OutFlow) annotation (Line(
        points={{-196,-170},{-196,-172},{-176,-172},{-176,-144.6},{-161.6,-144.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(solarCollectorIncSchott.InFlow, pump1.OutFlow) annotation (Line(
        points={{-184.8,-128.636},{-184.8,-144.6},{-161.6,-144.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, solarCollectorIncSchott.v_wind) annotation (Line(
        points={{-241.5,-61},{-208,-61},{-208,-63.7273},{-207.2,-63.7273}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, solarCollectorIncSchott.Theta) annotation (Line(
        points={{-241.4,-80},{-210,-80},{-210,-77.0909},{-207.667,-77.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, solarCollectorIncSchott.Tamb) annotation (Line(
        points={{-241.5,-99},{-216,-99},{-216,-91.0909},{-207.667,-91.0909}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb1.y, solarCollectorIncSchott.DNI) annotation (Line(
        points={{-241.5,-121},{-240,-121},{-240,-120},{-228,-120},{-228,
            -104.136},{-207.9,-104.136}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, solarCollectorIncSchott.Defocusing) annotation (Line(
        points={{-235.4,-162},{-222,-162},{-222,-117.818},{-207.667,-117.818}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(solarCollectorIncSchott.OutFlow, MflowSfRecriculation.port_b)
      annotation (Line(
        points={{-182,-58.6364},{-182,-54},{-124,-54},{-124,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, solarCollectorIncSchott.OutFlow) annotation (Line(
        points={{-197,-48},{-182,-48},{-182,-58.6364}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF.InFlow, MflowSfRecriculation.port_b) annotation (Line(
        points={{-105.4,-54},{-124,-54},{-124,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, massFlowRate3.port_a) annotation (Line(
        points={{-94.6,-54},{-47,-54},{-47,-55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowSfToBm.port_a) annotation (Line(
        points={{9.8,-54.4},{18,-54.4},{18,-16},{-118,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(valve.InFlow, MflowSfToBm.port_a) annotation (Line(
        points={{-94,9},{-94,-16},{-118,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate3.port_b, Tank1.InFlow) annotation (Line(
        points={{-33,-55},{-12.5,-55},{-12.5,-54.4},{-9.8,-54.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(flow1DIncHeatInput.outlet_fl2, dP1.InFlow) annotation (Line(
        points={{-201.8,40.59},{-201.8,48},{-137,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, dP1.InFlow) annotation (Line(
        points={{-199,56},{-199,48},{-137,48}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_a, dP1.InFlow) annotation (Line(
        points={{-152,20},{-152,48},{-137,48}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Mflow_BmRecirculation.port_b, pump.InFlow) annotation (Line(
        points={{-152,6},{-152,-15.5},{-164.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowSfToBm.port_b, pump.InFlow) annotation (Line(
        points={{-138,-16},{-152,-16},{-152,-15.5},{-164.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfSysOut.port, Tank1.InFlow) annotation (Line(
        points={{-35,-44},{-26,-44},{-26,-50},{-24.5,-50},{-24.5,-54.4},{-9.8,-54.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const1.y, oRCunitHx.TWfORCSu) annotation (Line(
        points={{114.5,1},{122,1},{122,-22},{90.2857,-22},{90.2857,-32.4889}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const2.y, oRCunitHx.MdotWfORC) annotation (Line(
        points={{81.5,1},{70.5714,1},{70.5714,-32.4889}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowToSf.port_b, pump1.InFlow) annotation (Line(
        points={{-110,-152},{-148.8,-152},{-148.8,-151.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dP1.OutFlow, Tank2.InFlow) annotation (Line(
        points={{-119,48},{-39.8,48},{-39.8,47.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank2.OutFlow, oRCunitHx.InletSf) annotation (Line(
        points={{-20.2,47.6},{55.1429,47.6},{55.1429,-39.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMSysOut.port, Tank2.InFlow) annotation (Line(
        points={{-75,56},{-74,56},{-74,48},{-39.8,48},{-39.8,47.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pump2.OutFlow, MflowToSf.port_a) annotation (Line(
        points={{-1.6,-150.6},{-60,-150.6},{-60,-152},{-90,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, hx1DInc1.inlet_fl1) annotation (Line(
        points={{140,47},{140,58},{132,58},{132,81.3462},{132.923,81.3462}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl2, massFlowRate2.port_a) annotation (Line(
        points={{123.369,81.5692},{123.369,64},{30,64},{30,-78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump3.InFlow, massFlowRate2.port_a) annotation (Line(
        points={{73.2,106.5},{74,106.5},{74,64},{30,64},{30,-78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pump3.OutFlow, Tank3.InFlow) annotation (Line(
        points={{60.4,113.4},{60.4,133.6},{80.2,133.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Tank3.OutFlow, hx1DInc1.inlet_fl2) annotation (Line(
        points={{99.8,133.6},{123.192,133.6},{123.192,103.431}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(oRCunitHx.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{54.2857,-69.1556},{54.2857,-82.5778},{56,-82.5778},{56,-102.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(DpSF1.OutFlow, pump2.InFlow) annotation (Line(
        points={{56,-113.4},{56,-160},{11.2,-160},{11.2,-157.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate2.port_b, pump2.InFlow) annotation (Line(
        points={{30,-92},{30,-160},{11.2,-160},{11.2,-157.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ValveSF.InFlow, MflowToSf.port_a) annotation (Line(
        points={{-58,-103},{-58,-150},{-60,-150},{-60,-152},{-90,-152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-94.6,-54},{-58,-54},{-58,-85}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF1.InFlow, oRCunitHx.InletSf) annotation (Line(
        points={{16,81},{16,48},{55.1429,48},{55.1429,-39.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF1.OutFlow, Tank3.InFlow) annotation (Line(
        points={{16,99},{16,134},{62,134},{62,133.6},{80.2,133.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(TempSfSysOut1.port, sinkP.flangeB) annotation (Line(
        points={{185,106},{184,106},{184,100},{152,100},{152,118},{168,118},{168,127.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(TempSfSysOut1.T, chiller_v1_1.Tsu) annotation (Line(
        points={{178.7,114},{172,114},{172,90.2},{199.4,90.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hx1DInc1.outlet_fl1, massFlowRate1.port_a) annotation (Line(
        points={{132.923,103.654},{132.923,114},{128,114},{128,131},{133,131}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(massFlowRate1.port_b, sinkP.flangeB) annotation (Line(
        points={{147,131},{150,131},{150,116},{152,116},{152,118},{168,118},{168,127.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(massFlowRate1.m_flow, chiller_v1_1.mdotsu) annotation (Line(
        points={{140,137.6},{140,144},{154,144},{154,80.32},{199.4,80.32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ThermalDemand.y, chiller_v1_1.Q_td) annotation (Line(
        points={{237,122},{248,122},{248,82.22},{220.8,82.22}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const3.y, oRCunitHx.T_cf_su) annotation (Line(
        points={{140.5,1},{156,1},{156,-26},{110.857,-26},{110.857,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{300,180}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{300,180}})));
  end Test_SF_BiomassSystem_ORC_Hx_III;
end Layout_II;
