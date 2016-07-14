within BrickerISES.Components.Tank;
function h_function1 "test function for the h calculation in ConvectiveWall"

  input Modelica.SIunits.Temperature T_int;
  input Modelica.SIunits.Temperature T_ext;
  output Modelica.SIunits.CoefficientOfHeatTransfer h;

algorithm
  h:= 1/3 * (T_int^2 - T_ext^2);

end h_function1;
