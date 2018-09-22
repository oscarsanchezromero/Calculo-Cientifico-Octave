function x = sustregr(T,c)
% Esta función resuelve el SEL Tx = c, con T triangular superior
% y regular, mediante sustituciones regresivas.
  [dim,nc] = size(c);
  x = zeros(dim,nc);
  for i = dim:-1:1 
    x(i,:) = (c(i,:)-T(i,:)*x)/T(i,i); 
  endfor
endfunction