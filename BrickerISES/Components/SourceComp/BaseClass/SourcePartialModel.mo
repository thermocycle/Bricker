within BrickerISES.Components.SourceComp.BaseClass;
partial model SourcePartialModel "Partial Model for BRICKER Source"

  output Modelica.SIunits.Irradiance dni "Direct Normal Insolation (W/m2)";
  output Modelica.SIunits.Temperature Tambient "Ambient temperature (K)";
  output Modelica.SIunits.Power Qbuilding "Thermal demande from building (W)";
  output Real hours "Hour";

end SourcePartialModel;
