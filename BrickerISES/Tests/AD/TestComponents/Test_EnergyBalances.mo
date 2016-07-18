within BrickerISES.Tests.AD.TestComponents;
model Test_EnergyBalances
  import Modelica.SIunits;
  replaceable package Medium =
    ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP;

    parameter SIunits.VolumeFlowRate V_orc = 13/3600;
    parameter SIunits.Temperature  T_orc_su=225+273.15;
    parameter SIunits.Temperature T_orc_ex=156+273.15;
    final parameter SIunits.Temperature T_orc_avg = (T_orc_su + T_orc_ex)/2;
    SIunits.MassFlowRate m_orc;
    Medium.ThermodynamicState fluidState;
    Medium.Density rho;
    Medium.SpecificHeatCapacity cp;
    SIunits.Power Q_eva;
equation
  fluidState = Medium.setState_pTX(1e5,T_orc_avg,fill(0,0));
  rho = Medium.density(fluidState);
  cp= Medium.specificHeatCapacityCp(fluidState);
  m_orc = V_orc*rho;
  Q_eva = m_orc*cp*(T_orc_su - T_orc_ex);

end Test_EnergyBalances;
