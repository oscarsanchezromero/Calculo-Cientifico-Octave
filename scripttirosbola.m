global vx;
v = 50*1000/3600;  % velocidad expresada en m/s
hold on
axis([0,15,0,8]);
function [d] = bolafun(z,x)
  global vx;
  d = [z(2);-9.8/(vx-0.25*x).^2];
endfunction
for theta = pi/16:pi/16:6*pi/16
  vx = v*cos(theta);
  [xnum,solnum] = rk4solver('bolafun',0,15,[0;tan(theta)],100);
  plot(xnum,solnum(1,:))
endfor
xlabel("x");
ylabel("y");
hold off