% Función de Runge
f = @(x) 1./(1+25*x.^2);
% Función que evalúa el polinomio interpolador de grado n.
function v = pz(z,n) 
  x = linspace(-1,1,n+1); % n+1 nodos equiespaciados
  y = 1./(1+25*x.^2);
  p = polyfit(x,y,n);
  v = polyval(p,z);
endfunction
z = linspace(-1,1,100);
plot(z,f(z),'g',z,pz(z,8),'--b',z,pz(z,14),'-.r')