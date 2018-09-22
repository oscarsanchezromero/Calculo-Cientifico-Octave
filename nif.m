function y = nif(dni)
% Esta función calcula la letra del NIF para el DNI introducido
  letras = 'TRWAGMYFPDXBNJZSQVHLCKE';
  n = rem(dni,23)+1;
  y = letras(n);
endfunction