within BrickerISES.Tests.AD.ParametrizedComponents;
model BioMassSystem

extends BrickerISES.Components.Biomass.SimpleBiomassSystemCombustionDynamic_AD(
    redeclare model combustionDynamic =
        BrickerISES.Components.Biomass.CombustionDynamic.CostantPowerCombustion,
    redeclare package Medium1 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.centr_diff_AllowFlowReversal,
    Mdotnom_f=11,
    V_dot_max=0.0166,
    BoilerEfficiency=0.9,
    Qcombustion_Nominal=5e5,
    Qcombustion_Min=5e5,
    Qcombustion_start=5e5,
    pstart_f=150000,
    Tstart_inlet_f=461.15,
    Tstart_outlet_f=473.15);

end BioMassSystem;
