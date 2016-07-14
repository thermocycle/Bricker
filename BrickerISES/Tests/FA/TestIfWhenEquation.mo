within BrickerISES.Tests.FA;
model TestIfWhenEquation

  parameter Real start_var=0;
  Integer Flag;
  Real Var(start=start_var);

  Real der_Var(start=sin(0) + 0.2);

  Real initial_Var;
  //Modelica.SIunits.Time local_time(start=0);
  Real C;

algorithm
  //   when Var >= 1 then
  //     Flag := 1;
  //   elsewhen Var <= 0 then
  //     Flag := 0;
  //   elsewhen Var > 0 and Var < 1 then
  //     Flag := 2;
  //
  //   end when;

  when der_Var < 0 then
    if Flag == 1 then

      Flag := 2;

    end if;
  end when;

  when der_Var > 0 then
    if Flag == 0 then

      Flag := 2;

    end if;
  end when;

  when Var >= 1 then
    Flag := 1;

  end when;
  when Var <= 0 then
    Flag := 0;

  end when;

equation
  der_Var = sin(time) + 0.2;

  if Flag == 1 then
    Var = 1;
    C = 0;
    initial_Var = 0;

  elseif Flag == 0 then
    Var = 0;
    C = 0;
    initial_Var = 0;
  else
    Var = initial_Var + time*C*0.00001;

    if der_Var > 0 then
      C = 1;
      initial_Var = 0;
    else
      C = -1;
      initial_Var = 1;

    end if;
  end if;

  //   when der_Var <= 0 then
  //     Flag = 2;
  //
  //   end when;

initial equation

  // Flag = 0;
  // initial_Var = start_var;
  // C = 0;
  //   initial_Var = start_var;
  //   if start_var <= 0 then
  //     Flag = 0;
  //
  //   elseif start_var >= 1 then
  //     Flag = 1;
  //
  //   else
  //     Flag = 2;
  //
  //     if der_Var > 0 then
  //       C = 1;
  //     elseif der_Var < 0 then
  //       C = -1;
  //     else
  //       C = 0;
  //     end if;
  //   end if;

  annotation (
    experiment(StopTime=10),
    __Dymola_experimentSetupOutput,
    experiment(StopTime=5));
end TestIfWhenEquation;
