function int = trapecios(f,a,b,N = 150)  
% Función que aproxima la integral de f en el
% intervalo [a,b] mediante la fórmula compuesta de 
% trapecios con N subintervalos
%
  h = (b-a)/N; 
  x = a+h*(0:N); 
  y = feval(f,x);
  int = h*trapz(y);
endfunction
