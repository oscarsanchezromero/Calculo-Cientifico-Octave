function[x,d2f] = derinum2(f,a,b,N) 
% d2f es la segunda derivada numérica de la función f sobre el
% vector x de N valores equiespaciados en el intervalo [a,b].
  h = (b-a)/(N-1); 
  x = linspace(a,b,N); 
  d2f = (feval(f,a+h*(-1:(N-2)))-2*feval(f,a+h*(0:N-1))+...
  feval(f,a+h*(1:N)))/h^2;
endfunction