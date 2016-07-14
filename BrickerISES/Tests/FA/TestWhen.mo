within BrickerISES.Tests.FA;
model TestWhen

  Real Var(start=0.1);
  Real local_time;
algorithm
  when time > 1 then
    Var := 1.5;
    local_time := time;

  elsewhen time > 2 then

    Var := 2.5;
    local_time := time;
  end when;

equation

  //   when time > 2 then
  //   Var = 2.5;
  // end when;

initial equation
  Var = 0;

  annotation (experiment(StopTime=4), __Dymola_experimentSetupOutput);
end TestWhen;
