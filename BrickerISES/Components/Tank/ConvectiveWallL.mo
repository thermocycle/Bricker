within BrickerISES.Components.Tank;
model ConvectiveWallL
  "Lumped thermal element for heat convection (Q_tot = h*A*dT)"
  //VARIABLES

import BrickerISES.Components.Enumerations.ConvectiveWall;
parameter ConvectiveWall Convection=ConvectiveWall.Insulated
    "Convective Heat Transfer for the Wall, h [W/m^2.K]";

  Modelica.SIunits.HeatFlowRate Q_tot "Heat flow rate from solid -> fluid";
  Modelica.SIunits.TemperatureDifference dT "= solid.T - fluid.T";
  Modelica.SIunits.CoefficientOfHeatTransfer h
    "heat transfer coefficient [W/m^2.K]";
        //PARAMETERS
  parameter Modelica.SIunits.Area  A "total area for convective heat exchange";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer h_constant=1000
    "heat transfer coefficient to set for Constant case [W/m^2.K]";

  ThermoCycle.Interfaces.HeatTransfer.ThermalPortL thermalPortL_int
    annotation (Placement(transformation(extent={{80,-10},{100,10}}),
        iconTransformation(extent={{-74,-10},{74,10}},
        rotation=90,
        origin={90,-6})));

          ThermoCycle.Interfaces.HeatTransfer.ThermalPortL thermalPortL_ext
    annotation (Placement(transformation(extent={{-100,-12},{-80,8}}),
        iconTransformation(extent={{-74,-10},{74,10}},
        rotation=90,
        origin={-90,-6})));

equation
 dT = thermalPortL_int.T - thermalPortL_ext.T;
 thermalPortL_int.phi=h*dT;
  thermalPortL_ext.phi=thermalPortL_int.phi;
  Q_tot=h*A*dT;

  // set h
  if (Convection == ConvectiveWall.Constant) then
h=h_constant;
elseif (Convection == ConvectiveWall.h_function1) then
 h=h_function1(thermalPortL_int.T, thermalPortL_ext.T);

else
 h=0;

  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                   graphics={Rectangle(
          extent={{-80,70},{80,-80}},
          lineColor={175,175,175},
          fillPattern=FillPattern.Forward,
          fillColor={170,213,255}),
        Line(
          points={{78,-4},{-74,-4},{-72,-4}},
          color={175,175,175},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-74,-4},{-50,18},{-50,-4}},
          color={175,175,175},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-50,-4},{-50,-26},{-72,-4},{-72,-4}},
          color={175,175,175},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{-12,40},{8,4}},
          lineColor={175,175,175},
          lineThickness=0.5,
          fillColor={170,213,255},
          fillPattern=FillPattern.Forward,
          textString="h")}),          Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                              graphics));
end ConvectiveWallL;
