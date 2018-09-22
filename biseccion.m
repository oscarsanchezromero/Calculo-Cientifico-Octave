function [caprox,err,numiter] = biseccion(f,a,b,tol)
% Esta función aproxima una raíz c de la función continua f(x), 
%   localizada en [a,b], mediante el método de bisección.
% Datos necesarios para llamar a la función:
%   f, expresión de f(x);
%   a y b, extremos del intervalo donde sabemos que existe
%     una raíz por el Teorema de Bolzano ya que f(a)*f(b)<0;
%   tol, tolerancia máxima en la aproximación de la raíz,   
% La función devuelve como respuesta tres números:
%   caprox = valor aproximado de la raíz;
%   err = |f(caprox)|;
%   numiter = número de iteraciones realizadas.

% Iniciación de variables
  n = 0;
  c = (a+b)/2;
  yc = feval(f,c);
  maxIter = ceil((log(b-a)-log(tol))/log(2))-1;
  ya = feval(f,a); 
  yb = feval(f,b);
  % Bucle para n>=1
  for n = 1:maxIter
    if yc == 0 % La raíz es c
      a = c;
      b = c;
      fprintf('Se ha alcanzado el cero exacto \n');
      break
    elseif yb*yc>0 % La raíz está en [a,c]
      b = c;
      yb = yc;
    else % La raíz está en [c,b]
      a = c;
      ya = yc;
    endif
    c = (a+b)/2;
    yc = feval(f,c);  
  endfor
  % Definición de la respuesta
  caprox = c; err = abs(yc); numiter = n;
endfunction