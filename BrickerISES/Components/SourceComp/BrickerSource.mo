within BrickerISES.Components.SourceComp;
model BrickerSource "Take the DNI values from a Table implemented in Modelica"

  extends BrickerISES.Components.SourceComp.BaseClass.SourcePartialModel;

  /* Package to select the appropriate table */
  replaceable package AmbientDataTable =
   BrickerISES.Components.SourceComp.Tables.DataTablePartial
    constrainedby BrickerISES.Components.SourceComp.Tables.DataTablePartial
                                         annotation(choicesAllMatching=true);

 /* Define the table as a CombiTable1Ds from the Modelica Standard library*/
protected
  Modelica.Blocks.Tables.CombiTable1Ds table(final tableOnFile = false,
                                             final table =       AmbientDataTable.table,
                                             final fileName =    "NoName",
                                             final tableName =   "DataBricker",
                                             final columns =     2:5,
                                             final smoothness =  Modelica.Blocks.Types.Smoothness.ContinuousDerivative);

public
    Modelica.Blocks.Interfaces.RealOutput DNI annotation (Placement(
        transformation(extent={{94,68},{114,90}}), iconTransformation(extent={{90,66},
            {114,90}})));
  Modelica.Blocks.Interfaces.RealOutput Tamb annotation (Placement(
        transformation(extent={{96,12},{116,34}}), iconTransformation(extent={{90,16},
            {114,40}})));
  Modelica.Blocks.Interfaces.RealOutput Qbuild annotation (Placement(
        transformation(extent={{96,-40},{116,-18}}), iconTransformation(extent={{90,-38},
            {114,-14}})));
  Modelica.Blocks.Interfaces.RealOutput Hours annotation (Placement(
        transformation(extent={{98,-90},{118,-68}}), iconTransformation(extent={{90,-96},
            {114,-72}})));
equation
/* Define the input values for the CombiTable1Ds */
table.u = time;

/* Define the partial model outputs variables to the table columns*/
  dni       = table.y[1];
  Tambient  = table.y[2];
  Qbuilding = table.y[3];
  hours     = table.y[4];

/* Connect the Real outputs to the partial model outputs*/
  DNI = dni;
  Tamb = Tambient;
  Qbuild = Qbuilding;
  Hours = hours;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={Rectangle(extent={{-102,100},{100,-100}},
            lineColor={0,0,0},
          fillColor={85,255,255},
          fillPattern=FillPattern.Solid,
          radius=30),
                   Ellipse(extent={{-96,-88},{82,84}}, lineColor={0,0,0},
          fillColor={255,128,0},
          fillPattern=FillPattern.Solid),
                                  Text(
          extent={{38,96},{88,60}},
          lineColor={0,0,0},
          textString="DNI"),      Text(
          extent={{36,48},{86,12}},
          lineColor={0,0,0},
          textString="Tamb"),     Text(
          extent={{36,-8},{86,-44}},
          lineColor={0,0,0},
          textString="Qbuild"),   Text(
          extent={{36,-66},{86,-102}},
          lineColor={0,0,0},
          textString="Hours")}),    Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end BrickerSource;
