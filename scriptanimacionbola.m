1;
function [d] = bolafun(z,x)
  vx = (50*1000/3600)*cos(pi/4);
  d = [z(2);-9.8/(vx-0.25*x).^2];
endfunction
[xnum,solnum] = rk4solver('bolafun',0,15,[0;tan(pi/4)],300);
clf
axis([0,15,-1,6]);
hold on
for i = 0:100
  plot(xnum(1+3*i),solnum(1,1+3*i),'r*');
  saveas(1,strcat('./graftiro/imagen',num2str(i),'.png'),'png');
  % Ojo! La carpeta graftiro ha de estar creada con anterioridad.
  endfor
hold off