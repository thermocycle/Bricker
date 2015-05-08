within BrickerISES.Tests.AD.ParametrizedComponents;
model OpenTank

extends ThermoCycle.Components.Units.Tanks.OpenTank(
redeclare package Medium =
        ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP,
    H_D=2.5,
    V_tank=5,
    L_lstart=0.6,
    Mdotnom=1.65,
    p_ext=150000,
    Tstart=493.15,
    pstart=150000);

end OpenTank;
