function [Error] = lasso_regression_cost_function (Theta, Y, FeatureMatrix, lambda)
  [number_of_exists, number_of_exists_aux] = size(Y);
  h = zeros(1, number_of_exists);
  [m, n] = size(FeatureMatrix);
  for i = 1:m
    for j = 1:n
      h(i) = h(i) + Theta(j + 1) * FeatureMatrix(i,j);
    endfor
  endfor
  sum_cost = 0;
  for i=1:m
    sum_cost = sum_cost + (h(i) - Y(i))*(h(i) - Y(i));
  endfor
  sum_cost = sum_cost / m;
  sum_Theta = 0;
  for i = 1:n
    sum_Theta = sum_Theta + abs(Theta(i+1));
  endfor
  Error = sum_cost + lambda * sum_Theta;
endfunction