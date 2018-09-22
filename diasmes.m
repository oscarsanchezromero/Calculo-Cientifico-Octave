function y = diasmes(x) 
% Número de días del mes x-ésimo.
  switch x
    case ({1 3 5 7 8 10 12})
      y = 31;
    case {4,6,9,11}
      y = 30;
    case (2)
      y = 28;
      warning('29 si es bisiesto');
    otherwise
      error('x no parece ser un número entre 1 y 12');
  endswitch
endfunction