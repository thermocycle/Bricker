within BrickerISES.Functions;
function polyEval_der
  "Derivative of a poynomial of the form: y = c[1] + c[2] * x + c[3] * x^2 + .. + c[N] * x^(N-1)"
  input Real x;
  input Real c[:];
  input Real der_x;
  output Real der_y;
algorithm
  der_y := c[2] * der_x;
  for i in 3:size(c,1) loop
    der_y := der_y + (i - 1) * c[i] * x^(i - 2) * der_x;
  end for;
end polyEval_der;
