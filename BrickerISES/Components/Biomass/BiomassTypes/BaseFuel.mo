within BrickerISES.Components.Biomass.BiomassTypes;
record BaseFuel
  parameter Modelica.SIunits.SpecificEnergy HE= 13e6 "Heat of combustion J/kg";
  parameter Real Price = 0.07 "Cost of Biomass euro/kg";
end BaseFuel;
