within BrickerISES.Tests.FA;
model TestFluidTherminol66

  replaceable package Medium =
      ThermoCycle.Media.Incompressible.IncompressibleTables.Therminol66
    constrainedby Modelica.Media.Interfaces.PartialMedium
    "Medium model - Incompressible Fluid" annotation (choicesAllMatching=true);

  parameter Modelica.SIunits.Pressure pstart=1e5 "Fluid pressure start value"
    annotation (Dialog(tab="Initialization"));

  parameter Medium.Temperature Tstart_hot=273.15 + 200
    annotation (Dialog(tab="Initialization"));
  parameter Medium.Temperature Tstart_cold=273.15 + 100
    annotation (Dialog(tab="Initialization"));

  final parameter Medium.SpecificEnthalpy hstart_hot=
      Medium.specificEnthalpy_pTX(
      pstart,
      Tstart_hot,
      fill(0, 0)) "Start value of hot volume enthalpy";
  final parameter Medium.SpecificEnthalpy hstart_cold=
      Medium.specificEnthalpy_pTX(
      pstart,
      Tstart_cold,
      fill(0, 0)) "Start value of hot volume enthalpy";

  /* VARIABLES */
  Medium.AbsolutePressure p(start=pstart) "Pressure of the fluid in the tank";
  //unica per tutti e due i volumi
  Medium.ThermodynamicState fluidState_hot
    "Thermodynamic state of the hot fluid";
  Medium.ThermodynamicState fluidState_cold
    "Thermodynamic state of the cold fluid";
  Medium.Density rho_hot "Fluid nodal density";
  Medium.Density rho_cold "Fluid nodal density";
  Medium.Temperature T_hot "Fluid temperature";
  Medium.Temperature T_cold "Fluid temperature";
  //
  Real DER_rho_cold "Fluid derivative rho density";

  Modelica.SIunits.SpecificEnthalpy h_hot(start=hstart_hot)
    "enthalpy in the hot volume";
  Modelica.SIunits.SpecificEnthalpy h_cold(start=hstart_cold)
    "enthalpy in the cold volume";

equation
  p = 1e5;
  h_hot = hstart_hot;
  h_cold = hstart_cold + 10*time;

  fluidState_hot = Medium.setState_ph(p, h_hot);
  T_hot = Medium.temperature(fluidState_hot);
  rho_hot = Medium.density(fluidState_hot);

  fluidState_cold = Medium.setState_ph(p, h_cold);
  T_cold = Medium.temperature(fluidState_cold);
  rho_cold = Medium.density(fluidState_cold);

  //tests
  DER_rho_cold = Medium.density_derh_p(fluidState_cold)*der(h_cold);

  annotation (
    experiment(StopTime=1000, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(
          extent={{-72,74},{72,-78}},
          lineColor={0,0,255},
          fillColor={0,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics));
end TestFluidTherminol66;
