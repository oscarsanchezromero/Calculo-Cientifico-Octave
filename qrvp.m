function d = qrvp(A,tol,maxiter)
% Esta función calcula una aproximación de los valores propios 
% de una matriz cuadrada A mediante el método QR.  
% nmax determina el número máximo de iteraciones a realizar.
% tol es una tolerancia sobre lo que le sobra a las matrices 
% para ser triangulares.
T = A;
k = 0;
while k<=maxiter && norm(tril(T,-1),inf)>=tol
  [Q,R] = qr(T);
  T = R*Q;
  k = k+1;
endwhile
if k>maxiter 
    warning('No converge tras %i iteraciones \n',maxiter);
  else
    fprintf('El método converge en %i iteraciones \n',k);
endif
d = diag(T);
end

