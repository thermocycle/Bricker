within BrickerISES.Components.AM.AmbientConditions_External_OLD;
function interpolateAmbientConditions
  input AmbientConditionsTable conditions;
  input Real t;
  output Real dni;
  output Real ghi;
  output Real dhi;
  output Real temp;
  output Real ws;
  output Real wd;
  output Real rh;
  output Real atmp;
  output Real date[6];
  output Real sunPos[4];

  external "C" interpolateAmbientConditions(conditions, t, dni, ghi, dhi, temp, ws, wd, rh, atmp, date, sunPos) annotation(Library="AmbientConditions");
end interpolateAmbientConditions;
