within BrickerISES.Components.Biomass.BiomassTypes;
record ItalianChip
  // Chip price from Costi di produzione di energia elettrica da fonti rinnovabili politecnico di milano
  extends BaseFuel(
  HE = 13e6,
  Price = 0.538);
end ItalianChip;
