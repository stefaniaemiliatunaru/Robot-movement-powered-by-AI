function [Theta] = gradient_descent (FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(1, n + 1);
  h = zeros(1, m);
    for i = 1:m
      for j = 1:n
        h(i) = h(i) + Theta(j) * FeatureMatrix(i,j);
      endfor
    endfor
    J = zeros(1, n);
    for j = 1:n
      sum = 0;
      for i = 1:m
        sum = sum + (h(i) - Y(i)) * FeatureMatrix(i,j);
      endfor
      J(j) = sum / m;
    endfor
    for k = 1:iter
      for i = 1:n
      Theta(i) = Theta(i) - (alpha * J(i));
    endfor
  endfor
  i = n+1;
  while (i >= 2)
    aux = Theta(i - 1);
    Theta(i) = aux;
    i--;
  endwhile
  Theta(1) = 0;
endfunction