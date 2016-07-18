within BrickerISES.Components.GeneralCombiTableModel;
model GeneralCombiTable
  "Take the DNI values from a Table implemented in Modelica"

  extends BrickerISES.Components.GeneralCombiTableModel.GeneralCombiTableBase;

  /* Package to select the appropriate table */
  replaceable package AmbientDataTable =
      BrickerISES.Components.GeneralCombiTableModel.PartialTable
    constrainedby BrickerISES.Components.GeneralCombiTableModel.PartialTable
                                         annotation(choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput OutPut
  annotation (Placement(transformation(extent={{92,56},{112,78}}),
        iconTransformation(extent={{88,54},{112,78}})));
 /* Define the table as a CombiTable1Ds from the Modelica Standard library*/
protected
  Modelica.Blocks.Tables.CombiTable1Ds table(final tableOnFile = false,
                                             final table =       AmbientDataTable.table,
                                             final fileName =    "NoName",
                                             final tableName =   "ambient",
                                             final columns =     2:3,
                                             final smoothness =  Modelica.Blocks.Types.Smoothness.ContinuousDerivative);

equation
/* Define the input values for the CombiTable1Ds */
table.u = time;

/* Define the output variables based on the table values*/
  OutPutVar  = table.y[1];

  /* Connect the Real output element*/
  OutPut = OutPutVar;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
                   Ellipse(extent={{-90,-84},{78,76}}, lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
                                   Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{-72,40},{68,-44}},
          lineColor={0,0,255},
          textString="CombiTab")}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end GeneralCombiTable;
