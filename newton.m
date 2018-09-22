function [c,err,numiter] = newton(f,fdx,x0,tol,maxIter)
% Esta función genera una aproximación de la raíz c de la
%   función derivable f(x) mediante el método Newton-Raphson.
% Datos necesarios para llamar a la función:
%   f y fdx, expresiones de f(x) y f'(x);
%   x0, aproximación inicial de la raíz c;
%   tol, tolerancia máxima entre aproximaciones sucesivas;
%   maxIter, número máximo de iteraciones a realizar.
% La función devuelve como respuesta tres valores:
%      c = valor aproximado de la raíz;
%      err = |f(c)|;
%      numiter = número de iteraciones realizadas.
% Iniciación de variables
  n = 0; xn = x0;
  fxn = feval(f,xn);
  fdxxn = feval(fdx,xn);
  difsuc = fxn/fdxxn;  % Diferencia entre iteraciones sucesivas
  % Bucle
  while abs(difsuc)>=tol && n<=maxIter
    n = n+1;
    xn = xn-difsuc; 
    fxn = feval(f,xn);
    fdxxn = feval(fdx,xn);
    difsuc = fxn/fdxxn; % Guarda datos para la próxima iteración
  endwhile
  if n>maxIter
    warning('Newton-Raphson llegó al máximo de iteraciones \n');
  endif
  % Definición de respuestas
  c = xn; err = abs(fxn); numiter = n;
endfunction