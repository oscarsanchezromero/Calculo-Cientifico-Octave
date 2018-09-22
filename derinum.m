function [x,df] = derinum(f,a,b,N) 
% df es la derivada primera numérica de la función f sobre el  
% vector x de N valores equiespaciados en el intervalo [a,b].
  h = (b-a)/(N-1); 
  x = linspace(a,b,N); 
  df = (feval(f,a+h*(1:N))-feval(f,a+h*(-1:(N-2))))/(2*h);
endfunction
