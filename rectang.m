function int = rectang(f,a,b,N = 150)
% Función que aproxima la integral de f en el
% intervalo [a,b] mediante la fórmula compuesta de 
% rectángulos (punto medio) con N subintervalos
%
  h = (b-a)/N; 
  int = h*sum(feval(f,a+h*(1:N)-h/2)); 
endfunction