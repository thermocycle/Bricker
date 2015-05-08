within BrickerISES.Tests.AD.ParametrizedComponents;
model SimpleBiomassBoiler_Parallel
  // mass flow = 1.65 Kg/s
  // Q_in = 335000 J
  // Simple Biomass boiler to heat up the fluid from 188 °C to 265 °C. To be used in case of parallel system.

extends BrickerISES.Components.Biomass.SimpleBiomassBoiler(
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
    Unom_f=2000,
    pstart_f=150000,
    Tstart_inlet_f=188 + 273.15,
    Tstart_outlet_f=265 + 273.15,
    Mdotnom_f=1.65);

end SimpleBiomassBoiler_Parallel;
