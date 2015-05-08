within BrickerISES.Tests.AD.ParametrizedComponents;
model Pump_solar
extends ThermoCycle.Components.Units.ExpansionAndCompressionMachines.Pump(
    redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    PumpInput = ThermoCycle.Functions.Enumerations.PumpInputs.FF,
    f_pp0=30,
    X_pp0=1,
    hstart=262000,
    V_dot_max=0.002216667,
    M_dot_start=2.00);
equation

end Pump_solar;
