function [] = plotspline(p,x)
% Esta función representa en cada intervalo [x(i),x(i+1)]
% el polinomio p(i,:) empleando el comando plot.
n = length(x)-1;   % Número de subintervalos
for i = 1:n
  z = linspace(x(i),x(i+1),20); 
  plot(z,polyval(p(i,:),z)); 
  hold on
endfor
hold off
endfunction