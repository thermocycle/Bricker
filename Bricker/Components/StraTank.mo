within Bricker.Components;
model StraTank

  replaceable package Medium = CoolProp2Modelica.Media.WaterTPSI_FP constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (choicesAllMatching = true);
  parameter Integer N(min=4) "Number of nodes for thermal variables";

/********************** PORTS ****************************************/
ThermoCycle.Interfaces.Fluid.FlangeA portHotSF(redeclare package Medium = Medium)
   annotation (Placement(transformation(extent={{-68,70},{-48,90}}),
        iconTransformation(extent={{-90,85},{-82,93}})));
 ThermoCycle.Interfaces.Fluid.FlangeA portColdPW(redeclare package Medium = Medium)
   annotation (Placement(transformation(extent={{60,-68},{80,-48}}),
        iconTransformation(extent={{80,-95},{86,-87}})));
 ThermoCycle.Interfaces.Fluid.FlangeB  portHotPW(redeclare package Medium = Medium)
   annotation (Placement(transformation(extent={{60,70},{80,90}}),
        iconTransformation(extent={{81,86},{88,94}})));
 ThermoCycle.Interfaces.Fluid.FlangeB portColdSF(redeclare package Medium = Medium)
   annotation (Placement(transformation(extent={{-60,-70},{-40,-50}}),
        iconTransformation(extent={{-88,-95},{-80,-87}})));

  Modelica.Blocks.Interfaces.RealInput T_env
    annotation (Placement(transformation(extent={{-124,-10},{-84,30}}),
        iconTransformation(extent={{-76,-9},{-66,1}})));

  parameter Modelica.SIunits.MassFlowRate wnomIN
  annotation(Dialog(tab = "Initialisation"));
  parameter Modelica.SIunits.MassFlowRate wnomOUT
  annotation(Dialog(tab = "Initialisation"));
  parameter Medium.Temperature Tstart[N-1]
  annotation(Dialog(tab = "Initialisation"));
  final parameter Modelica.SIunits.SpecificEnthalpy hstart[N - 1]=Medium.specificEnthalpy_pT(
     p*ones(N-1),Tstart)
    "Start value of enthalpy vector (initialized by default)";
  /*parameter Modelica.SIunits.CoefficientOfHeatTransfer G; */
  parameter Modelica.SIunits.Volume Vlstart "Liquid volume start value";
  parameter Modelica.SIunits.Pressure p "Pressure of the fluid in the tank";
  parameter Modelica.SIunits.MassFlowRate wnom[N]=linspace(wnomIN,wnomOUT,N)
    "Mass flow rate start value";
  parameter Modelica.SIunits.ThermalConductivity k_fluid
    "Fluid thermal conductivity";
  parameter Modelica.SIunits.ThermalConductivity k_wall
    "Wall thermal conductivity";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_env_bottom
    "Overall heat transfer coefficient refered to the bottom of the tank";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_env_wall
    "Overall heat transfer coefficient refered to tank wall";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U_env_top
    "Overall heat transfer coefficient refered to the top of the tank";
  parameter Modelica.SIunits.Volume V_tank "Tank volume";
  parameter Real H_D "Height to diameter ratio";
  parameter Modelica.SIunits.Position d_met "Thickness of metal";
  constant Real pi= Modelica.Constants.pi;

  /* VARIABLES */
  Medium.ThermodynamicState fluidState[N - 1]
    "Thermodynamic state of the fluid at the nodes";
  Medium.Density rho[N - 1] "Fluid nodal density";
  Medium.Temperature T[N - 1] "Fluid temperature";
  Modelica.SIunits.DerDensityByEnthalpy drdh[N - 1]
    "Derivative of density by enthalpy";
  Modelica.SIunits.Volume Vl(start=Vlstart, stateSelect=StateSelect.prefer);
  Modelica.SIunits.Volume V[N - 1] "Volume of a single cell";
  Modelica.SIunits.Length H_vol[N-1]
    "Height of the middle part of the cell from the bottom";
  Modelica.SIunits.Mass M[N - 1] "Mass of a single cell";
  Modelica.SIunits.MassFlowRate w[N](start=wnom) "mass at the nodes";
  Real dM_dt[N - 1];
  Real dE_dt[N - 1];
  Modelica.SIunits.Mass Mtot;

  /* VARIABLES : ENTHALPIES */
  Medium.SpecificEnthalpy htilde[N - 1](start=hstart)
    "Enthalpy at the center of the volume";
  Modelica.SIunits.SpecificEnthalpy h_low[N - 3]
    "enthalpy at the node below the volume";
  Modelica.SIunits.SpecificEnthalpy h_high[N - 3]
    "enthalpy at the node above the volume";
 Modelica.SIunits.SpecificEnthalpy h_top
    "incoming/outgoing enthalpy at the top volume";
