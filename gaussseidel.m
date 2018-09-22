function [x,iter] = gaussseidel(A,b,x0,tol = 10^-12,maxiter = 25)
% Esta función calcula una solución aproximada del sistema
%   A x = b mediante el método de Gauss-Seidel. 
% Datos necesarios para llamar a la función:
%   A, matriz de coeficientes del SEL (regular).
%   b, vector de términos independientes (vector columna).
%   x0, aproximación inicial de la raíz (vector columna).
%   tol, tolerancia preestablecida sobre la norma del residuo.
%   maxiter, número máximo de iteraciones del método.
% La función devuelve como respuesta:
%   x, solución aproximada del SEL.
%   iter, número de iteraciones realizadas para obtener x  
%   (si coincide con maxiter es que x no verifica la condición
%   de tolerancia impuesta).
%
  n = length(A);
  x = x0;  % se inicializa x
  normb = norm(b);
  iter = 0; 
  while (norm(A*x-b)>tol*normb) && (iter<maxiter)
    iter++;
    for j=1:n
      x(j) = (b(j)-A(j,[1:j-1,j+1:n])*x([1:j-1,j+1:n]))/A(j,j);
    endfor
  endwhile
endfunction