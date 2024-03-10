function [Y, InitialMatrix] = parse_csv_file (file_path)
  data = textread(file_path, '%s', 'delimiter', ',');
  nr = length(data);
  m = nr / 13;
  Y = zeros(1, m - 1);
  InitialMatrix = cell(m - 1, 12);
  nr_Y = 0;
  i = 0;
  j = 0;
  for k = 1:nr
    rest = mod(k, 13);
    if (rest == 1 && k > 13)
      nr_Y = nr_Y + 1;
      Y(nr_Y) = str2double(cell2mat(data(k)));
      i = i + 1;
      j = 0;
    endif
    if (rest != 1 && k > 13)
      j = j + 1;
      InitialMatrix(i, j) = data(k);
    endif
  endfor
  Y = Y';
endfunction
