function [x,iter] = gradconj(A,b,x0,tol = 10^-5)
% Esta función calcula una solución aproximada del sistema
%   A x = b mediante el método del gradiente conjugado.
% Datos necesarios para llamar a la función:
%   A, matriz de coeficientes (simétrica y definida positiva o
%   negativa).
%   b, vector de términos independientes (vector columna).
%   x0, aproximación inicial de la raíz (vector columna).
%   tol, tolerancia preestablecida sobre el módulo del residuo.
% La función devuelve como respuesta:
%   x, solución aproximada del SEL.
%   iter, número de iteraciones realizadas para obtener x.
%
  n = length(A);
  x = x0;
  r = b-A*x;
  p = r;
  iter = 0;
  while (norm(r)>tol) && (iter<2*n)
    iter++;
    alpha = (p'*r)/(p'*(A*p));
    x = x+alpha*p;
    r = b-A*x;
    beta = -(r'*(A*p))/(p'*(A*p));
    p = r+beta*p;
  endwhile
endfunction