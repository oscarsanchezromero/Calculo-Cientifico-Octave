function p = difdiv(x,y)
% Esta función calcula el polinomio interpolador p mediante
% diferencias divididas para datos lagragianos.
n = length(y)-1;  % n+1 es el número de nodos
d = y;      % Columna con diferencias divididas de orden 0
p = d(1);   % Polinomio que interpola en el primer nodo
for k = 1:n 
  % Columna con diferencias divididas de orden k
  d = (d(2:end)-d(1:end-1))./(x(k+1:end)-x(1:end-k));
  % Polinomio que interpola los k+1 primeros datos. 
  p = [0,p]+d(1)*poly(x(1:k)); 
endfor
endfunction