Modelica.SIunits.SpecificEnthalpy h_down
    "incoming/outgoing enthalpy at the bottom voluem";

  /* VALUES OF ENTHALPIES AND MASS FLOW AT THE 4 PORTS*/
  Modelica.SIunits.SpecificEnthalpy h_cold_PW
    "enthalpy of the cold stream from Power plant";
  Modelica.SIunits.SpecificEnthalpy h_cold_SF
    "enthalpy of the cold stream to Solar Field";
  Modelica.SIunits.SpecificEnthalpy h_hot_PW
    "enthalpy of the hot stream to the Power Plant";
  Modelica.SIunits.SpecificEnthalpy h_hot_SF
    "enthalpy of the hot stream from the Solar Field";
  Modelica.SIunits.MassFlowRate w_cold_PW
    "Mass flow rate of the cold stream from the power plant";
  Modelica.SIunits.MassFlowRate w_cold_SF
    "Mass flow rate of the cold stream to the solar field";
  Modelica.SIunits.MassFlowRate w_hot_PW
    "Mass flow rate of the hot stream to the power plant";
  Modelica.SIunits.MassFlowRate w_hot_SF
    "Mass flow rate of the hot stream from the solar field";

  /* HEAT TRANSFER */
  Modelica.SIunits.ThermalConductance G_fluid[N-2]
    "Fluid thermal conductance and heat conduction through the tank wall";
  Modelica.SIunits.ThermalConductance G_env_wall[N-1]
    "Thermal conductance for the heat losses to the environment through the tank wall";
  Modelica.SIunits.ThermalConductance G_env_top
    "Thermal conductance for the heat losses to the environment through the tank roof";
  Modelica.SIunits.ThermalConductance G_env_bottom
    "Thermal conductance for the heat losses to the environment through the tank base";
  Modelica.SIunits.Length r_int "Internal radius";
  Modelica.SIunits.ThermalConductivity K_wall
    "Modified thermal conductivity for the conduction through the tank wall";
  Modelica.SIunits.Length H[N-2]
    "Distance between the center cell of the fluid volume i and i+1";
  Modelica.SIunits.Area A_tank "Area of the tank base";

equation
  r_int = ((V_tank/(H_D)*4/pi)^(1/3))/2;
  A_tank = pi*r_int^2;
  K_wall = k_wall/(r_int^2)*((r_int+d_met)^2-r_int^2);

  H_vol[1] = V[1]/(A_tank)*0.5;
  for i in 2:N-1 loop
  H_vol[i] = H_vol[i-1] + V[i-1]/(A_tank)*0.5 + V[i]/(A_tank)*0.5;
  end for;

  for i in 1:N-1 loop

   V[i] = 1/(N-1)*Vl;
   M[i] = V[i]*rho[i];

  end for;

  /* THERMAL CONDUCTANCES */
  /* Fluid conductance */

  for i in 1:N-2 loop

  H[i] = (V[i]+V[i+1])/A_tank/2;
  G_fluid[i] = (k_fluid + K_wall)*A_tank/H[i];

  end for;

  /* Env_wall conductance*/
  for i in 1:N-1 loop

  G_env_wall[i] = 2*pi*r_int*V[i]/A_tank*U_env_wall;

  end for;

  /* Top_wall and Bottom_wall conductances */
  G_env_top = A_tank*U_env_top;
  G_env_bottom = A_tank*U_env_bottom;

  /* MASS AND ENERGY BALANCE FOR THE VOLUMES IN THE MIDDLE*/

  for i in 2:N-2 loop

    dM_dt[i] = w[i] - w[i + 1];
    dM_dt[i] = rho[i]*der(V[i]) + V[i]*(drdh[i]*der(htilde[i])) "Mass balance";
    dE_dt[i] = w[i]*h_low[i - 1] - w[i + 1]*h_high[i - 1] + G_fluid[i]*(T[i + 1] - T[i])
               - G_fluid[i-1]*(T[i] - T[i-1]) - G_env_wall[i]*(T[i] - T_env);
    dE_dt[i] = M[i]*der(htilde[i]) + htilde[i]*dM_dt[i] - p*der(V[i])
      "energy balance";

  end for;

  for
   i in 1:N-3 loop

    h_low[i] = if w[i + 1] > 0 then htilde[i] else htilde[i + 1];
    h_high[i] = if w[i + 2] > 0 then htilde[i + 1] else htilde[i + 2];

  end for;

  Mtot = sum(M);

  /* Bottom volume [1] */
  dM_dt[1] = w_cold_PW + w_cold_SF - w[2];
  dM_dt[1] = rho[1]*der(V[1]) + V[1]*drdh[1]*der(htilde[1]);

