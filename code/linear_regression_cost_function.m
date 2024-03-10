function [Error] = linear_regression_cost_function (Theta, Y, FeatureMatrix)
  [number_of_exits, number_of_exits_aux] = size(Y);
  h = zeros(1, number_of_exits);
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
  sum_cost = sum_cost / (2 * m);
  Error = sum_cost;
endfunction