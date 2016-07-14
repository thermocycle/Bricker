within BrickerISES.Tests.AD;
model Test_WaterSide
replaceable package Medium =
     ThermoCycle.Media.Water constrainedby
    Modelica.Media.Interfaces.PartialMedium
    "Medium model secondary fluid - Incompressible Fluid"                                                                                                     annotation (choicesAllMatching = true);

  Medium.ThermodynamicState fluidState = Medium.setState_pT(3e5,70+273+15);
end Test_WaterSide;
