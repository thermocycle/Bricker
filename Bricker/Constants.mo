within Bricker;
package Constants "Constants package"

  final constant Modelica.SIunits.Acceleration g=Modelica.Constants.g_n
    "Constant gravity acceleration";
  final constant Real k(final unit="J/K") = 1.3806505e-23 "Boltzmann constant";
  final constant Real R(final unit="J/(mol.K)") = 8.314472 "Molar gas constant";
  final constant Real sigma(final unit="W/(m2.K4)") = 5.670400e-8
    "Stefan-Boltzmann constant";
  final constant Real N_A(final unit="1/mol") = 6.0221415e23
    "Avogadro constant";

  final constant Real pi =           Modelica.Constants.pi "Value of Pi";
  final constant Real halfPi =       Modelica.Constants.pi/2 "Value of Pi/2";
  final constant Real infinite =     Modelica.Constants.inf
    "Value for infinite";
  final constant Real eps =          Modelica.Constants.eps
    "Smallest value such that 1.0 + eps != 1.0";

end Constants;
