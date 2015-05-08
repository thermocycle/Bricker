within BrickerISES.Tests.AD.ParametrizedComponents;
model SolarField_parallel
  /* Component Descriptions */

  // Thermal Oil = Therminol SP
  // DNI = 800
  // Theta = 0
  // v_wind = 0
  // T_amb = 25+273.15
// Solar field parametrized to heat the thermal oil from 156 °C to 265 °C --> 100% of needed energy. Use for solar and biomass in parallel

extends ThermoCycle.Components.Units.Solar.SolarField_Soltigua_Inc(
N=5,Nt=2,
    Ns=15,
redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
redeclare
      ThermoCycle.Components.HeatFlow.Walls.SolarAbsorber.Geometry.Soltigua.PTMx_18
      CollectorGeometry,
Mdotnom=1.65,
    Unom=2000,
    Tstart_inlet=428.15,
    Tstart_outlet=538.15,
    pstart=150000);

end SolarField_parallel;
