within BrickerISES.Tests.FA;
model TestConvectiveWall
  ThermoCycle.Components.HeatFlow.Sources.Source_T_cell T_in annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,18})));
  ThermoCycle.Components.HeatFlow.Sources.Source_T_cell T_out annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-58,18})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 25)
    annotation (Placement(transformation(extent={{-94,6},{-74,26}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 100)
    annotation (Placement(transformation(extent={{66,10},{46,30}})));
  Components.Tank.ConvectiveWallL convectiveWallL(A=2, Convection=BrickerISES.Components.Enumerations.ConvectiveWall.h_function1)
    annotation (Placement(transformation(extent={{-28,8},{-8,28}})));
equation
  connect(const.y, T_out.Temperature) annotation (Line(
      points={{-73,16},{-68,16},{-68,17},{-63,17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, T_in.Temperature) annotation (Line(
      points={{45,20},{42,20},{42,17},{35,17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(convectiveWallL.thermalPortL_int, T_in.ThermalPortCell) annotation (
      Line(
      points={{-9,17.4},{26.9,17.4},{26.9,17.1}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(convectiveWallL.thermalPortL_ext, T_out.ThermalPortCell) annotation (
      Line(
      points={{-27,17.4},{-54.9,17.4},{-54.9,17.1}},
      color={255,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestConvectiveWall;
