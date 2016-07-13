within BrickerISES.Components.Chiller;
model Chiller_v2

  Modelica.Blocks.Interfaces.RealOutput Tex
    annotation (Placement(transformation(extent={{-94,-96},{-126,-64}})));
  Modelica.Blocks.Interfaces.RealInput Tsu
    annotation (Placement(transformation(extent={{-126,60},{-86,100}})));
  Modelica.Blocks.Interfaces.RealInput mdotsu
    annotation (Placement(transformation(extent={{-126,8},{-86,48}})));
  Modelica.Blocks.Interfaces.RealInput Q_td
    annotation (Placement(transformation(extent={{128,18},{88,58}})));

/* Define Fluid Medium */
replaceable package Medium = ThermoCycle.Media.DummyFluid constrainedby
    Modelica.Media.Interfaces.PartialMedium
annotation (choicesAllMatching = true);

parameter Real DT = 10 "Temperature glide in the desorption mechanism";
parameter Boolean CpConst = true "Set true for constant heat capacity";
parameter Modelica.SIunits.Temperature T_start_su
    "Initial value for the temperature at the inlet";
parameter Modelica.SIunits.MassFlowRate m_start
    "Initial value for the mass flow rate";
final parameter Real phx = 1E5 "pressure of water from the heat exchanger";
Modelica.SIunits.Power Q_hx "Thermal power provided by the heat exchanger";
Modelica.SIunits.Power Q_hr "Thermal power required by the desorption process";
Modelica.SIunits.Power Q_chill "Thermal power provided for chilling water";
Modelica.SIunits.SpecificHeatCapacity Cp "Specific heat capacity";

Modelica.SIunits.Temperature T_supply(start = T_start_su);
Modelica.SIunits.MassFlowRate m_dot_su(start = m_start);

equation
T_supply = Tsu;
m_dot_su = mdotsu;

    Cp = 4000;

  Tex = T_supply - DT;
  Q_hx = m_dot_su*Cp*(T_supply-Tex);

  /* Chiller capacity adapted from performance curve from manufacturer */
  Q_chill = (4.17363223e-05*(T_supply-273.15)^5  -1.57415006e-02*(T_supply-273.15)^4 +  2.36812559e+00*(T_supply-273.15)^3  -1.77791313e+02*(T_supply-273.15)^2 +
   6.67432803e+03*(T_supply-273.15)  -1.00257699e+05)*1E3;
  /* Heat required capacity adapted from performance curve from manufacturer */
  Q_hr =  (-8.48588183e-06*(T_supply-273.15)^5 +  3.17249792e-03*(T_supply-273.15)^4  -4.70023746e-01*(T_supply-273.15)^3 +   3.42845771e+01*(T_supply-273.15)^2
  -1.21472820e+03*(T_supply-273.15)   + 1.67250565e+04)*1E3;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255})}));
end Chiller_v2;
