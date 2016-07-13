within BrickerISES.Tests.AD.TestComponents.Sizing;
package Layout_I
  package SizingSimpleValve
    model Size_ValveByPassSF "Bypass valve for the solar field"

    parameter Real k(start = 0.00002, fixed = false) = 0.000021;
     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            455000)
        annotation (Placement(transformation(extent={{58,-12},{78,8}})));
     BrickerISES.Components.Valve_lin valve(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Afull=k,
        Xopen=0.04,
        Mdot_nom=0.1)
                    annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p0=558000,
        T_0=424.15)
        annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

    initial equation
      valve.Mdot = 0.1;

    equation

      connect(sourceP.flange, valve.InFlow) annotation (Line(
          points={{-60.6,-2},{-1,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{17,-2},{59.6,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 0.1 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 4% which is 
            <p> the percentage of flow with respect to the nominal one: 2.6*4/100 = 0.1
            
             
</html>"));
    end Size_ValveByPassSF;

    model Size_ValveByPassORC "Bypass valve for the solar field"

    parameter Real k(start = 0.00002, fixed = false) = 0.000021;
     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            350000)
        annotation (Placement(transformation(extent={{58,-12},{78,8}})));
     BrickerISES.Components.Valve_lin valve(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Afull=k,
        Mdot_nom=0.1,
        Xopen=0.04) annotation (Placement(transformation(extent={{-2,-14},{18,6}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p0=400000,
        T_0=518.15)
        annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

    initial equation
      valve.Mdot = 0.1;

    equation

      connect(sourceP.flange, valve.InFlow) annotation (Line(
          points={{-60.6,-2},{-30,-2},{-30,-4},{-1,-4}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{17,-4},{38,-4},{38,-2},{59.6,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 0.1 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 4% which is 
            <p> the percentage of flow with respect to the nominal one: 2.6*4/100 = 0.1
            
             
</html>"));
    end Size_ValveByPassORC;

    model Size_ValveBMExternal "External valve to bypass the biomass system"
    parameter Real k(start = 0.00002, fixed = false) = 0.000021;
     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            400000)
        annotation (Placement(transformation(extent={{58,-12},{78,8}})));
    BrickerISES.Components.Valve_lin valve(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Afull=k,
        Mdot_nom=0.1,
        Xopen=0.307,
        CheckValve=true)
                    annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p0=450000,
        T_0=481.15)
        annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

    initial equation
      valve.Mdot = 0.8;

    equation

      connect(sourceP.flange, valve.InFlow) annotation (Line(
          points={{-60.6,-2},{-1,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{17,-2},{59.6,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 0.8 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 30.7% which is 
            <p> the percentage of flow with respect to the nominal one: 2.6*30.7/100 = 0.8
            
             
</html>"));
    end Size_ValveBMExternal;

    model Size_ValveBMInternal "External valve to bypass the biomass system"
    parameter Real k(start = 0.00002, fixed = false) = 0.000021;
     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            400000)
        annotation (Placement(transformation(extent={{58,-12},{78,8}})));
    BrickerISES.Components.Valve_lin valve(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Afull=k,
        Mdot_nom=0.1,
        CheckValve=true,
        Xopen=0.8085)
                    annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p0=450000,
        T_0=533.15)
        annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));

    initial equation
      valve.Mdot = 7.6;

    equation

      connect(sourceP.flange, valve.InFlow) annotation (Line(
          points={{-60.6,-2},{-1,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(valve.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{17,-2},{59.6,-2}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),Documentation(info="<html>
            <p>Model to size the valve for solar field bypass
            <p> The mass flow through it is 7.6 kg/s in nominal condition
            <p> The fraction of the valve area open is set to 80.85% which is 
            <p> the percentage of flow with respect to the nominal one: 9.4*80.85/100 = 7.6                         
</html>"));
    end Size_ValveBMInternal;

    model Size_PdropBMin "Pressure drop in the pipes to the biomass boiler"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            400000)
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
        Mdot_0=1.8,
        p=450000,
        T_0=481.15)
        annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

    initial equation
      dP.DELTAp = 0.5e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,6},{40,6},{40,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-51,8},{-30,8},{-30,6},{-7,6}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Size_PdropBMin;

    model Size_PdropBMout "Pressure drop in the pipes at biomass boiler outlet"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            400000)
        annotation (Placement(transformation(extent={{68,-2},{88,18}})));
      ThermoCycle.Components.Units.PdropAndValves.DP dP(
        k=k,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h=0,
        A=5e3)
             annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Mdot_0=1.8,
        p=450000,
        T_0=533.15)
        annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

    initial equation
      dP.DELTAp = 0.5e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-51,8},{-7,8}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Size_PdropBMout;

    model Size_PdropSF "Solar field pressure drop"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            455000)
        annotation (Placement(transformation(extent={{68,-2},{88,18}})));
      ThermoCycle.Components.Units.PdropAndValves.DP dP(
        k=k,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h=0,
        A=5e3)
             annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        Mdot_0=2.5,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p=550000,
        T_0=482.15)
        annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

    initial equation
      dP.DELTAp = 1e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-51,8},{-7,8}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Size_PdropSF;

    model Size_ValveHxOilWater
      "Recirculation valve for the OilWater heat exchanger"

      parameter Real k(start = 0.00002, fixed = false) = 0.000021;
     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
        annotation (Placement(transformation(extent={{58,4},{78,24}})));
     Components.Valve_lin             valve(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Afull=k,
        Xopen=0.5,
        Mdot_nom=3.834)
                    annotation (Placement(transformation(extent={{-2,4},{18,24}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p0=400000,
        T_0=351.15)
        annotation (Placement(transformation(extent={{-80,4},{-60,24}})));

    initial equation
      valve.Mdot = 3.6815;

    equation
      connect(sourceP.flange,valve. InFlow) annotation (Line(
          points={{-60.6,14},{-1,14}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(valve.OutFlow,sinkP1. flangeB) annotation (Line(
          points={{17,14},{59.6,14}},
          color={0,0,255},
          smooth=Smooth.None));

        annotation (   Documentation(info="<html>
    <p>Model to size the recirculation valve for Oil-Water heat exchanger
    <p> The mass flow through it is 3.83 kg/s when the heat exchanger is delivering 40 kW
    <p> The fraction of the valve area open is set to 50% to allow a certain degree of flexibility
            
             
              
 </html>"),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end Size_ValveHxOilWater;

    model Pdrop_ORC "Solar field pressure drop"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=350000)
        annotation (Placement(transformation(extent={{68,-2},{88,18}})));
      ThermoCycle.Components.Units.PdropAndValves.DP dP(
        k=k,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h=0,
        A=5e3)
             annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Mdot_0=2.6,
        p=400000,
        T_0=518.15)
        annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

    initial equation
      dP.DELTAp = 0.5e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-51,8},{-7,8}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Pdrop_ORC;

    model BiomassPump

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
        annotation (Placement(transformation(extent={{-14,-16},{6,4}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h_0=564.9e3,
        UseT=true,
        p0=400000,
        T_0=523.15)
        annotation (Placement(transformation(extent={{-70,14},{-56,28}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            600000)
        annotation (Placement(transformation(extent={{48,12},{64,26}})));
    equation
      connect(sourceP.flange, pump.InFlow) annotation (Line(
          points={{-56.42,21},{-34.21,21},{-34.21,-5.5},{-11.2,-5.5}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pump.OutFlow, sinkP.flangeB) annotation (Line(
          points={{1.6,1.4},{24,1.4},{24,19},{49.28,19}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end BiomassPump;

    model EvaORC
    parameter Real k(start = 0.00002, fixed = false) = 0.000021;
      ThermoCycle.Components.Units.HeatExchangers.Hx1DInc hx1DInc(
        redeclare package Medium2 =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        Mdotnom_sf=2.6,
        Mdotnom_wf=2.5,
        A_sf=16.18*k,
        A_wf=16.18*k,
        N=15,
        pstart_sf=350000,
        pstart_wf=1800000,
        Tstart_inlet_wf=333.15,
        Tstart_outlet_wf=403.15,
        Tstart_inlet_sf=518.15,
        Tstart_outlet_sf=427.15,
        Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal)
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
        annotation (Placement(transformation(extent={{-62,24},{-42,44}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot1(
        redeclare package Medium = ThermoCycle.Media.R245fa_CP,
        Mdot_0=2.5,
        p=100000,
        T_0=333.15)
        annotation (Placement(transformation(extent={{-88,-34},{-68,-14}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare
          package Medium =
                   ThermoCycle.Media.R245fa_CP, p0=1800000)
        annotation (Placement(transformation(extent={{42,-40},{62,-20}})));
    Modelica.SIunits.Power PowerRec = hx1DInc.Summary.Q_sf;
    initial equation
       PowerRec = 563e3;

    equation
      connect(sourceMdot.flangeB, hx1DInc.inlet_fl2) annotation (Line(
          points={{41,46},{50,46},{50,10.1538},{3.84615,10.1538}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sinkP.flangeB, hx1DInc.outlet_fl2) annotation (Line(
          points={{-60.4,34},{-78,34},{-78,9.81538},{-33.8462,9.81538}},
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

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics),
        experiment(StopTime=1000),
        __Dymola_experimentSetupOutput);
    end EvaORC;

    model Size_PdropORC "Solar field pressure drop"
      parameter Real k(start = 0.02, fixed = false) = 0.021;

     ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP1(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP, p0=
            350000)
        annotation (Placement(transformation(extent={{68,-2},{88,18}})));
      ThermoCycle.Components.Units.PdropAndValves.DP dP(
        k=k,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h=0,
        A=5e3)
             annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
        Mdot_0=2.5,
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        p=400000,
        T_0=424.15)
        annotation (Placement(transformation(extent={{-70,-2},{-50,18}})));

    initial equation
      dP.DELTAp = 1e5;

    equation
      connect(dP.OutFlow, sinkP1.flangeB) annotation (Line(
          points={{11,8},{69.6,8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sourceMdot.flangeB, dP.InFlow) annotation (Line(
          points={{-51,8},{-7,8}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Size_PdropORC;

    model HxWaterOilPump

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
        p_su_start=400000)
        annotation (Placement(transformation(extent={{-14,-16},{6,4}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SourceP sourceP(
        redeclare package Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
        h_0=564.9e3,
        UseT=true,
        p0=350000,
        T_0=351.15)
        annotation (Placement(transformation(extent={{-70,14},{-56,28}})));
      ThermoCycle.Components.FluidFlow.Reservoirs.SinkP sinkP(redeclare package
          Medium =
            ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
          p0=400000)
        annotation (Placement(transformation(extent={{48,12},{64,26}})));
    equation
      connect(sourceP.flange, pump.InFlow) annotation (Line(
          points={{-56.42,21},{-34.21,21},{-34.21,-5.5},{-11.2,-5.5}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pump.OutFlow, sinkP.flangeB) annotation (Line(
          points={{1.6,1.4},{24,1.4},{24,19},{49.28,19}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end HxWaterOilPump;
  end SizingSimpleValve;
end Layout_I;
