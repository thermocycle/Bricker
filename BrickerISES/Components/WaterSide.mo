within BrickerISES.Components;
package WaterSide
  model WaterCircuit
    import Modelica.SIunits;
  replaceable package Medium =
       ThermoCycle.Media.DummyFluid constrainedby
      Modelica.Media.Interfaces.PartialMedium
      "Medium model secondary fluid - Incompressible Fluid"                                                                                                     annotation (choicesAllMatching = true);

    Modelica.Blocks.Interfaces.RealInput Q_Heating
      annotation (Placement(transformation(extent={{128,40},{88,80}})));
    Modelica.Blocks.Interfaces.RealInput Q_Cooling
      annotation (Placement(transformation(extent={{130,-100},{90,-60}})));
    Modelica.Blocks.Interfaces.RealInput Q_HX
      annotation (Placement(transformation(extent={{-130,38},{-90,78}})));
    Modelica.Blocks.Interfaces.RealInput Q_ORC
      annotation (Placement(transformation(extent={{-130,-80},{-90,-40}})));
    Modelica.Blocks.Interfaces.RealOutput m_to_Hx annotation (Placement(
          transformation(
          extent={{23,23},{-23,-23}},
          rotation=90,
          origin={-5,-105})));
    Modelica.Blocks.Interfaces.RealOutput T_to_Hx annotation (Placement(
          transformation(
          extent={{23,23},{-23,-23}},
          rotation=90,
          origin={41,-103})));

  parameter Real COP = 0.6 "COP adsorption chiller";
  parameter SIunits.MassFlowRate m_orc = 10.41
      "Mass flow through the ORC condenser";
  Medium.ThermodynamicState fluidState_avg;
  Medium.SpecificHeatCapacity cp_avg;
  Medium.Temperature T_avg;
  Medium.SpecificEnthalpy h_60;
  Medium.SpecificEnthalpy h_70;
  Medium.SpecificEnthalpy h_to_hx(start = 355575);
  SIunits.MassFlowRate m_res(start = 0.01);
  SIunits.Power Q_hot_residue(start = 387e3);

  equation
    T_avg = 65+273.15;
    fluidState_avg = Medium.setState_pT(3e5,T_avg);
    cp_avg = Medium.specificHeatCapacityCp(fluidState_avg);
    h_60 = Medium.specificEnthalpy_pT(3e5,60+273.15);
    h_70 = Medium.specificEnthalpy_pT(3e5,70+273.15);

    Q_hot_residue = Q_ORC + Q_HX - Q_Cooling/COP;
     // m_res= smoooth(1, noEvent(if Q_hot_residue > 0 then 0.01 else -Q_hot_residue/(
     // 10*cp_avg)));
    //m_res
    m_to_Hx = m_orc + m_res;
    m_res*h_60 + m_orc*h_70 = (m_orc+m_res) * h_to_hx;
    T_to_Hx = Medium.temperature_ph(3e5, h_to_hx);
  initial equation
    m_res = 0.01;
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end WaterCircuit;
end WaterSide;
