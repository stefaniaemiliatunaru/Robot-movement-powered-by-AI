function [FeatureMatrix] = prepare_for_regression (InitialMatrix)
  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);

  for i = 1:m
    adaos = 0;
    for j = 1:n
    if (strcmp("yes", InitialMatrix(i, j)) == 1)
        FeatureMatrix(i, j + adaos) = 1;
      elseif (strcmp("no", InitialMatrix(i, j)) == 1)
        FeatureMatrix(i, j + adaos) = 0;
      elseif (strcmp("semi-furnished", InitialMatrix(i, j)) == 1)
        FeatureMatrix(i, j + adaos) = 1;
        k = n + 1;
        while (k >= j+2)
          aux = FeatureMatrix(i, k - 1);
          FeatureMatrix(i, k) = aux;
          k--;
        endwhile
        adaos = 1;
        FeatureMatrix(i, j+1) = 0;
        elseif (strcmp("unfurnished", InitialMatrix(i, j)) == 1)
          FeatureMatrix(i, j + adaos) = 0;
          k = n + 1;
          while (k >= j+2)
          aux = FeatureMatrix(i, k - 1);
          FeatureMatrix(i, k) = aux;
          k--;
        endwhile
          adaos = 1;
          FeatureMatrix(i, j+1) = 1;
        elseif (strcmp("furnished", InitialMatrix(i, j)) == 1)
          FeatureMatrix(i, j + adaos) = 0;
          k = n + 1;
          while (k >= j+2)
          aux = FeatureMatrix(i, k - 1);
          FeatureMatrix(i, k) = aux;
          k--;
        endwhile
          adaos = 1;
          FeatureMatrix(i, j+1) = 0;
        else
          FeatureMatrix(i, j + adaos) = str2double(cell2mat(InitialMatrix(i, j)));
        endif
      endfor
    endfor
  endfunction