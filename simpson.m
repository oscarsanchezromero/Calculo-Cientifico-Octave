function int = simpson(f,a,b,N = 75)
% Función que aproxima la integral de f en el
% intervalo [a,b] mediante la fórmula compuesta de 
% Simpson con 2N+1 nodos
%
  h = (b-a)/N; 
  x = a+h*(0:(N-1)); 
  int = (sum(feval(f,x)+4*feval(f,x+h/2)+feval(f,x+h)))*h/6;
endfunction
