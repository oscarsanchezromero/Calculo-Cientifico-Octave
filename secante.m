function [c,err,numiter] = secante(f,x0,x1,tol,maxIter)
% Esta función genera una aproximación de una raíz c de la
%   función continua f(x) mediante el método de la secante.
% Datos necesarios para llamar a la función:
%   f, expresión de f(x);
%   x0 y x1, aproximaciones iniciales de la raíz;
%   tol, tolerancia máxima entre aproximaciones sucesivas,
%     es decir, |xk - xkmenos1| < tol;
%   maxIter-1, número máximo de iteraciones a realizar.
% La función devuelve como respuesta tres valores:
%   c = valor aproximado de la raíz;
%   err = |f(c)|;
%   numiter = número de iteraciones realizadas.

% Iniciación de variables 
  n = 1; 
  difsuc = x1-x0;  % Diferencia entre iteraciones sucesivas
  xnmenos1 = x0;
  xn = x1;
  fxnmenos1 = feval(f,xnmenos1);
  fxn = feval(f,xn);
  % Bucle
  while abs(difsuc)>=tol && n<=maxIter
    n = n+1;
    difsuc = fxn*(xn-xnmenos1)/(fxn-fxnmenos1);
    xnmenos1 = xn; fxnmenos1 = fxn;  % Se guardan datos para
    xn = xn-difsuc;                  % la próxima iteración
    fxn = feval(f,xn);
  endwhile
  if n>maxIter
    warning('Secante ha llegado al máximo de iteraciones \n');
  endif
  % Definición de respuestas
  c = xn; err = abs(fxn); numiter = n-1;
endfunction