b = 10^12; % Extremo superior de integración
t = [0,10.^linspace(-4,12,100)];
function up = f(u,t) % definición de la EDO
  n = 0; k1 = 0.04; k2 = 3*10^7; k3 = 10^4;
  up(1) = -k1*u(1)+k3*u(2)*u(3);
  up(2) = k1*u(1)-k2*u(2)^2-k3*u(2)*u(3);
  up(3) = k2*u(2)^2;
endfunction
[sol,ystate] = lsode('f',[1;0;0],t); % resolución
% representación gráfica
subplot(2,1,1)semilogx(t(2:end),sol(2:end,[1,3]))  % gráfica de u(1) y u(3)subplot(2,1,2)semilogx(t(2:end),sol(2:end,2),'r')  % gráfica de u(2)
ystate
