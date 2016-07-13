within BrickerISES.Components.ExternalAmbientTC;
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
     BrickerISES.Components.AM.AmbientConditions_Table constrainedby
    BrickerISES.Components.AM.AmbientConditionsSourcePartialModel
                                              annotation(choicesAllMatching=true);

//StephanieLibrary.AM.FixedAmbient ambient;
 inner BrickerISES.Components.AM.Ambient ambient(
    initialMonth=initialMonth,
    initialDay=initialDay,
    initialHour=initialHour,
    initialSecond=initialSecond,
    timeZone=timeZone,
    longitude=longitude,
    latitude=latitude,
    redeclare model AmbientConditionsSource = AmbientConditionsSource);

             parameter Real trackingAxisOrientation(min = 0, max = halfPi) = 0
    "Tracking axis orientation (rad) with 0 for a North-South axis and Pi/2 for an East-West axis.";
  parameter Real trackingAxisSlope(min = 0, max = halfPi) = 0
    "Tracking axis slope (rad) with 0 for a horizontal axis and >0 when the North is hihger than the South.";

//model for theta, with input parameters trackingAxisOrientation and trackingAxisSlope. the rest of the variables are taken from ambien (sunposition, ecc ecc)
            BrickerISES.Components.ExternalAmbientTC.Theta ThetaModel(
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
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
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
- Theta"),
        Text(
          extent={{-44,114},{32,68}},
          lineColor={0,0,255},
          textString="AMBIENT DATA",
          textStyle={TextStyle.Bold})}),
    experiment(StopTime=500000, __Dymola_NumberOfIntervals=2000),
    __Dymola_experimentSetupOutput);
end AmbientData;
