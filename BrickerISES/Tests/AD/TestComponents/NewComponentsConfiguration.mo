within BrickerISES.Tests.AD.TestComponents;
package NewComponentsConfiguration
  package SingleComponents
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
      ThermoCycle.Components.FluidFlow.Sensors.SensTp sensTp_SF_L(redeclare
          package Medium =
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

    model _SF_L_ByPass

      Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
        annotation (Placement(transformation(extent={{-68,26},{-60,34}})));
      Modelica.Blocks.Sources.Constant Theta(k=0)
        annotation (Placement(transformation(extent={{-68,40},{-60,48}})));
      Modelica.Blocks.Sources.Constant V_Wind(k=0)
        annotation (Placement(transformation(extent={{-68,56},{-60,64}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Mdot_0=2.5,
        p=100000,
        T_0=436.15)
        annotation (Placement(transformation(extent={{60,-34},{40,-14}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
          p0=100000)
        annotation (Placement(transformation(extent={{50,66},{70,86}})));
      Modelica.Blocks.Sources.Constant Tamb1(k=800)
        annotation (Placement(transformation(extent={{-68,8},{-60,16}})));
    BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF
        annotation (Placement(transformation(extent={{-18,8},{18,50}})));
    equation
      connect(SF.InFlow, sourceMdot.flangeB) annotation (Line(
          points={{3.6,7.61818},{3.6,-24},{41,-24}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(SF.OutFlow, sinkP.flangeB) annotation (Line(
          points={{6,49.6182},{8,49.6182},{8,82},{51.6,82},{51.6,76}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(V_Wind.y, SF.v_wind) annotation (Line(
          points={{-59.6,60},{-48,60},{-48,50},{-15.6,50},{-15.6,46.5636}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Theta.y, SF.Theta) annotation (Line(
          points={{-59.6,44},{-50,44},{-50,42},{-34,42},{-34,38},{-16,38},{-16,
              38.5455}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Tamb.y, SF.Tamb) annotation (Line(
          points={{-59.6,30},{-50,30},{-50,32},{-16,32},{-16,30.1455}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Tamb1.y, SF.DNI) annotation (Line(
          points={{-59.6,12},{-44,12},{-44,22.3182},{-16.2,22.3182}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end _SF_L_ByPass;

    model TestBiomassBoiler_L

      Components.Biomass.Flow1DIncHeatInput_L flow1DIncHeatInput(
        QcombustionNominal=258e3,
        CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
        QcombustionStart=10e3,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        pstart=100000,
        Tstart_inlet=523.15,
        Tstart_outlet=533.15,
        Tstart_inlet_wall=528.15,
        Tstart_outlet_wall=538.15) annotation (Placement(transformation(
            extent={{25,-26},{-25,26}},
            rotation=90,
            origin={-23,8})));

      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        Mdot_0=9.4,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p=100000,
        T_0=523.15)
        annotation (Placement(transformation(extent={{-76,-94},{-56,-74}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            100000) annotation (Placement(transformation(extent={{12,48},{32,68}})));
      Modelica.Blocks.Sources.Constant const(k=258e3)
        annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
    equation
      connect(sourceMdot.flangeB, flow1DIncHeatInput.inlet_fl2) annotation (Line(
          points={{-57,-84},{-26.64,-84},{-26.64,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(flow1DIncHeatInput.u, const.y) annotation (Line(
          points={{-43.8,8},{-64,8},{-64,30},{-79,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flow1DIncHeatInput.outlet_fl2, sinkP.flangeB) annotation (Line(
          points={{-26.12,32.5},{-26.12,58},{13.6,58}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        experiment(StopTime=100),
        __Dymola_experimentSetupOutput);
    end TestBiomassBoiler_L;

    model Size_Dp_BM "Pressure drop in the pipes to the biomass boiler"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=450000)
        annotation (Placement(transformation(extent={{68,-2},{88,18}})));
      ThermoCycle.Components.Units.PdropAndValves.DP dP(
        k=k,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h=0,
        A=5e3)
             annotation (Placement(transformation(extent={{-8,-4},{12,16}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Mdot_0=9.5,
        p=650000,
        T_0=518.15)
        annotation (Placement(transformation(extent={{-74,10},{-54,30}})));

    initial equation
      dP.DELTAp = 1.5e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,6},{40,6},{40,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-55,20},{-30,20},{-30,6},{-7,6}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Size_Dp_BM;
  end SingleComponents;

  model SFDefDynBMConstHx_P
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-112,-26},{-132,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-59,20})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,72},{-138,86}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-200,-126},{-190,-116}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-200,-108},{-188,-96}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-200,-88},{-190,-78}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-90,-184},{-110,-164}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-116})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,-120})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={31,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-34,-174})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-44,-76})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{52,-78},{72,-58}})));
    BrickerISES.Components.ORC.ORCunitHx ORC(
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
      annotation (Placement(transformation(extent={{164,-64},{224,-20}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{214,6},{224,16}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{202,8},{192,18}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{134,-192},{114,-172}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={164,-132})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-21,-64})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-8,-68},{20,-50}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-248,60},{-238,70}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{190,-96},{214,-80}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={164,-156})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-112.5,59.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={226,46})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={306,146})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{156,126},{186,156}})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc HxOilWater(
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
      Tstart_outlet_sf=347.15) annotation (Placement(transformation(
          extent={{-14.5,-11.5},{14.5,11.5}},
          rotation=90,
          origin={200.5,108.5})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={107,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={138,100})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{280,94},{242,116}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-22,60})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={29,108})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{276,140},{236,162}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={226,75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={34.5,-16})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{12,66},{40,84}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{180,176},{208,194}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{140,28},{174,48}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={79,113})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-200,-148},{-186,-134}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-209,58})));
    Components.Biomass.Flow1DIncHeatInput BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      N=3,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-151,36})));

    Components.SF.SolarField_SoltiguaWall_Inc SF(
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
      Mdotnom=2.5,
      N=2,
      pstart=100000,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15)
      annotation (Placement(transformation(extent={{-150,-140},{-120,-86}})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Summary.Q_htf;
     der(E_ORC) = ORC.Pel_gross;
     der(E_HX) = HxOilWater.Summary.Q_sf;

      Q_hx = HxOilWater.Summary.Q_sf;
     eta_ORC_el = ORC.Pel_gross/ORC.Evaporator.Q_sf_;
     eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Evaporator.Q_sf_;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.Eta_tot;
     //eta_HX = Q/(UA*(T_ave_sf-T_ave_pf); // Based on Ahmad Fakheri 2007
     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-49.4,-76},{-70,-76},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-38.6,-76},{22,-76},{22,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{40,-75},{43.5,-75},{43.5,-76.4},{52.2,-76.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{224.5,11},{232,11},{232,-10},{207.714,-10},{207.714,-21.4667}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{191.5,13},{186.286,13},{186.286,-21.4667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{162.286,-57.1556},{162.286,-104.578},{164,-104.578},{164,
            -126.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-139,-30},{-146,-30},{-146,-8.6},{-127.6,-8.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-15.7,-64},{-8,-64},{-8,-116}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{6,-68},{6,-76},{22,-76},{22,-75}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
        points={{202,-96},{164,-96},{164,-126.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF1.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{164,-137.4},{164,-148}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{164,-164},{162,-164},{162,-182},{131.2,-182},{131.2,-181.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.outlet_fl1, sinkP.flangeB) annotation (Line(
        points={{204.923,119.654},{204.923,134},{306,134},{306,137.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.outlet_fl2, MflowHXl.port_a) annotation (Line(
        points={{195.369,97.5692},{194,97.5692},{194,58},{107,58},{107,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow, HxOilWater.inlet_fl2) annotation (Line(
        points={{179.4,152.1},{195.192,152.1},{195.192,119.431}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{138,90},{138,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{138,110},{138,141.75},{160.2,141.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_b, ORC.InletSf) annotation (Line(
        points={{-12,60},{94,60},{94,-28},{164,-28},{164,-27.3333},{163.143,
            -27.3333}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{256,140},{226,140},{226,134},{306,134},{306,137.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{226,55},{226,68}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Mflow_HEX_water.port_b, HxOilWater.inlet_fl1) annotation (Line(
        points={{226,82},{226,90},{204.923,90},{204.923,97.3462}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.inlet_fl1) annotation (Line(
        points={{261,94},{261,90},{204.923,90},{204.923,97.3462}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{24,-16},{-32,-16},{-32,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-102,59.5},{-59,59.5},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-16},{45,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-59,10},{-59,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{26,66},{26,60},{-12,60}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{107,-86},{107,-174},{-24,-174}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-32,60},{-59,60},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{24,105.6},{-28,105.6},{-28,170},{222,170},{222,151},{242,151}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, HxOilWater.outlet_fl2) annotation (Line(
        points={{157,28},{194,28},{194,97.5692},{195.369,97.5692}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{78.25,102.2},{76.125,102.2},{76.125,60},{-12,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
            141.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-149,72},{-148,72},{-148,59.52},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-123,59.5},{-130,59.5},{-130,66},{-154.72,66},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-155.34,12},{-154,12},{-154,-8.6},{-127.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-203.7,58},{-196,58},{-196,32},{-175.8,32},{-175.8,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-237.5,65},{-220,65},{-220,60.4},{-214,60.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-141.3,79},{-126,79},{-126,116},{-220,116},{-220,56},{-214,56},{
            -214,55.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-132,-140.491},{-134,-140.491},{-134,-166.6},{-105.6,-166.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-130,-86.4909},{-130,-78},{-70,-78},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-189.5,-83},{-166,-83},{-166,-90.4182},{-148,-90.4182}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-187.4,-102},{-168,-102},{-168,-100.727},{-148.333,-100.727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-189.5,-121},{-168,-121},{-168,-111.527},{-148.333,-111.527}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-185.86,-141},{-168,-141},{-168,-124},{-148.5,-124},{-148.5,
            -121.591}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-179.4,-184},{-156,-184},{-156,-132.145},{-148.333,-132.145}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-169,-74},{-166,-74},{-166,-78},{-70,-78},{-70,-110}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{360,200}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P;

  model SFDefDynBMConstHx_P_I
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-112,-26},{-132,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-59,20})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,72},{-138,86}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-200,-126},{-190,-116}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-200,-108},{-188,-96}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-200,-88},{-190,-78}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-90,-184},{-110,-164}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-116})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,-120})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={31,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-34,-174})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-44,-76})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{52,-78},{72,-58}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{226,-12},{216,-2}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{226,6},{216,16}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{134,-192},{114,-172}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={164,-132})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-21,-64})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-8,-68},{20,-50}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-248,60},{-238,70}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{190,-120},{214,-104}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={164,-156})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-112.5,59.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={226,46})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={306,146})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{156,126},{186,156}})));
    ThermoCycle.Components.Units.HeatExchangers.Hx1DInc HxOilWater(
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
      Tstart_outlet_sf=347.15) annotation (Placement(transformation(
          extent={{-14.5,-11.5},{14.5,11.5}},
          rotation=90,
          origin={200.5,108.5})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={107,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={138,100})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{280,94},{242,116}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-22,60})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={29,108})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{276,140},{236,162}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={226,75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={34.5,-16})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{12,66},{40,84}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{180,176},{208,194}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{140,28},{174,48}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={79,113})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-200,-148},{-186,-134}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-209,58})));
    Components.Biomass.Flow1DIncHeatInput BM(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-151,36})));

    Components.SF.SolarField_SoltiguaWall_Inc SF(
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
      annotation (Placement(transformation(extent={{-150,-140},{-120,-86}})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{170,-94},{214,-38}})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Summary.Q_htf;
     der(E_ORC) = ORC.Pel_gross;
     der(E_HX) = HxOilWater.Summary.Q_sf;

     eta_ORC_el = ORC.Pel_gross/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.Summary.Eta_solarCollector;
     //eta_HX = Q/(UA*(T_ave_sf-T_ave_pf); // Based on Ahmad Fakheri 2007
     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-49.4,-76},{-70,-76},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-38.6,-76},{22,-76},{22,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{40,-75},{43.5,-75},{43.5,-76.4},{52.2,-76.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-139,-30},{-146,-30},{-146,-8.6},{-127.6,-8.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-15.7,-64},{-8,-64},{-8,-116}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{6,-68},{6,-76},{22,-76},{22,-75}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
        points={{202,-120},{164,-120},{164,-126.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF1.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{164,-137.4},{164,-148}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{164,-164},{162,-164},{162,-182},{131.2,-182},{131.2,-181.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.outlet_fl1, sinkP.flangeB) annotation (Line(
        points={{204.923,119.654},{204.923,134},{306,134},{306,137.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.outlet_fl2, MflowHXl.port_a) annotation (Line(
        points={{195.369,97.5692},{194,97.5692},{194,58},{107,58},{107,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow, HxOilWater.inlet_fl2) annotation (Line(
        points={{179.4,152.1},{195.192,152.1},{195.192,119.431}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{138,90},{138,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{138,110},{138,141.75},{160.2,141.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{256,140},{226,140},{226,134},{306,134},{306,137.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{226,55},{226,68}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Mflow_HEX_water.port_b, HxOilWater.inlet_fl1) annotation (Line(
        points={{226,82},{226,90},{204.923,90},{204.923,97.3462}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.inlet_fl1) annotation (Line(
        points={{261,94},{261,90},{204.923,90},{204.923,97.3462}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{24,-16},{-32,-16},{-32,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-102,59.5},{-59,59.5},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-16},{45,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-59,10},{-59,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{26,66},{26,60},{-12,60}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{107,-86},{107,-174},{-24,-174}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-32,60},{-59,60},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{24,105.6},{-28,105.6},{-28,170},{222,170},{222,151},{242,151}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, HxOilWater.outlet_fl2) annotation (Line(
        points={{157,28},{194,28},{194,97.5692},{195.369,97.5692}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{78.25,102.2},{76.125,102.2},{76.125,60},{-12,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
            141.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-149,72},{-148,72},{-148,59.52},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-123,59.5},{-130,59.5},{-130,66},{-154.72,66},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-155.34,12},{-154,12},{-154,-8.6},{-127.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-203.7,58},{-196,58},{-196,32},{-175.8,32},{-175.8,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-237.5,65},{-220,65},{-220,60.4},{-214,60.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-141.3,79},{-126,79},{-126,116},{-220,116},{-220,56},{-214,56},{
            -214,55.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-132,-140.491},{-134,-140.491},{-134,-166.6},{-105.6,-166.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-130,-86.4909},{-130,-78},{-70,-78},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-189.5,-83},{-166,-83},{-166,-90.4182},{-148,-90.4182}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-187.4,-102},{-168,-102},{-168,-100.727},{-148.333,-100.727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-189.5,-121},{-168,-121},{-168,-111.527},{-148.333,-111.527}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-185.86,-141},{-168,-141},{-168,-124},{-148.5,-124},{-148.5,
            -121.591}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-179.4,-184},{-156,-184},{-156,-132.145},{-148.333,-132.145}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-169,-74},{-166,-74},{-166,-78},{-70,-78},{-70,-110}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{168.743,-85.2889},{164,-85.2889},{164,-126.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{169.371,-47.3333},{132,-47.3333},{132,22},{98,22},{98,60},{-12,
            60}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{215.5,11},{186.343,11},{186.343,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{215.5,-7},{215.5,-8},{202.057,-8},{202.057,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{360,200}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_I;

  model SFDefDynBMConstHx_P_II
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-112,-26},{-132,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-59,20})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,72},{-138,86}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-200,-126},{-190,-116}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-200,-108},{-188,-96}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-200,-88},{-190,-78}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-90,-184},{-110,-164}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-116})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,-120})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={31,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-34,-174})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-44,-76})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{52,-78},{72,-58}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{226,-12},{216,-2}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{226,6},{216,16}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{134,-192},{114,-172}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={164,-132})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-21,-64})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-8,-68},{20,-50}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-248,60},{-238,70}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{190,-120},{214,-104}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={164,-156})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-112.5,59.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={256,36})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={306,146})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{156,126},{186,156}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={107,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={138,100})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{280,94},{242,116}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-22,60})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={29,108})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{276,140},{236,162}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={256,65})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={34.5,-16})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{12,66},{40,84}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{180,176},{208,194}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{140,28},{174,48}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={79,113})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-200,-148},{-186,-134}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-209,58})));
    Components.Biomass.Flow1DIncHeatInput BM(
      N=10,
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-151,36})));

    Components.SF.SolarField_SoltiguaWall_Inc SF(
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
      annotation (Placement(transformation(extent={{-150,-140},{-120,-86}})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{170,-94},{214,-38}})));
    Components.HX_singlephase HxOilWater(
      redeclare package MediumSs =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      MdotNom_ps=1,
      MdotNom_ss=4.8,
      A_ps=6.4,
      A_ss=6.4,
      U_ps=2500,
      U_ss=3000,
      steadystate_T_wall=true,
      redeclare package MediumPs = ThermoCycle.Media.Water,
      p_ps_start=100000,
      T_ps_su_start=340.15,
      T_ps_ex_start=343.15,
      p_ss_start=400000,
      T_ss_su_start=354.15,
      T_ss_ex_start=347.15) annotation (Placement(transformation(
          extent={{-18,-23},{18,23}},
          rotation=90,
          origin={210,111})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Summary.Q_htf;
     der(E_ORC) = ORC.Pel_gross;
     der(E_HX) = HxOilWater.Summary.Q_ss;
     Q_hx = HxOilWater.Summary.Q_ss;
     eta_ORC_el = ORC.Pel_gross/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.Summary.Eta_solarCollector;
     //eta_HX = Q/(UA*(T_ave_sf-T_ave_pf); // Based on Ahmad Fakheri 2007
     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-49.4,-76},{-70,-76},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-38.6,-76},{22,-76},{22,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{40,-75},{43.5,-75},{43.5,-76.4},{52.2,-76.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-139,-30},{-146,-30},{-146,-8.6},{-127.6,-8.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-15.7,-64},{-8,-64},{-8,-116}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{6,-68},{6,-76},{22,-76},{22,-75}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
        points={{202,-120},{164,-120},{164,-126.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF1.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{164,-137.4},{164,-148}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{164,-164},{162,-164},{162,-182},{131.2,-182},{131.2,-181.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{138,90},{138,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{138,110},{138,141.75},{160.2,141.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{256,140},{250,140},{250,132},{306,132},{306,137.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{24,-16},{-32,-16},{-32,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-102,59.5},{-59,59.5},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-16},{45,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-59,10},{-59,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{26,66},{26,60},{-12,60}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{107,-86},{107,-174},{-24,-174}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-32,60},{-59,60},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{24,105.6},{-28,105.6},{-28,170},{222,170},{222,151},{242,151}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{78.25,102.2},{76.125,102.2},{76.125,60},{-12,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
            141.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-149,72},{-148,72},{-148,59.52},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-123,59.5},{-130,59.5},{-130,66},{-154.72,66},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-155.34,12},{-154,12},{-154,-8.6},{-127.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-203.7,58},{-196,58},{-196,32},{-175.8,32},{-175.8,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-237.5,65},{-220,65},{-220,60.4},{-214,60.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-141.3,79},{-126,79},{-126,116},{-220,116},{-220,56},{-214,56},{
            -214,55.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(SF.InFlow, PumpSF.OutFlow) annotation (Line(
        points={{-132,-140.491},{-134,-140.491},{-134,-166.6},{-105.6,-166.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-130,-86.4909},{-130,-78},{-70,-78},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-189.5,-83},{-166,-83},{-166,-90.4182},{-148,-90.4182}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-187.4,-102},{-168,-102},{-168,-100.727},{-148.333,-100.727}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-189.5,-121},{-168,-121},{-168,-111.527},{-148.333,-111.527}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-185.86,-141},{-168,-141},{-168,-124},{-148.5,-124},{-148.5,
            -121.591}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-179.4,-184},{-156,-184},{-156,-132.145},{-148.333,-132.145}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-169,-74},{-166,-74},{-166,-78},{-70,-78},{-70,-110}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{168.743,-85.2889},{164,-85.2889},{164,-126.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{169.371,-47.3333},{132,-47.3333},{132,22},{98,22},{98,60},{-12,
            60}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{215.5,11},{186.343,11},{186.343,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{215.5,-7},{215.5,-8},{202.057,-8},{202.057,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
        points={{179.4,152.1},{190,152.1},{190,127.2},{193.44,127.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{256,45},{256,58}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
        points={{210.46,130.8},{210.46,134},{250,134},{250,132},{306,132},{306,137.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
        points={{256,72},{256,78},{216,78},{216,91.2},{210.46,91.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
        points={{261,94},{256,94},{256,82},{240,82},{240,78},{216,78},{216,91.2},{
            210.46,91.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
        points={{227.02,94.8},{226,94.8},{226,62},{220,62},{220,58},{107,58},{107,
            -64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{157,28},{158,28},{158,34},{204,34},{204,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{360,200}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_II;

  model SFDefDynBMConstHx_P_III
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-112,-26},{-132,-6}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-59,20})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,72},{-138,86}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-200,-126},{-190,-116}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-200,-108},{-188,-96}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-200,-88},{-190,-78}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-90,-184},{-110,-164}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-116})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-192},{-132,-178}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-160,-74},{-178,-58}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,-120})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-192,-190},{-180,-178}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={31,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-34,-174})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-148,-30},{-130,-46}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-44,-76})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{52,-78},{72,-58}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{226,-12},{216,-2}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{226,6},{216,16}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{134,-192},{114,-172}})));
    ThermoCycle.Components.Units.PdropAndValves.DP DpSF1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07)
      annotation (Placement(transformation(extent={{6,-6},{-6,6}},
          rotation=90,
          origin={164,-132})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-21,-64})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-50,-56},{-38,-44}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-8,-68},{20,-50}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-248,60},{-238,70}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{190,-120},{214,-104}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={164,-156})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-112.5,59.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={256,36})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={306,146})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{156,126},{186,156}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={107,-75})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={138,100})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{280,94},{242,116}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-22,60})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={29,108})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-14,138},{-4,148}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{276,140},{236,162}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={256,65})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={34.5,-16})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{12,66},{40,84}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{180,176},{208,194}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{140,28},{174,48}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      eta_is=0.7,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={79,113})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-200,-148},{-186,-134}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-209,58})));
    Components.Biomass.Flow1DIncHeatInput BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      N=3,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-151,36})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{170,-94},{214,-38}})));
    Components.HX_singlephase HxOilWater(
      redeclare package MediumSs =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      MdotNom_ps=1,
      MdotNom_ss=4.8,
      A_ps=6.4,
      A_ss=6.4,
      U_ps=2500,
      U_ss=3000,
      steadystate_T_wall=true,
      redeclare package MediumPs = ThermoCycle.Media.Water,
      p_ps_start=100000,
      T_ps_su_start=340.15,
      T_ps_ex_start=343.15,
      p_ss_start=400000,
      T_ss_su_start=354.15,
      T_ss_ex_start=347.15) annotation (Placement(transformation(
          extent={{-18,-23},{18,23}},
          rotation=90,
          origin={210,111})));
    Components.SF.SF_SoltiguaL_AirCell SF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Nt=4,
      Ns=3,
      Mwall=26.64,
      cwall=480,
      Unom=1000,
      Mdotnom=2.5,
      steadystate_T_wall=true,
      redeclare
        ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
        CollectorGeometry,
      pstart=100000,
      Tstart_inlet=436.15,
      Tstart_outlet=476.15)
      annotation (Placement(transformation(extent={{-162,-136},{-124,-98}})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.airCell.Q_tot;
     der(E_ORC) = ORC.Pel_gross;
     der(E_HX) = HxOilWater.Summary.Q_ss;
     Q_hx = HxOilWater.Summary.Q_ss;
     eta_ORC_el = ORC.Pel_gross/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_gross + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.SolarAbsorber.Eta_tot;

     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-175.3,-66},{-208,-66},{-208,-184},{-193.2,-184}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-70,-130},{-70,-173.5},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-140,-192},{-140,-194},{-120,-194},{-120,-166.6},{-105.6,-166.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(DpSF.InFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-49.4,-76},{-70,-76},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-38.6,-76},{22,-76},{22,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{40,-75},{43.5,-75},{43.5,-76.4},{52.2,-76.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-44,-174},{-92.8,-174},{-92.8,-173.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{118.4,-174.6},{-4,-174.6},{-4,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-4.44089e-016,-125},{-4.44089e-016,-174},{-24,-174}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, ValveSF.OutFlow) annotation (Line(
        points={{-38.6,-76},{4.44089e-016,-76},{4.44089e-016,-107}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-139,-30},{-146,-30},{-146,-8.6},{-127.6,-8.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-37.4,-50},{-30.75,-50},{-30.75,-61.6},{-26,-61.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-15.7,-64},{-8,-64},{-8,-116}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{6,-68},{6,-76},{22,-76},{22,-75}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-132.7,-38},{-104,-38},{-104,-66.4},{-26,-66.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, DpSF1.InFlow) annotation (Line(
        points={{202,-120},{164,-120},{164,-126.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(DpSF1.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{164,-137.4},{164,-148}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{164,-164},{162,-164},{162,-182},{131.2,-182},{131.2,-181.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{138,90},{138,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{138,110},{138,141.75},{160.2,141.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-3.5,143},{4.25,143},{4.25,110.4},{24,110.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{256,140},{250,140},{250,132},{306,132},{306,137.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{24,-16},{-32,-16},{-32,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-102,59.5},{-59,59.5},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{71.8,-76.4},{71.8,-76},{80,-76},{80,-16},{45,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-59,10},{-59,-15.5},{-114.8,-15.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{26,66},{26,60},{-12,60}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{107,-86},{107,-174},{-24,-174}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-32,60},{-59,60},{-59,30}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{24,105.6},{-28,105.6},{-28,170},{222,170},{222,151},{242,151}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{194,176},{188,176},{188,152.1},{179.4,152.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{78.25,102.2},{76.125,102.2},{76.125,60},{-12,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{67.9,121.4},{68,121.4},{68,142},{114,142},{114,141.75},{160.2,
            141.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{34.3,108},{50,108},{50,108.2},{67,108.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-149,72},{-148,72},{-148,59.52},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-123,59.5},{-130,59.5},{-130,66},{-154.72,66},{-154.72,59.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-155.34,12},{-154,12},{-154,-8.6},{-127.6,-8.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-203.7,58},{-196,58},{-196,32},{-175.8,32},{-175.8,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-237.5,65},{-220,65},{-220,60.4},{-214,60.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-141.3,79},{-126,79},{-126,116},{-220,116},{-220,56},{-214,56},{
            -214,55.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-169,-74},{-166,-74},{-166,-78},{-70,-78},{-70,-110}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, DpSF1.InFlow) annotation (Line(
        points={{168.743,-85.2889},{164,-85.2889},{164,-126.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{169.371,-47.3333},{132,-47.3333},{132,22},{98,22},{98,60},{-12,
            60}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{215.5,11},{186.343,11},{186.343,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{215.5,-7},{215.5,-8},{202.057,-8},{202.057,-39.8667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
        points={{179.4,152.1},{190,152.1},{190,127.2},{193.44,127.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{256,45},{256,58}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
        points={{210.46,130.8},{210.46,134},{250,134},{250,132},{306,132},{306,137.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
        points={{256,72},{256,78},{216,78},{216,91.2},{210.46,91.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
        points={{261,94},{256,94},{256,82},{240,82},{240,78},{216,78},{216,91.2},{
            210.46,91.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
        points={{227.02,94.8},{226,94.8},{226,62},{220,62},{220,58},{107,58},{107,
            -64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{157,28},{158,28},{158,34},{204,34},{204,58},{107,58},{107,-64}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
        points={{-105.6,-166.6},{-105.6,-152},{-140,-152},{-140,-136.345},{
            -139.2,-136.345}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-136.667,-98.3455},{-136.667,-78},{-70,-78},{-70,-110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-185.86,-141},{-174,-141},{-174,-123.045},{-160.1,-123.045}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-189.5,-121},{-182,-121},{-182,-118},{-159.889,-118},{-159.889,
            -115.964}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-187.4,-102},{-182,-102},{-182,-108.364},{-159.889,-108.364}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-189.5,-83},{-170,-83},{-170,-101.109},{-159.467,-101.109}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-179.4,-184},{-176,-184},{-176,-180},{-170,-180},{-170,
            -130.473},{-159.889,-130.473}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -200},{360,200}}), graphics), Icon(coordinateSystem(extent={{-260,
              -200},{360,200}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_III;

  model SFDefDynBMConstHx_P_IV
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      eta_is=0.85,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-206,50},{-226,70}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-153,96})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-254,148},{-232,162}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-294,-50},{-284,-40}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-294,-32},{-282,-20}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-294,-12},{-284,-2}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-184,-108},{-204,-88}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-94,-40})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-242,-116},{-226,-102}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-254,2},{-272,18}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-164,-44})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-286,-114},{-274,-102}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-63,1})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-128,-98})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-242,46},{-224,30}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-208,-8})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{-42,-2},{-22,18}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{132,64},{122,74}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{132,82},{122,92}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{40,-116},{20,-96}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07) annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=90,
          origin={70,-56})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-115,12})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-144,20},{-132,32}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-98,14},{-70,32}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-330,138},{-320,148}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{96,-44},{120,-28}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={70,-80})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-206.5,135.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={162,112})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={212,222})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{62,202},{92,232}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={13,1})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={44,176})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{186,170},{148,192}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-116,136})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-65,184})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-108,214},{-98,224}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{182,216},{142,238}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={162,141})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={-59.5,60})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-82,142},{-54,160}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{86,252},{114,270}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{46,104},{80,124}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      eta_is=0.85,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-13,189})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-338,-64},{-324,-50}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-303,134})));
    Components.Biomass.Flow1DIncHeatInput_L BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-245,112})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      Modelica.SIunits.Power Pel_net_tot "Net electrical power";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{78,-18},{122,38}})));
    Components.HX_singlephase HxOilWater(
      redeclare package MediumSs =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      MdotNom_ps=1,
      MdotNom_ss=4.8,
      A_ps=6.4,
      A_ss=6.4,
      U_ps=2500,
      U_ss=3000,
      steadystate_T_wall=true,
      redeclare package MediumPs = ThermoCycle.Media.Water,
      p_ps_start=100000,
      T_ps_su_start=340.15,
      T_ps_ex_start=343.15,
      p_ss_start=400000,
      T_ss_su_start=354.15,
      T_ss_ex_start=347.15) annotation (Placement(transformation(
          extent={{-18,-23},{18,23}},
          rotation=90,
          origin={116,187})));
  BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF(
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
      annotation (Placement(transformation(extent={{-256,-64},{-218,-26}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.12808e+07)
      annotation (Placement(transformation(extent={{-11,-11},{11,11}},
          rotation=0,
          origin={-173,135})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Cell_wf.Q_tot;
     der(E_ORC) = ORC.Pel_net;
     der(E_HX) = HxOilWater.Summary.Q_ss;
     Q_hx = HxOilWater.Summary.Q_ss;

     /* Net Electrical power */

    Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9 - PumpORC.W_dot/0.9 - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;

     /* Efficiency */
     eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.SolarAbsorber.Eta_tot;

     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-269.3,10},{-298,10},{-298,-108},{-287.2,-108}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-164,-54},{-164,-97.5},{-186.8,-97.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-234,-116},{-234,-118},{-214,-118},{-214,-90.6},{-199.6,-90.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{-54,1},{-50.5,1},{-50.5,-0.4},{-41.8,-0.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-138,-98},{-186.8,-98},{-186.8,-97.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{24.4,-98.6},{-98,-98.6},{-98,-98},{-118,-98}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-94,-49},{-94,-98},{-118,-98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-233,46},{-240,46},{-240,67.4},{-221.6,67.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-131.4,26},{-124.75,26},{-124.75,14.4},{-120,14.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-109.7,12},{-102,12},{-102,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{-84,14},{-84,0},{-72,0},{-72,1}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-226.7,38},{-198,38},{-198,9.6},{-120,9.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
        points={{108,-44},{70,-44},{70,-50.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{70,-61.4},{70,-72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{70,-88},{68,-88},{68,-106},{37.2,-106},{37.2,-105.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{44,166},{44,134},{13,134},{13,12}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{44,186},{44,217.75},{66.2,217.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-97.5,219},{-89.75,219},{-89.75,186.4},{-70,186.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{162,216},{156,216},{156,208},{212,208},{212,213.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{-70,60},{-126,60},{-126,60.5},{-208.8,60.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{-22.2,-0.4},{-22.2,0},{-14,0},{-14,60},{-49,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-153,86},{-153,60.5},{-208.8,60.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{-68,142},{-68,136},{-106,136}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{13,-10},{13,-98},{-118,-98}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-126,136},{-153,136},{-153,106}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{-70,181.6},{-122,181.6},{-122,246},{128,246},{128,227},{148,227}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{100,252},{94,252},{94,228.1},{85.4,228.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{-13.75,178.2},{-17.875,178.2},{-17.875,136},{-106,136}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{-24.1,197.4},{-26,197.4},{-26,218},{20,218},{20,217.75},{66.2,217.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{-59.7,184},{-44,184},{-44,184.2},{-25,184.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-243,148},{-242,148},{-242,135.52},{-248.72,135.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-217,135.5},{-224,135.5},{-224,142},{-248.72,142},{-248.72,135.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-249.34,88},{-248,88},{-248,67.4},{-221.6,67.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-297.7,134},{-290,134},{-290,108},{-269.8,108},{-269.8,112}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-319.5,143},{-314,143},{-314,136.4},{-308,136.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-235.3,155},{-220,155},{-220,192},{-314,192},{-314,132},{-308,132},
            {-308,131.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-263,2},{-260,2},{-260,-2},{-164,-2},{-164,-34}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
        points={{76.7429,-9.28889},{70,-9.28889},{70,-50.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{77.3714,28.6667},{38,28.6667},{38,98},{4,98},{4,136},{-106,136}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{121.5,87},{94.3429,87},{94.3429,36.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{121.5,69},{121.5,68},{110.057,68},{110.057,36.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
        points={{85.4,228.1},{96,228.1},{96,203.2},{99.44,203.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{162,121},{162,134}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
        points={{116.46,206.8},{116.46,210},{156,210},{156,208},{212,208},{212,213.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
        points={{162,148},{162,154},{122,154},{122,167.2},{116.46,167.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
        points={{167,170},{162,170},{162,158},{146,158},{146,154},{122,154},{122,167.2},
            {116.46,167.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
        points={{133.02,170.8},{132,170.8},{132,138},{126,138},{126,134},{13,134},
            {13,12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{63,104},{64,104},{64,110},{110,110},{110,134},{13,134},{13,12}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
        points={{-199.6,-90.6},{-199.6,-76},{-234,-76},{-234,-64.3455},{-233.2,
            -64.3455}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-323.86,-57},{-268,-57},{-268,-51.0455},{-254.1,-51.0455}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-283.5,-45},{-276,-45},{-276,-42},{-253.889,-42},{-253.889,
            -43.9636}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-281.4,-26},{-276,-26},{-276,-36.3636},{-253.889,-36.3636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-283.5,-7},{-264,-7},{-264,-29.1091},{-253.467,-29.1091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-273.4,-108},{-270,-108},{-270,-104},{-264,-104},{-264,
            -58.4727},{-253.889,-58.4727}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
        points={{-196,135.5},{-190,135.5},{-190,135},{-182.9,135}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-163.1,135},{-158,135},{-158,136},{-152,136},{-152,120},{-153,120},
            {-153,106}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
        points={{-230.667,-26.3455},{-230.667,-8},{-213.4,-8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-202.6,-8},{-194,-8},{-194,-2},{-164,-2},{-164,-34}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-94,-31},{-94,-2},{-72,-2},{-72,1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-94,-31},{-94,-2},{-164,-2},{-164,-34}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,
              -200},{280,240}}), graphics), Icon(coordinateSystem(extent={{-300,-200},
              {280,240}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_IV;

  model SFDefDynBMConstHx_P_V
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      eta_is=0.85,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-252,40},{-272,60}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-199,86})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-300,138},{-278,152}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-340,-60},{-330,-50}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-340,-42},{-328,-30}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-340,-22},{-330,-12}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-230,-118},{-250,-98}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-140,-50})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-288,-126},{-272,-112}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-300,-8},{-318,8}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-210,-54})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-332,-124},{-320,-112}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-109,-9})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-174,-108})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-288,36},{-270,20}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-254,-18})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{96,40},{86,50}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{74,58},{64,68}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-6,-126},{-26,-106}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07) annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=90,
          origin={24,-66})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-161,2})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-190,10},{-178,22}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-144,4},{-116,22}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-376,128},{-366,138}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{50,-54},{74,-38}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={24,-90})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-252.5,125.5})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{16,192},{46,222}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={-33,-9})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={-2,166})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-162,126})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-111,174})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-154,204},{-144,214}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={-105.5,50})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-128,132},{-100,150}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{40,242},{68,260}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{0,94},{34,114}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      eta_is=0.85,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-59,179})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-340,-82},{-326,-68}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-349,124})));
    Components.Biomass.Flow1DIncHeatInput_L BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-291,102})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      Modelica.SIunits.Power Pel_net_tot "Net electrical power";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{32,-28},{76,28}})));
  BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF(
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
      annotation (Placement(transformation(extent={{-302,-74},{-264,-36}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.12808e+07)
      annotation (Placement(transformation(extent={{-11,-11},{11,11}},
          rotation=0,
          origin={-219,125})));
    Components.Biomass.Flow1DIncHeatInput_L_NoDyn HX_OilWater(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Vint=0.01,
      Aint=6.4,
      Aext=6.5,
      Unom=3000,
      Mdotnom=4.8,
      steadystate_T=true,
      pstart=400000,
      Tstart_inlet=354.15,
      Tstart_outlet=347.15,
      Tstart_inlet_wall=343.15,
      Tstart_outlet_wall=333.15) annotation (Placement(transformation(
          extent={{19,-21},{-19,21}},
          rotation=-90,
          origin={71,163})));
    Modelica.Blocks.Sources.Constant const6(k=70 + 273.15)
      annotation (Placement(transformation(extent={{128,222},{116,234}})));
    Modelica.Blocks.Sources.Constant const7(k=-8380)
      annotation (Placement(transformation(extent={{138,162},{126,174}})));
    Modelica.Blocks.Sources.Constant const8(k=0.02)
      annotation (Placement(transformation(extent={{-104,188},{-94,198}})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Cell_wf.Q_tot;
     der(E_ORC) = ORC.Pel_net;
     der(E_HX) =  HX_OilWater.source_Q.Q_tot;
     Q_hx = HX_OilWater.source_Q.Q_tot;

     /* Net Electrical power */

     Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9 - PumpORC.W_dot/0.9 - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;

     /* Efficiency */
     eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.SolarAbsorber.Eta_tot;

     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-315.3,0},{-344,0},{-344,-118},{-333.2,-118}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-210,-64},{-210,-107.5},{-232.8,-107.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-280,-126},{-280,-128},{-260,-128},{-260,-100.6},{-245.6,
            -100.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{-100,-9},{-96.5,-9},{-96.5,-10.4},{-87.8,-10.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-184,-108},{-232.8,-108},{-232.8,-107.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{-21.6,-108.6},{-144,-108.6},{-144,-108},{-164,-108}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-140,-59},{-140,-108},{-164,-108}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-279,36},{-286,36},{-286,57.4},{-267.6,57.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-177.4,16},{-170.75,16},{-170.75,4.4},{-166,4.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-155.7,2},{-148,2},{-148,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{-130,4},{-130,-10},{-118,-10},{-118,-9}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-272.7,28},{-244,28},{-244,-0.4},{-166,-0.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
        points={{62,-54},{24,-54},{24,-60.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{24,-71.4},{24,-82}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{24,-98},{22,-98},{22,-116},{-8.8,-116},{-8.8,-115.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{-2,156},{-2,124},{-33,124},{-33,2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{-2,176},{-2,207.75},{20.2,207.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-143.5,209},{-135.75,209},{-135.75,176.4},{-116,176.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{-116,50},{-172,50},{-172,50.5},{-254.8,50.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{-68.2,-10.4},{-68.2,-10},{-60,-10},{-60,50},{-95,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-199,76},{-199,50.5},{-254.8,50.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{-114,132},{-114,126},{-152,126}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{-33,-20},{-33,-108},{-164,-108}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-172,126},{-199,126},{-199,96}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{54,242},{48,242},{48,218.1},{39.4,218.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{-59.75,168.2},{-63.875,168.2},{-63.875,126},{-152,126}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{-70.1,187.4},{-72,187.4},{-72,208},{-26,208},{-26,207.75},{
            20.2,207.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-289,138},{-288,138},{-288,125.52},{-294.72,125.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-263,125.5},{-270,125.5},{-270,132},{-294.72,132},{-294.72,
            125.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-295.34,78},{-294,78},{-294,57.4},{-267.6,57.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-343.7,124},{-336,124},{-336,98},{-315.8,98},{-315.8,102}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-365.5,133},{-360,133},{-360,126.4},{-354,126.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-281.3,145},{-266,145},{-266,182},{-360,182},{-360,122},{-354,
            122},{-354,121.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-309,-8},{-306,-8},{-306,-12},{-210,-12},{-210,-44}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
        points={{30.7429,-19.2889},{24,-19.2889},{24,-60.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{31.3714,18.6667},{-8,18.6667},{-8,88},{-42,88},{-42,126},{-152,
            126}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{63.5,63},{48.3429,63},{48.3429,26.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{85.5,45},{85.5,44},{64.0571,44},{64.0571,26.1333}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{17,94},{18,94},{18,100},{64,100},{64,124},{-33,124},{-33,2}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
        points={{-245.6,-100.6},{-245.6,-86},{-280,-86},{-280,-74.3455},{-279.2,
            -74.3455}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-325.86,-75},{-314,-75},{-314,-61.0455},{-300.1,-61.0455}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-329.5,-55},{-322,-55},{-322,-52},{-299.889,-52},{-299.889,
            -53.9636}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-327.4,-36},{-322,-36},{-322,-46.3636},{-299.889,-46.3636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-329.5,-17},{-310,-17},{-310,-39.1091},{-299.467,-39.1091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-319.4,-118},{-316,-118},{-316,-114},{-310,-114},{-310,
            -68.4727},{-299.889,-68.4727}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
        points={{-242,125.5},{-236,125.5},{-236,125},{-228.9,125}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-209.1,125},{-204,125},{-204,126},{-198,126},{-198,110},{-199,
            110},{-199,96}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
        points={{-276.667,-36.3455},{-276.667,-18},{-259.4,-18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-248.6,-18},{-240,-18},{-240,-12},{-210,-12},{-210,-44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-140,-41},{-140,-12},{-118,-12},{-118,-9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-140,-41},{-140,-12},{-210,-12},{-210,-44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow, HX_OilWater.inlet_fl2) annotation (Line(
        points={{39.4,218.1},{73.94,218.1},{73.94,182}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HX_OilWater.outlet_fl2, MflowHXl.port_a) annotation (Line(
        points={{73.52,144.38},{73.52,124},{-33,124},{-33,2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(const6.y, pID2.PV) annotation (Line(
        points={{115.4,228},{-128,228},{-128,171.6},{-116,171.6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(const7.y, HX_OilWater.u) annotation (Line(
        points={{125.4,168},{108,168},{108,163},{87.8,163}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const8.y, PumpHxOil_1.flow_in) annotation (Line(
        points={{-93.5,193},{-88,193},{-88,174.2},{-71,174.2}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
              -200},{280,260}}), graphics), Icon(coordinateSystem(extent={{-380,
              -200},{280,260}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_V;

  model SFDefDynBMConstHx_P_IV_Water
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      eta_is=0.85,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-290,66},{-310,86}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-237,112})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-338,164},{-316,178}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-378,-34},{-368,-24}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-378,-16},{-366,-4}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-378,4},{-368,14}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-268,-92},{-288,-72}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-178,-24})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-326,-100},{-310,-86}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-338,18},{-356,34}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-248,-28})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15,
      pre_y_start=false)
      annotation (Placement(transformation(extent={{-370,-98},{-358,-86}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-147,17})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-212,-82})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-326,62},{-308,46}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-292,8})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{-126,14},{-106,34}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{48,80},{38,90}})));
    Modelica.Blocks.Sources.Constant const2(k=2.45)
      annotation (Placement(transformation(extent={{48,98},{38,108}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-44,-100},{-64,-80}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07) annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=90,
          origin={-14,-40})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-199,28})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-228,36},{-216,48}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-182,30},{-154,48}})));
    Modelica.Blocks.Sources.Constant const4(k=245 + 273.15)
      annotation (Placement(transformation(extent={{-396,144},{-386,154}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{12,-28},{36,-12}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={-14,-64})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-290.5,151.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={78,128})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={128,238})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-22,218},{8,248}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={-71,17})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={-40,192})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{102,186},{64,208}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-200,152})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-149,200})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-192,230},{-182,240}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{98,232},{58,254}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={78,157})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={-143.5,76})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-166,158},{-138,176}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{2,268},{30,286}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-38,120},{-4,140}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      eta_is=0.85,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-97,205})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-378,-56},{-364,-42}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      CSmin=0.3,
      Ti=20*100,
      Kp=15)   annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-369,146})));
    Components.Biomass.Flow1DIncHeatInput_L BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      QcombustionNominal=500e3,
      QcombustionStart=150e3,
      QcombustionMin=150e3,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-329,128})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      Modelica.SIunits.Power Pel_net_tot "Net electrical power";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{-6,-2},{38,54}})));
    Components.HX_singlephase HxOilWater(
      redeclare package MediumSs =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      MdotNom_ps=1,
      MdotNom_ss=4.8,
      A_ps=6.4,
      A_ss=6.4,
      U_ps=2500,
      U_ss=3000,
      steadystate_T_wall=true,
      redeclare package MediumPs = ThermoCycle.Media.Water,
      p_ps_start=100000,
      T_ps_su_start=340.15,
      T_ps_ex_start=343.15,
      p_ss_start=400000,
      T_ss_su_start=354.15,
      T_ss_ex_start=347.15,
      T_wall_fixed=false)   annotation (Placement(transformation(
          extent={{-18,-23},{18,23}},
          rotation=90,
          origin={32,203})));
  BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF(
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
      annotation (Placement(transformation(extent={{-340,-48},{-302,-10}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.12808e+07)
      annotation (Placement(transformation(extent={{-11,-11},{11,11}},
          rotation=0,
          origin={-257,151})));
    Components.WaterSide.WaterCircuit waterCircuit(redeclare package Medium =
          ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{154,142},{210,210}})));
    Modelica.Blocks.Sources.Constant Q_heating(k=0)
      annotation (Placement(transformation(extent={{274,192},{248,218}})));
    Modelica.Blocks.Sources.Constant Q_cooling(k=100e3)
      annotation (Placement(transformation(extent={{274,142},{248,168}})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Cell_wf.Q_tot;
     der(E_ORC) = ORC.Pel_net;
     der(E_HX) = HxOilWater.Summary.Q_ss;
     Q_hx = HxOilWater.Summary.Q_ss;

     /* Net Electrical power */

    Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9 - PumpORC.W_dot/0.9 - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;

     /* Efficiency */
     eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.SolarAbsorber.Eta_tot;

     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-353.3,26},{-382,26},{-382,-92},{-371.2,-92}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-248,-38},{-248,-81.5},{-270.8,-81.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-318,-100},{-318,-102},{-298,-102},{-298,-74.6},{-283.6,-74.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{-138,17},{-134.5,17},{-134.5,15.6},{-125.8,15.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-222,-82},{-270.8,-82},{-270.8,-81.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{-59.6,-82.6},{-182,-82.6},{-182,-82},{-202,-82}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-178,-33},{-178,-82},{-202,-82}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-317,62},{-324,62},{-324,83.4},{-305.6,83.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-215.4,42},{-208.75,42},{-208.75,30.4},{-204,30.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-193.7,28},{-186,28},{-186,-24}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{-168,30},{-168,16},{-156,16},{-156,17}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-310.7,54},{-282,54},{-282,25.6},{-204,25.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
        points={{24,-28},{-14,-28},{-14,-34.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{-14,-45.4},{-14,-56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{-14,-72},{-16,-72},{-16,-90},{-46.8,-90},{-46.8,-89.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{-40,182},{-40,150},{-71,150},{-71,28}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{-40,202},{-40,233.75},{-17.8,233.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-181.5,235},{-173.75,235},{-173.75,202.4},{-154,202.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{78,232},{72,232},{72,224},{128,224},{128,229.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{-154,76},{-210,76},{-210,76.5},{-292.8,76.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{-106.2,15.6},{-106.2,16},{-98,16},{-98,76},{-133,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-237,102},{-237,76.5},{-292.8,76.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{-152,158},{-152,152},{-190,152}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{-71,6},{-71,-82},{-202,-82}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-210,152},{-237,152},{-237,122}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{-154,197.6},{-206,197.6},{-206,262},{44,262},{44,243},{64,243}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{16,268},{10,268},{10,244.1},{1.4,244.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{-97.75,194.2},{-101.875,194.2},{-101.875,152},{-190,152}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{-108.1,213.4},{-110,213.4},{-110,234},{-64,234},{-64,233.75},{
            -17.8,233.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{-143.7,200},{-128,200},{-128,200.2},{-109,200.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-327,164},{-326,164},{-326,151.52},{-332.72,151.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-301,151.5},{-308,151.5},{-308,158},{-332.72,158},{-332.72,
            151.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-333.34,104},{-332,104},{-332,83.4},{-305.6,83.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-363.7,146},{-358,146},{-358,128},{-353.8,128}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const4.y, pID3.SP) annotation (Line(
        points={{-385.5,149},{-382,149},{-382,148.4},{-374,148.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-319.3,171},{-288,171},{-288,212},{-382,212},{-382,152},{-374,
            152},{-374,143.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-347,18},{-344,18},{-344,14},{-248,14},{-248,-18}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
        points={{-7.25714,6.71111},{-14,6.71111},{-14,-34.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{-6.62857,44.6667},{-46,44.6667},{-46,114},{-80,114},{-80,152},
            {-190,152}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const2.y, ORC.MdotWfORC) annotation (Line(
        points={{37.5,103},{10.3429,103},{10.3429,52.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{37.5,85},{37.5,84},{26.0571,84},{26.0571,52.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
        points={{1.4,244.1},{12,244.1},{12,219.2},{15.44,219.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{78,137},{78,150}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
        points={{32.46,222.8},{32.46,226},{72,226},{72,224},{128,224},{128,
            229.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
        points={{78,164},{78,170},{30,170},{30,183.2},{32.46,183.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
        points={{83,186},{74,186},{74,174},{58,174},{58,170},{34,170},{34,183.2},
            {32.46,183.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
        points={{49.02,186.8},{48,186.8},{48,154},{42,154},{42,150},{-71,150},{
            -71,28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{-21,120},{-20,120},{-20,126},{26,126},{26,150},{-71,150},{-71,
            28}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
        points={{-283.6,-74.6},{-283.6,-60},{-318,-60},{-318,-48.3455},{-317.2,
            -48.3455}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-363.86,-49},{-352,-49},{-352,-35.0455},{-338.1,-35.0455}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-367.5,-29},{-360,-29},{-360,-26},{-337.889,-26},{-337.889,
            -27.9636}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-365.4,-10},{-360,-10},{-360,-20.3636},{-337.889,-20.3636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-367.5,9},{-348,9},{-348,-13.1091},{-337.467,-13.1091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-357.4,-92},{-354,-92},{-354,-88},{-348,-88},{-348,-42.4727},{
            -337.889,-42.4727}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
        points={{-280,151.5},{-274,151.5},{-274,151},{-266.9,151}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-247.1,151},{-242,151},{-242,152},{-236,152},{-236,136},{-237,
            136},{-237,122}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
        points={{-314.667,-10.3455},{-314.667,8},{-297.4,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-286.6,8},{-278,8},{-278,14},{-248,14},{-248,-18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-178,-15},{-178,14},{-156,14},{-156,17}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-178,-15},{-178,14},{-248,14},{-248,-18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.PthCooling, waterCircuit.Q_ORC) annotation (Line(
        points={{39.2571,3.6},{128,3.6},{128,155.6},{151.2,155.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Q_heating.y, waterCircuit.Q_Heating) annotation (Line(
        points={{246.7,205},{238,205},{238,196.4},{212.24,196.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Q_cooling.y, waterCircuit.Q_Cooling) annotation (Line(
        points={{246.7,155},{234,155},{234,148.8},{212.8,148.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(waterCircuit.T_to_Hx, sourceMdot.in_T) annotation (Line(
        points={{193.48,140.98},{193.48,100},{100,100},{100,127.8},{84,127.8}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(HxOilWater.Q_hx, waterCircuit.Q_HX) annotation (Line(
        points={{43.96,215.24},{124,215.24},{124,195.72},{151.2,195.72}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(waterCircuit.m_to_Hx, sourceMdot.in_Mdot) annotation (Line(
        points={{180.6,140.3},{180.6,122},{84,122}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-400,
              -140},{280,280}}), graphics), Icon(coordinateSystem(extent={{-400,
              -140},{280,280}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_IV_Water;

  model SFDefDynBMConstHx_P_IV_control
     /* Simulazione di una giornata tipo - carico termico costante - Def parziale */
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpBM(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      M_dot_start=9.4,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      hstart=575410,
      X_pp0=0.5,
      V_dot_max=0.0263,
      eta_is=0.85,
      p_su_start=400000)
      annotation (Placement(transformation(extent={{-248,46},{-268,66}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-11},{10,11}},
          rotation=-90,
          origin={-195,92})));
    Modelica.Fluid.Sensors.Temperature Temp_BMout(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-296,144},{-274,158}})));
    Modelica.Blocks.Sources.Constant Tamb(k=25 + 273.15)
      annotation (Placement(transformation(extent={{-336,-54},{-326,-44}})));
    Modelica.Blocks.Sources.Constant Theta(k=0)
      annotation (Placement(transformation(extent={{-336,-36},{-324,-24}})));
    Modelica.Blocks.Sources.Constant V_Wind(k=0)
      annotation (Placement(transformation(extent={{-336,-16},{-326,-6}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.5,
      hstart=3.46e5,
      V_dot_max=0.0064,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-226,-112},{-246,-92}})));
   BrickerISES.Components.Valve_lin ValveSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      CheckValve=true,
      Afull=5.7971e-05,
      Mdot_nom=0.4,
      Xopen=0.074) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-136,-44})));
    Modelica.Fluid.Sensors.Temperature TempSfIn(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-284,-120},{-268,-106}})));
    Modelica.Fluid.Sensors.Temperature TempSfOut(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-296,-2},{-314,14}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-206,-48})));
    Modelica.Blocks.Logical.Hysteresis hysteresis(                   uHigh=228 +
          273.15, uLow=200 + 273.15)
      annotation (Placement(transformation(extent={{-328,-118},{-316,-106}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowSF_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-105,-3})));
    Modelica.Fluid.Sensors.MassFlowRate MflowToSF(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-170,-102})));
    Modelica.Fluid.Sensors.Temperature Temp_BMin(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-284,42},{-266,26}})));

    ThermoCycle.Components.Units.PdropAndValves.DP DpSF(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=2.97823e+07)
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-250,-12})));
    ThermoCycle.Components.Units.Tanks.OpenTank Tank1(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=2.9,
      L_lstart=0.1,
      V_tank=0.5,
      p_ext=450000,
      Tstart=477.15,
      pstart=450000)
      annotation (Placement(transformation(extent={{-84,-6},{-64,14}})));

    Modelica.Blocks.Sources.Constant const1(
                                           k=60 + 273.15)
      annotation (Placement(transformation(extent={{122,44},{112,54}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      X_pp0=0.5,
      M_dot_start=2.9,
      hstart=361133,
      V_dot_max=0.0065,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{-2,-120},{-22,-100}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_ORC(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.37457e+07) annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=90,
          origin={28,-60})));
    ThermoCycle.Components.Units.ControlSystems.PID pID(
      PVmin=0,
      CSmin=0.0004,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Ti=1,
      Kp=-0.1) annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-157,8})));
    Modelica.Blocks.Sources.Constant const3(k=239 + 273.15)
      annotation (Placement(transformation(extent={{-186,16},{-174,28}})));
    Modelica.Fluid.Sensors.Temperature TempSfSysOut_SF(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-140,10},{-112,28}})));
    Modelica.Fluid.Sensors.Temperature T_Outlet_orc(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{54,-48},{78,-32}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowORC_out(redeclare package Medium
        = ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-8,-10},{8,10}},
          rotation=-90,
          origin={28,-84})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_out(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10.5,9.5},{10.5,-9.5}},
          rotation=0,
          origin={-248.5,131.5})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
      redeclare package Medium = ThermoCycle.Media.Water,
      UseT=true,
      Mdot_0=1,
      p=100000,
      T_0=341.15) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={120,108})));
    ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
        Medium = ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={170,218})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_2(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.00988,
      eta_is=0.85,
      p_su_start=350000)
      annotation (Placement(transformation(extent={{20,198},{50,228}})));

    Modelica.Fluid.Sensors.MassFlowRate MflowHXl(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-11,-11},{11,11}},
          rotation=-90,
          origin={-29,-3})));
    Modelica.Fluid.Sensors.MassFlowRate MflowHX_Recirculation(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={2,172})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_inlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{144,166},{106,188}})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_mix(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-158,132})));
    ThermoCycle.Components.Units.ControlSystems.PID pID2(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Td=0,
      Kp=0.1,
      CSmin=0.001,
      Ti=0.2)  annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-107,180})));
    Modelica.Blocks.Sources.Constant const5(k=70 + 273.15)
      annotation (Placement(transformation(extent={{-150,210},{-140,220}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_water_outlet(redeclare package
        Medium = ThermoCycle.Media.Water)
      annotation (Placement(transformation(extent={{140,212},{100,234}})));
    Modelica.Fluid.Sensors.MassFlowRate Mflow_HEX_water(redeclare package
        Medium =
          ThermoCycle.Media.Water) annotation (Placement(transformation(
          extent={{-7,-8},{7,8}},
          rotation=90,
          origin={120,137})));
    Modelica.Fluid.Sensors.MassFlowRate MflowBM_in(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(
          extent={{10.5,-10},{-10.5,10}},
          rotation=0,
          origin={-101.5,56})));
    Modelica.Fluid.Sensors.Temperature T_inlet_ORC(redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-124,138},{-96,156}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_inlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{44,248},{72,266}})));
    Modelica.Fluid.Sensors.Temperature Temp_HEX_oil_outlet(redeclare package
        Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP)
      annotation (Placement(transformation(extent={{-14,98},{20,118}})));
    ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump PumpHxOil_1(
      PumpInput=ThermoCycle.Functions.Enumerations.PumpInputs.FF,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      PumpType=ThermoCycle.Functions.Enumerations.PumpTypes.UD,
      X_pp0=0.5,
      M_dot_start=3.9,
      hstart=145528,
      V_dot_max=0.0015,
      eta_is=0.85,
      p_su_start=350000) annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-55,185})));
    Components.DNISources.AM_DNI aM_DNI(redeclare package AmbientDataTable =
          BrickerISES.Components.AM.AmbientDataTables.AmbientDataTable_3DaysSummer)
      annotation (Placement(transformation(extent={{-396,-86},{-382,-72}})));
    ThermoCycle.Components.Units.ControlSystems.PID pID3(
      PVmin=0,
      CSmax=1,
      PVmax=440,
      CSstart=0.004,
      Ti=20*100,
      Kp=15,
      CSmin=0.01)
               annotation (Placement(transformation(
          extent={{-5,-6},{5,6}},
          rotation=0,
          origin={-345,130})));
    Components.Biomass.Flow1DIncHeatInput_L BM(
      Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      Mdotnom=9.4,
      CombustionInitialization=Modelica.Blocks.Types.Init.InitialState,
      Unom=1000,
      redeclare model combustionDynamic =
          BrickerISES.Components.Biomass.CombustionDynamic.FirstorderPowerCombustion,
      tStartup=20*60,
      M_wall=200,
      Vint=2,
      QcombustionStart=50e3,
      QcombustionNominal=250e3,
      QcombustionMin=10e3,
      pstart=100000,
      Tstart_inlet=473.15,
      Tstart_outlet=483.15,
      Tstart_inlet_wall=478.15,
      Tstart_outlet_wall=488.15) annotation (Placement(transformation(
          extent={{24,-31},{-24,31}},
          rotation=90,
          origin={-289,108})));

      /* Performance Indexes */
      Modelica.SIunits.Energy E_BM "Energy delivered by the biomass";
      Modelica.SIunits.Energy E_SF "Energy delivered by the solar field";
      Modelica.SIunits.Energy E_ORC "Energy delivered by the ORC system";
      Modelica.SIunits.Energy E_HX "Energy delivered by the heat exchanger";

      Modelica.SIunits.Power Pel_net_tot "Net electrical power";

      /* Efficiencies */
      Real eta_sys_CHP;
      Real eta_sys_el;
      Real eta_ORC_el;
      Real eta_ORC_chp;
      Real eta_SF;
      Real eta_BM;
      Real eta_HX;
      Real Q_hx;

    Components.ORC.ORCunitHxS ORC(
      MdotNom_wf=2.6,
      MdotNom_sf=2.45,
      A_wf=80,
      A_sf=80,
      U_wf=4000,
      U_sf=1000,
      MdotWf=2.6,
      redeclare package MediumSf =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      redeclare package MediumWf = ThermoCycle.Media.R245fa_CP,
      p_wf_start=2500000,
      T_wf_su_start=333.15,
      T_wf_ex_start=403.15,
      p_sf_start=350000,
      T_sf_su_start=518.15,
      T_sf_ex_start=441.15,
      steadystate_T_wall=true,
      T_wall_fixed=false,
      TWf_0=333.15,
      pWf=2500000)
      annotation (Placement(transformation(extent={{36,-22},{80,34}})));
    Components.HX_singlephase HxOilWater(
      redeclare package MediumSs =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      MdotNom_ps=1,
      MdotNom_ss=4.8,
      A_ps=6.4,
      A_ss=6.4,
      U_ps=2500,
      U_ss=3000,
      steadystate_T_wall=true,
      redeclare package MediumPs = ThermoCycle.Media.Water,
      p_ps_start=100000,
      T_ps_su_start=340.15,
      T_ps_ex_start=343.15,
      p_ss_start=400000,
      T_ss_su_start=354.15,
      T_ss_ex_start=347.15) annotation (Placement(transformation(
          extent={{-18,-23},{18,23}},
          rotation=90,
          origin={74,183})));
  BrickerISES.Components.SF.SF_SoltiguaL_IncNoWall SF(
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
      annotation (Placement(transformation(extent={{-298,-68},{-260,-30}})));
    ThermoCycle.Components.Units.PdropAndValves.DP Dp_BM(
      redeclare package Medium =
          ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
      h=0,
      A=5e3,
      UseHomotopy=true,
      k=1.12808e+07)
      annotation (Placement(transformation(extent={{-11,-11},{11,11}},
          rotation=0,
          origin={-215,131})));
    Modelica.Blocks.Logical.Hysteresis hysTOut(uLow=10, uHigh=150)
      "Hysteresis for on/off based on outside temperature"
      annotation (Placement(transformation(extent={{-374,-22},{-360,-8}})));
    Modelica.Blocks.Logical.Not not2
      annotation (Placement(transformation(extent={{-352,36},{-332,56}})));
    Modelica.Blocks.Math.BooleanToReal booToReaRad(realTrue=100 + 273.15,
        realFalse=245 + 273.15) "Radiator pump signal"
      annotation (Placement(transformation(extent={{-374,84},{-354,104}})));
    Modelica.Blocks.Math.BooleanToReal booToReaRad1(realTrue=0.2, realFalse=
          2.45) "Radiator pump signal"
      annotation (Placement(transformation(extent={{74,48},{54,68}})));
  equation
     /* Energy calculation */
     der(E_BM) = BM.source_Q.Q_tot;
     der(E_SF) = SF.Cell_wf.Q_tot;
     der(E_ORC) = ORC.Pel_net;
     der(E_HX) = HxOilWater.Summary.Q_ss;
     Q_hx = HxOilWater.Summary.Q_ss;

     /* Net Electrical power */

    Pel_net_tot = ORC.Pel_net - PumpSF.W_dot/0.9 - PumpORC.W_dot/0.9 - PumpBM.W_dot/0.9 - PumpHxOil_1.W_dot/0.9 - PumpHxOil_2.W_dot/0.9;

     /* Efficiency */
     eta_ORC_el = ORC.Pel_net/ORC.Q_orc_eva;
     eta_ORC_chp = (ORC.Pel_net + ORC.Pth_CfRank)/ORC.Q_orc_eva;
     //eta_BM = BM.source_Q.Q_tot/Q_delivered_by_biomass;
     eta_BM = 0.75;
     eta_SF = SF.SolarAbsorber.Eta_tot;

     eta_HX = 0.95;
     eta_sys_el = eta_ORC_el*eta_SF*eta_BM;
     eta_sys_CHP = eta_ORC_chp*eta_SF*eta_BM*eta_HX; //or (ORC.Pel_gross + ORC.Pth_CfRank+HxOilWater.Q_wf_)/(Q_BM +Q_SF) with Q_BM based on biomass burnt and Q_SF = DNI*A_eff*Theta

    connect(TempSfOut.T, hysteresis.u) annotation (Line(
        points={{-311.3,6},{-340,6},{-340,-112},{-329.2,-112}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MflowSF_Recirculation.port_a, PumpSF.InFlow) annotation (Line(
        points={{-206,-58},{-206,-101.5},{-228.8,-101.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(TempSfIn.port, PumpSF.OutFlow) annotation (Line(
        points={{-276,-120},{-276,-122},{-256,-122},{-256,-94.6},{-241.6,-94.6}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowSF_mix.port_b, Tank1.InFlow) annotation (Line(
        points={{-96,-3},{-92.5,-3},{-92.5,-4.4},{-83.8,-4.4}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(MflowToSF.port_b, PumpSF.InFlow) annotation (Line(
        points={{-180,-102},{-228.8,-102},{-228.8,-101.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpORC.OutFlow, MflowToSF.port_a) annotation (Line(
        points={{-17.6,-102.6},{-140,-102.6},{-140,-102},{-160,-102}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(ValveSF.InFlow,MflowToSF. port_a) annotation (Line(
        points={{-136,-53},{-136,-102},{-160,-102}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_BMin.port, PumpBM.OutFlow) annotation (Line(
        points={{-275,42},{-282,42},{-282,63.4},{-263.6,63.4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const3.y, pID.SP) annotation (Line(
        points={{-173.4,22},{-166.75,22},{-166.75,10.4},{-162,10.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pID.CS, ValveSF.cmd) annotation (Line(
        points={{-151.7,8},{-144,8},{-144,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfSysOut_SF.port, MflowSF_mix.port_a) annotation (Line(
        points={{-126,10},{-126,-4},{-114,-4},{-114,-3}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(Temp_BMin.T, pID.PV) annotation (Line(
        points={{-268.7,34},{-240,34},{-240,5.6},{-162,5.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_Outlet_orc.port, Dp_ORC.InFlow) annotation (Line(
        points={{66,-48},{28,-48},{28,-54.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_ORC.OutFlow, MflowORC_out.port_a) annotation (Line(
        points={{28,-65.4},{28,-76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowORC_out.port_b, PumpORC.InFlow) annotation (Line(
        points={{28,-92},{26,-92},{26,-110},{-4.8,-110},{-4.8,-109.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_a, MflowHXl.port_a) annotation (Line(
        points={{2,162},{2,130},{-29,130},{-29,8}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHX_Recirculation.port_b, PumpHxOil_2.InFlow) annotation (Line(
        points={{2,182},{2,213.75},{24.2,213.75}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(const5.y, pID2.SP) annotation (Line(
        points={{-139.5,215},{-131.75,215},{-131.75,182.4},{-112,182.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_water_outlet.port, sinkP.flangeB) annotation (Line(
        points={{120,212},{114,212},{114,204},{170,204},{170,209.6}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_in.port_b, PumpBM.InFlow) annotation (Line(
        points={{-112,56},{-168,56},{-168,56.5},{-250.8,56.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Tank1.OutFlow, MflowBM_in.port_a) annotation (Line(
        points={{-64.2,-4.4},{-64.2,-4},{-56,-4},{-56,56},{-91,56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(MflowBM_Recirculation.port_b, PumpBM.InFlow) annotation (Line(
        points={{-195,82},{-195,56.5},{-250.8,56.5}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(T_inlet_ORC.port, MflowBM_mix.port_b) annotation (Line(
        points={{-110,138},{-110,132},{-148,132}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowHXl.port_b, MflowToSF.port_a) annotation (Line(
        points={{-29,-14},{-29,-102},{-160,-102}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_mix.port_a, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-168,132},{-195,132},{-195,102}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pID2.PV, Temp_HEX_water_outlet.T) annotation (Line(
        points={{-112,177.6},{-164,177.6},{-164,242},{86,242},{86,223},{106,223}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_inlet.port, PumpHxOil_2.OutFlow) annotation (Line(
        points={{58,248},{52,248},{52,224.1},{43.4,224.1}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.InFlow, MflowBM_mix.port_b) annotation (Line(
        points={{-55.75,174.2},{-59.875,174.2},{-59.875,132},{-148,132}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(PumpHxOil_1.OutFlow, PumpHxOil_2.InFlow) annotation (Line(
        points={{-66.1,193.4},{-68,193.4},{-68,214},{-22,214},{-22,213.75},{
            24.2,213.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID2.CS, PumpHxOil_1.flow_in) annotation (Line(
        points={{-101.7,180},{-86,180},{-86,180.2},{-67,180.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.port, BM.outlet_fl2) annotation (Line(
        points={{-285,144},{-284,144},{-284,131.52},{-292.72,131.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_a, BM.outlet_fl2) annotation (Line(
        points={{-259,131.5},{-266,131.5},{-266,138},{-292.72,138},{-292.72,
            131.52}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(BM.inlet_fl2, PumpBM.OutFlow) annotation (Line(
        points={{-293.34,84},{-290,84},{-290,63.4},{-263.6,63.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pID3.CS, BM.u) annotation (Line(
        points={{-339.7,130},{-332,130},{-332,104},{-313.8,104},{-313.8,108}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temp_BMout.T, pID3.PV) annotation (Line(
        points={{-277.3,151},{-262,151},{-262,188},{-356,188},{-356,128},{-350,
            128},{-350,127.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TempSfOut.port, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-305,-2},{-302,-2},{-302,-6},{-206,-6},{-206,-38}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(ORC.OutletSf, Dp_ORC.InFlow) annotation (Line(
        points={{34.7429,-13.2889},{28,-13.2889},{28,-54.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ORC.InletSf, MflowBM_mix.port_b) annotation (Line(
        points={{35.3714,24.6667},{-4,24.6667},{-4,94},{-38,94},{-38,132},{-148,
            132}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(const1.y, ORC.TWfORCSu) annotation (Line(
        points={{111.5,49},{111.5,48},{68.0571,48},{68.0571,32.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PumpHxOil_2.OutFlow,HxOilWater. InFlowSs) annotation (Line(
        points={{43.4,224.1},{54,224.1},{54,199.2},{57.44,199.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sourceMdot.flangeB, Mflow_HEX_water.port_a) annotation (Line(
        points={{120,117},{120,130}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowPs, sinkP.flangeB) annotation (Line(
        points={{74.46,202.8},{74.46,206},{114,206},{114,204},{170,204},{170,
            209.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Mflow_HEX_water.port_b, HxOilWater.InFlowPs) annotation (Line(
        points={{120,144},{120,150},{80,150},{80,163.2},{74.46,163.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Temp_HEX_water_inlet.port, HxOilWater.InFlowPs) annotation (Line(
        points={{125,166},{120,166},{120,154},{104,154},{104,150},{80,150},{80,
            163.2},{74.46,163.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(HxOilWater.OutFlowSs, MflowHXl.port_a) annotation (Line(
        points={{91.02,166.8},{90,166.8},{90,134},{84,134},{84,130},{-29,130},{
            -29,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Temp_HEX_oil_outlet.port, MflowHXl.port_a) annotation (Line(
        points={{3,98},{22,98},{22,106},{68,106},{68,130},{-29,130},{-29,8}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(PumpSF.OutFlow, SF.InFlow) annotation (Line(
        points={{-241.6,-94.6},{-241.6,-80},{-276,-80},{-276,-68.3455},{-275.2,
            -68.3455}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aM_DNI.DNI, SF.DNI) annotation (Line(
        points={{-381.86,-79},{-316,-79},{-316,-55.0455},{-296.1,-55.0455}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tamb.y, SF.Tamb) annotation (Line(
        points={{-325.5,-49},{-318,-49},{-318,-46},{-295.889,-46},{-295.889,
            -47.9636}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(Theta.y, SF.Theta) annotation (Line(
        points={{-323.4,-30},{-318,-30},{-318,-40.3636},{-295.889,-40.3636}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(V_Wind.y, SF.v_wind) annotation (Line(
        points={{-325.5,-11},{-306,-11},{-306,-33.1091},{-295.467,-33.1091}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresis.y, SF.Defocusing) annotation (Line(
        points={{-315.4,-112},{-312,-112},{-312,-108},{-306,-108},{-306,
            -62.4727},{-295.889,-62.4727}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(MflowBM_out.port_b, Dp_BM.InFlow) annotation (Line(
        points={{-238,131.5},{-232,131.5},{-232,131},{-224.9,131}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Dp_BM.OutFlow, MflowBM_Recirculation.port_a) annotation (Line(
        points={{-205.1,131},{-200,131},{-200,132},{-194,132},{-194,116},{-195,
            116},{-195,102}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SF.OutFlow, DpSF.InFlow) annotation (Line(
        points={{-272.667,-30.3455},{-272.667,-12},{-255.4,-12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(DpSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-244.6,-12},{-236,-12},{-236,-6},{-206,-6},{-206,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_mix.port_a) annotation (Line(
        points={{-136,-35},{-136,-6},{-114,-6},{-114,-3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ValveSF.OutFlow, MflowSF_Recirculation.port_b) annotation (Line(
        points={{-136,-35},{-136,-6},{-206,-6},{-206,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(hysTOut.u, SF.DNI) annotation (Line(
        points={{-375.4,-15},{-386,-15},{-386,-42},{-360,-42},{-360,-70},{-316,
            -70},{-316,-55.0455},{-296.1,-55.0455}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysTOut.y, not2.u) annotation (Line(
        points={{-359.3,-15},{-354,-15},{-354,26},{-376,26},{-376,46},{-354,46}},

        color={255,0,255},
        smooth=Smooth.None));
    connect(not2.y, booToReaRad.u) annotation (Line(
        points={{-331,46},{-312,46},{-312,66},{-388,66},{-388,94},{-376,94}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(pID3.SP, booToReaRad.y) annotation (Line(
        points={{-350,132.4},{-358,132.4},{-358,134},{-374,134},{-374,112},{
            -346,112},{-346,94},{-353,94}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booToReaRad1.y, ORC.MdotWfORC) annotation (Line(
        points={{53,58},{52.3429,58},{52.3429,32.1333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booToReaRad1.u, booToReaRad.u) annotation (Line(
        points={{76,58},{98,58},{98,78},{-388,78},{-388,94},{-376,94}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-400,
              -200},{260,280}}), graphics), Icon(coordinateSystem(extent={{-400,
              -200},{260,280}})),
      experiment(StartTime=-5000, StopTime=75000),
      __Dymola_experimentSetupOutput);
  end SFDefDynBMConstHx_P_IV_control;
end NewComponentsConfiguration;
