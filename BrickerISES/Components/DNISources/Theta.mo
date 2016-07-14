within BrickerISES.Components.DNISources;
model Theta "Common interface for different Incidence Angle Modifiers"

import Modelica.Math.Vectors;
import BrickerISES.Constants;
import BrickerISES.Functions;
import BrickerISES.Components.AM;

//Models
  outer BrickerISES.Components.AM.Ambient ambient;
//Parameters
  parameter Real trackingAxisOrientation(min = 0, max = halfPi) = 0
    "Tracking axis orientation (rad) with 0 for a North-South axis and Pi/2 for an East-West axis.";
  parameter Real trackingAxisSlope(min = 0, max = halfPi) = 0
    "Tracking axis slope (rad) with 0 for a horizontal axis and >0 when the North is hihger than the South.";
//Variables
  //output Real incidenceAngleModifier(min = 0, max = 1.0);

  BrickerISES.Components.AM.Ambient.SunPosition sun;
  constant Real halfPi = Constants.pi/2;
  Real cosTheta "Cosine of the incident angle";
  Real theta "Incident angle";
  Real[3] trackingAxis;
  Real[3] sunVector;

equation
  sun = ambient.sun;
  trackingAxis = Vectors.normalize({cos(trackingAxisOrientation)*cos(-trackingAxisSlope), sin(trackingAxisOrientation)*cos(-trackingAxisSlope), sin(-trackingAxisSlope)});
  sunVector    = Vectors.normalize({-sin(sun.zenith)*cos(sun.azimuth), sin(sun.zenith)*sin(sun.azimuth), cos(sun.zenith)});
  cosTheta = (1 - Functions.DotProduct3D(trackingAxis,  sunVector) ^ 2)  ^ 0.5;
  theta = if cosTheta < 1 and cosTheta > -1 then acos(cosTheta) else 0;

//Documentation
annotation ( Documentation(info="<html>
<p>
<b>Brief Description:</b>
</p>
<p>Common interface for different Incidence Angle Modifiers.
This model is used as base class for Incidence Angle Modifiers.
Extending models should include the specific calculation for the incidenceAngleModifier.
Parameters for axis orientation and slope are declared in this partial package since they are needed for the cosTheta calculation.
Concentrator models are forced to use one of these extending models.
</p>
<p>
<b>Detailed Information:</b>
</p>
<p>
<pre>
...
</pre>
</p>
<p>
<pre>
...
</pre>
</p>
<p>
<b>Model diagram:</b>
</p>
<p>
<pre>
...HERE THE MODEL EXPLANATORY DIAGRAM...
</pre>
</p>
<p>
<b>References:</b>
</p>
<p>
...
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Ellipse(
          extent={{-50,54},{42,-46}},
          lineColor={0,0,255},
          fillColor={170,255,85},
          fillPattern=FillPattern.Solid), Text(
          extent={{-28,22},{22,-16}},
          lineColor={0,0,255},
          fillColor={170,255,85},
          fillPattern=FillPattern.Solid,
          textString="Theta")}));
end Theta;
