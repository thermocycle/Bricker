within BrickerISES.Tests.AD.ParametrizedComponents;
model Evaporator
extends ThermoCycle.Components.Units.HeatExchangers.Hx1DInc(
redeclare package Medium2 =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    redeclare package Medium1 = ThermoCycle.Media.R245fa_CP,
    Discretization=ThermoCycle.Functions.Enumerations.Discretizations.upwind_AllowFlowReversal,
N=10,
Mdotnom_sf = 1.65,
Mdotnom_wf = 1.9,
A_sf = 19.2,
A_wf = 19.2,
Unom_sf = 2000,
Unom_l = 3000,
Unom_tp = 3000,
Unom_v = 3000,
pstart_sf = 1.5e5,
pstart_wf = 35e5,
Tstart_inlet_wf = 135+273.15,
Tstart_outlet_wf = 250+273.15,
Tstart_inlet_sf = 265+273.15,
Tstart_outlet_sf = 165+273.15);

end Evaporator;
