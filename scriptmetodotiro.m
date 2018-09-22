clear();
global vx v ejex ejey;
v = 50*1000/3600;  % velocidad en m/s
% Definición de la ecuación diferencial
function [d] = bolafun(z,x)
  global vx;
  d = [z(2);-9.8/(vx-0.25*x).^2];
endfunction
ejey = 3;
ejex = sqrt(11^2-3^2);
% Representamos el punto donde se encuentra el objetivo
clf;
plot(ejex,ejey,'k*')
axis([0,12,0,5]);
hold on
% Primer tiro de prueba
theta = pi/8;
vx = v*cos(theta);
[xn,soln] = rk4solver("bolafun",0,ejex,[0;tan(theta)],100);
plot(xn,soln(1,:),':b')
printf("\n Diferencia tras primer tiro %f \n",ejey-soln(1,end))
% Segundo tiro de prueba
theta = pi/4;
vx = v*cos(theta);
[xn,soln] = rk4solver("bolafun",0,ejex,[0;tan(theta)],100);
plot(xn,soln(1,:),':b')
printf("Diferencia tras segundo tiro %f\n",3-soln(1,end))
% Función auxiliar
function [dif,soln] = errortiro(z)
  global vx v ejex ejey
  theta = z;
  vx = v*cos(theta);
  [xn,soln] = rk4solver("bolafun",0,ejex,[0;tan(theta)],100);
  dif = ejey-soln(1,end);
endfunction
% Resolvemos mediante el método de la secante
[sol,errSec,numiter] = secante("errortiro",pi/8,pi/4,0.01,10)
% Representamos la solución
[t,soln] = rk4solver("bolafun",0,ejex,[0;tan(sol)],100);
plot(t,soln(1,:),'r')
hold off