function [Y, InitialMatrix] = parse_data_set_file (file_path)
  filein = fopen(file_path, 'r');
  m = fscanf(filein, '%d', 1);
  n = fscanf(filein, '%d', 1);
  InitialMatrix = cell(m,n);
  Y = zeros(1, m);
  for i = 1:m
    Y(i) = fscanf(filein, '%f', 1);
    for j = 1:n
      InitialMatrix(i,j) = fscanf(filein, '%s', 1);
    endfor
  endfor
endfunction