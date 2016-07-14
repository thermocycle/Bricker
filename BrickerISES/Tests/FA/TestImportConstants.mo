within BrickerISES.Tests.FA;
model TestImportConstants
  import BrickerISES.Constants;
  Modelica.SIunits.Acceleration aa;
equation
  aa = Constants.rho_Therminol66;

end TestImportConstants;
