within BrickerISES.Tests.SA;
model Prova2
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,1; 10,2; 20,10; 40,20;
        100,50])
    annotation (Placement(transformation(extent={{-36,26},{-16,46}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Prova2;
