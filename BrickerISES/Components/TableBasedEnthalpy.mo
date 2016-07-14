within BrickerISES.Components;
model TableBasedEnthalpy
  replaceable package MediumPs =
      ThermoCycle.Media.Incompressible.IncompressibleTables.TherminolSP                            constrainedby
    Modelica.Media.Interfaces.PartialMedium "Working fluid primary side" annotation (choicesAllMatching=true);

MediumPs.ThermodynamicState stateIn_ps;
parameter MediumPs.AbsolutePressure pressure = 10;
parameter MediumPs.Temperature Temperature = 100+273.15;

MediumPs.SpecificEnthalpy Enthalpy;
equation
stateIn_ps = MediumPs.setState_pT(pressure,Temperature);
Enthalpy = MediumPs.specificEnthalpy(stateIn_ps);
end TableBasedEnthalpy;