dE_dt[1] = w_cold_PW * h_cold_PW + w_cold_SF * h_cold_SF - w[2] * h_down + G_fluid[1]*(T[2]-T[1]) - G_env_wall[1]*(T[1] - T_env)
           - G_env_bottom*(T[1] - T_env);
dE_dt[1] = M[1] *der(htilde[1]) + htilde[1] * dM_dt[1] - p*der(V[1]);
h_down = if w[2] > 0 then htilde[1] else htilde[2];

  /*Top volume [N-1] */
  dM_dt[N - 1] = w[N - 1] + (w_hot_SF + w_hot_PW);
  dM_dt[N - 1] = rho[N - 1]*der(V[N - 1]) + V[N - 1]*drdh[N - 1]*der(htilde[N-1]);

dE_dt[N-1] = w[N-1] * h_top + (w_hot_SF *h_hot_SF + w_hot_PW * h_hot_PW) - G_fluid[N-2]*(T[N-1] -T[N-2]) - G_env_wall[N-1]*(T[N-1] - T_env)
           - G_env_top*(T[N-1] - T_env);
dE_dt[N-1] = M[N-1] *der(htilde[N-1]) + htilde[N-1]*dM_dt[N-1] - p*der(V[N-1]);
h_top = if w[N-1]>0 then htilde[N-2] else htilde[N-1];

  // Fluid property calculations
  for
   i in 1:N-1 loop
    fluidState[i] = Medium.setState_ph(p, htilde[i]);
    T[i] = Medium.temperature(fluidState[i]);
    rho[i] = Medium.density(fluidState[i]);
    drdh[i] = Medium.density_derh_p(fluidState[i]);
  end for;

  w[1] = w_cold_PW + w_cold_SF;
  w[N] = (w_hot_PW + w_hot_SF);

  /*BOUNDARY CONDITION */
  /* Enthalpies */
  portColdSF.h_outflow = htilde[1];
  portColdPW.h_outflow = htilde[1];
  portHotSF.h_outflow = htilde[N-1];
  portHotPW.h_outflow = htilde[N-1];

  h_cold_SF = portColdSF.h_outflow;
  h_cold_PW = inStream(portColdPW.h_outflow);
  h_hot_PW = portHotPW.h_outflow;
  h_hot_SF = inStream(portHotSF.h_outflow);

  /*Mass Flow Rate */
  w_cold_PW = portColdPW.m_flow;
  w_cold_SF = portColdSF.m_flow;
  w_hot_PW = portHotPW.m_flow;
  w_hot_SF =  portHotSF.m_flow;

  /* pressure */
  portColdPW.p = p;
  portColdSF.p = p;
  portHotPW.p = p;
  portHotSF.p = p;

 annotation (Diagram(graphics), Icon(graphics={
        Rectangle(
          extent={{-70,100},{70,-4}},
          lineColor={255,0,0},
          lineThickness=1,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,0,0}),
        Rectangle(
          extent={{-70,-4},{70,-98}},
          lineColor={0,0,255},
          lineThickness=1,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,0,255}),
        Line(
          points={{-60,-70},{-44,-70}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{-76,112},{66,98}},
          lineColor={0,0,255},
          textString="Tank"),
        Line(
          points={{-82,89},{-70,89}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-80,-91},{-68,-91}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{70,-91},{82,-91}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{70,89},{82,89}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5)}));
end StraTank;
