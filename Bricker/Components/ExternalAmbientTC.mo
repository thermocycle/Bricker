within Bricker.Components;
package ExternalAmbientTC "external ambient modified for ThermoCycle Library"
  model AmbientData

   // import StephanieLibrary.AM;
    import Modelica.Constants;
    constant Real halfPi = Constants.pi/2;

    parameter Integer initialMonth =  6 "depend on the table initial data set";
    parameter Integer initialDay =    21 "depend on the table initial data set";
    parameter Integer initialHour =   0;
    parameter Integer initialMinute = 0;
    parameter Real    initialSecond = 0;
    parameter Integer timeZone = 8;
    parameter Real longitude =   -114.97555;
    parameter Real latitude =    35.8083;

     replaceable model AmbientConditionsSource =
       Bricker.Components.AM.AmbientConditions_Table
                                                constrainedby
      Bricker.Components.AM.AmbientConditionsSourcePartialModel
                                                annotation(choicesAllMatching=true);

  //StephanieLibrary.AM.FixedAmbient ambient;
   inner Bricker.Components.AM.Ambient  ambient( initialMonth=initialMonth,
   initialDay=initialDay,
    initialHour=initialHour,
     initialSecond=initialSecond,
      timeZone= timeZone,
          longitude=longitude,
            latitude=latitude,
            redeclare model AmbientConditionsSource =
               AmbientConditionsSource);

               parameter Real trackingAxisOrientation(min = 0, max = halfPi) = 0
      "Tracking axis orientation (rad) with 0 for a North-South axis and Pi/2 for an East-West axis.";
    parameter Real trackingAxisSlope(min = 0, max = halfPi) = 0
      "Tracking axis slope (rad) with 0 for a horizontal axis and >0 when the North is hihger than the South.";

  //model for theta, with input parameters trackingAxisOrientation and trackingAxisSlope. the rest of the variables are taken from ambien (sunposition, ecc ecc)
              Bricker.Components.ExternalAmbientTC.Theta ThetaModel(
        trackingAxisOrientation=trackingAxisOrientation, trackingAxisSlope=
          trackingAxisSlope);

    Modelica.Blocks.Interfaces.RealOutput DNI
    annotation (Placement(transformation(extent={{64,60},{84,82}}),
          iconTransformation(extent={{60,58},{84,82}})));
    Modelica.Blocks.Interfaces.RealOutput Tamb
    annotation (Placement(transformation(extent={{64,-82},{84,-60}}),
          iconTransformation(extent={{60,-84},{84,-60}})));
            Modelica.Blocks.Interfaces.RealOutput v_wind
    annotation (Placement(transformation(extent={{80,-32},{100,-10}}),
          iconTransformation(extent={{76,-34},{100,-10}})));

    Modelica.Blocks.Interfaces.RealOutput Theta
    annotation (Placement(transformation(extent={{82,30},{102,52}}),
          iconTransformation(extent={{78,28},{102,52}})));

  equation
    DNI =  ambient.dni;
    Tamb = ambient.temperature;
    v_wind = ambient.windSpeed; // (m/s)
    Theta = ThetaModel.theta; // Theta (rad)
      annotation (Placement(transformation(extent={{-102,-46},{36,40}})), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics),                           Diagram(graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),
           graphics={Ellipse(extent={{-94,-76},{74,84}}, lineColor={0,0,255},
            fillColor={170,255,255},
            fillPattern=FillPattern.Solid),
            Text(
            extent={{-52,-6},{34,-24}},
            lineColor={0,0,255},
            textString="- DNI
- T_amb
- v_wind
- Theta"),Text(
            extent={{-44,114},{32,68}},
            lineColor={0,0,255},
            textString="AMBIENT DATA",
            textStyle={TextStyle.Bold})}),
      experiment(StopTime=500000, __Dymola_NumberOfIntervals=2000),
      __Dymola_experimentSetupOutput);
  end AmbientData;

  model Theta "Common interface for different Incidence Angle Modifiers"

  import Modelica.Math.Vectors;
  import Bricker.Constants;
  import Bricker.Functions;
  import Bricker.Components.AM;

  //Models
    outer Bricker.Components.AM.Ambient ambient;
  //Parameters
    parameter Real trackingAxisOrientation(min = 0, max = halfPi) = 0
      "Tracking axis orientation (rad) with 0 for a North-South axis and Pi/2 for an East-West axis.";
    parameter Real trackingAxisSlope(min = 0, max = halfPi) = 0
      "Tracking axis slope (rad) with 0 for a horizontal axis and >0 when the North is hihger than the South.";
  //Variables
    //output Real incidenceAngleModifier(min = 0, max = 1.0);

    Bricker.Components.AM.Ambient.SunPosition sun;
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
</html>"),   Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
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
end ExternalAmbientTC;
