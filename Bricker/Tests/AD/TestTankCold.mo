within Bricker.Tests.AD;
model TestTankCold

  Modelica.Blocks.Sources.Constant const(k=30 + 273.15)
    annotation (Placement(transformation(extent={{-80,12},{-60,32}})));
 Bricker.Components.StraTank  tank_7h_cold(redeclare package Medium =
        CoolProp2Modelica.Media.WaterTPSI_FP,
  N=31, Tstart=(202 + 273.15)
        *ones(30),
    Vlstart=36.7,
    k_fluid=0.039333856,
    k_wall=32,
    U_env_bottom=0,
    wnomIN=2.7766,
    wnomOUT=2.7766,
    U_env_wall=0,
    U_env_top=0,
    V_tank=56,
    H_D=3,
    d_met=0.004763,
    p=1519700)
    annotation (Placement(transformation(extent={{-38,-24},{42,70}})));
  ThermoCycle.Components.FluidFlow.Reservoirs.SourceMdot sourceMdot(
    Mdot_0=2.7766,
    UseT=false,
    h_0=3.03e6,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    p=1519700)
    annotation (Placement(transformation(extent={{-92,58},{-72,78}})));
 Bricker.Components.SinkMdot sinkMdot(
    Mdot_0=2.7766,
    h_0=2.8e6,
    redeclare package Medium = CoolProp2Modelica.Media.WaterTPSI_FP,
    pstart=1519700)
    annotation (Placement(transformation(extent={{-82,-48},{-102,-28}})));
equation
  connect(const.y, tank_7h_cold.T_env) annotation (Line(
      points={{-59,22},{-40,22},{-40,21.12},{-26.4,21.12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceMdot.flangeB, tank_7h_cold.portHotSF) annotation (Line(
      points={{-73,68},{-52,68},{-52,64.83},{-32.4,64.83}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinkMdot.flangeB, tank_7h_cold.portColdSF) annotation (Line(
      points={{-82.2,-38},{-53.9,-38},{-53.9,-19.77},{-31.6,-19.77}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics),
    experiment(
      StartTime=-4000,
      StopTime=0,
      Tolerance=1e-006),
    __Dymola_experimentSetupOutput);
end TestTankCold;
