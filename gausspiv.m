function [x,p] = gausspiv(A,b)
% Esta función resuelve el sistema Ax=b mediante Gauss.
%   x, solucion del SEL (vector/es columna).
%   p, vector con las permutaciones realizadas en el proceso.
  [dim,ncb] = size(b);
  Ab = [A b];
  p = 1:dim;
  for j = 1:dim-1
    % Pivoteo parcial dentro de la columna j
    [piv,pos] = max(abs(Ab(j:dim,j)));
    Ab([j,j+pos-1],:) = Ab([j+pos-1,j],:);
    p([j,j+pos-1]) = p([j+pos-1,j]);
    % Anulación de los elementos bajo el pivote
    Ab(j+1:dim,j:dim+ncb) = Ab(j+1:dim,j:dim+ncb) - ...
      Ab(j+1:dim,j)'*Ab(j,j:dim+ncb)/Ab(j,j);
  endfor
  % Resolvemos por sustitución regresiva
  x = sustregr(Ab(1:dim,1:dim),Ab(1:dim,dim+1:dim+ncb));
endfunction