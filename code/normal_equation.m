function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m,n] = size(FeatureMatrix);
  Theta = zeros(n, 1);
  b = FeatureMatrix' * Y;
  A = FeatureMatrix' * FeatureMatrix;
  r = b - A * Theta;
  v = r;
  tol_2 = tol * tol;
  k = 1;
  ok = 1;
  for i = 1:n
    if (det(A(1:i, 1:i)) < 0)
      ok = 0;
    endif
  endfor
  if (ok == 1)
    while ((k <= iter) && ((r' * r) > tol_2))
      t = (r' * r) / (v' * A * v);
      Theta = Theta + t * v;
      r_prec = r;
      r = r - t * A * v;
      s = (r' * r) / (r_prec' * r_prec);
      v = r + s * v;
      k++;
    endwhile
  endif
  Theta = resize(Theta, n+1);
  i = n + 1;
  while (i >= 2)
    aux = Theta(i - 1);
    Theta(i) = aux;
    i--;
  endwhile
  Theta(1) = 0;
endfunction

