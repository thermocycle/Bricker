within BrickerISES.Components.Enumerations;
type ConvectiveWall = enumeration(
    Insulated "Insulated",
    Constant "Constant h Convective Heat Transfer",
    h_function1 "h as a function of T_int, T_ext, ecc ecc")
  "Convective Heat Transfer for the Wall, h [W/m^2.K]";
