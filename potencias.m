function [lambda,y] = potencias(A,x,tol,maxiter)
% Calcula una aproximación del valor propio dominante de A, 
% matriz cuadrada, mediante el método de potencias a partir
% de un vector inicial x (columna). 
% maxiter determina el número máximo de iteraciones del método.
% tol es la tolerancia sobre el error relativo entre iteraciones.
lambdaviejo = rand();
k = 0;
error = 1000;
while k<=maxiter && error>=tol
  y = x/norm(x);
  x = A*y;
  lambda = y'*x;
  error = abs((lambda-lambdaviejo)./lambda);
  lambdaviejo = lambda;
  k = k+1;
endwhile
if k>maxiter 
    warning('No converge tras %i iteraciones \n',maxiter);
  else
    fprintf('El método converge en %i iteraciones \n',k);
endif
endfunction