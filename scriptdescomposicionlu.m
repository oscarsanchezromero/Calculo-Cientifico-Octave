% Datos del ejemplo
A = [3 1 2 ; 1 4 3 ; 3 3 2];
b = [1 ; 3 ; 4];
% Realizamos la factorización LU de Doolittle de A
n = size(A)(1);
aux = zeros(n,n);
% Calculamos la primera fila de U y la primera columna de L
aux(1,1) = A(1,1);
if aux(1,1) == 0
  error('No se puede realizar la factorización LU');
endif;
for s = 2:n
  aux(1,s) = A(1,s);
  aux(s,1) = A(s,1)/aux(1,1);
endfor
% Filas y columnas siguientes, partiendo desde la diagonal
for r = 2:n
  aux(r,r) = A(r,r)-(aux(r,1:r-1)*aux(1:r-1,r));
  if aux(r,r) == 0
    error('No se puede realizar la factorización LU')
  endif;
  for s = r+1:n
    aux(r,s) = A(r,s)-aux(r,1:r-1)*aux(1:r-1,s));
    aux(s,r) = (A(s,r)-(aux(s,1:r-1)*aux(1:r-1,r)))/aux(r,r);
  endfor
endfor
L = tril(aux,-1)+eye(n);
U = triu(aux);
% Resolvemos el sistema a partir de dicha descomposición
y = sustprogr(L,b);
x = sustregr(U,y)