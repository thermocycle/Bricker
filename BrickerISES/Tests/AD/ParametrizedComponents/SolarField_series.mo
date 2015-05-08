within BrickerISES.Tests.AD.ParametrizedComponents;
model SolarField_series

  /* Component Descriptions */

  // Thermal Oil = Therminol SP
  // DNI = 800
  // Theta = 0
  // v_wind = 0
  // T_amb = 25+273.15
// Solar field parametrized to heat the thermal oil from 156 °C to 188.7 °C --> 30% of needed energy.. Use for Solar and Biomass in series

extends ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc(
    N=5,
    Nt=5,
    Ns=1,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_24
      CollectorGeometry,
    Mdotnom=1.65,
    Unom=2000,
    Tstart_inlet=429.15,
    Tstart_outlet=461.15,
    pstart=150000);

end SolarField_series;
