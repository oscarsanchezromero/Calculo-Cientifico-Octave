lambda = 1;
% Representamos la solución analítica
clf
hold on
t = 5:0.01:6;
plot(t,exp(lambda*t-5),'k');
% Representamos los valores aproximados con 6 nodos
N = 5;
h = 1/N;
y = [1];
for i = 1:N
  y = [y,y(:,i)*(1+lambda*h)];
endfor
plot(5:h:6,y,'xr')
% Representamos los valores aproximados con 11 nodos
N = 10;
h = 1/N;
y = [1];
for i = 1:N
  y = [y,y(:,i)*(1+lambda*h)];
endfor
plot(5:h:6,y,'ob')
xlabel("t");ylabel("y");
legend('Soluc. exacta','Aprox. 6 nodos', 'Aprox. 11 nodos')
hold off

