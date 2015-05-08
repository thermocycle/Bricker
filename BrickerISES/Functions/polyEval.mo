within BrickerISES.Functions;
function polyEval
  "Evaluate a poynomial of the form: y = c[1] + c[2] * x + c[3] * x^2 + .. + c[N] * x^(N-1)"
  input Real x;
  input Real c[:];
  output Real y;
algorithm
  y := c[1];
  for i in 2:size(c,1) loop
    y := y + c[i] * x^(i - 1);
  end for;
  annotation(derivative(zeroDerivative = c) = polyEval_der);
end polyEval;
