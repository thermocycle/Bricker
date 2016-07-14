within BrickerISES.Components.ORC;
model TestCorrelation
  parameter Modelica.SIunits.Temperature T_sf_su= 245 + 273.15;
  parameter Modelica.SIunits.Temperature T_cf_su=60 +273.15;
  Modelica.SIunits.Temperature T_sf_ex;
equation

T_sf_ex=T_sf_su^2*(-0.002356)+T_cf_su^2*(0.000233)+T_sf_su*T_cf_su*(0.003018)+T_sf_su*(1.374736)+T_cf_su*(-0.33243)+(-48.022193);
end TestCorrelation;
