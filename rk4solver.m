function [t,y] = rk4solver(f,t0,tfinal,u0,N)
% Resuelve el PVI: u'(t)=f(u(t),t) en [t0,tfinal]
% empleando el método de Runge-Kutta explícito de orden 4.
% En el caso n-dimensional, u0 es un vector columna.
% Devuelve:
%   t = vector con los nodos;
%   y(:,i) = vector con las aproximaciones de u(t(i)).
  h = (tfinal-t0)/N;          % h tamaño de paso temporal
  t = linspace(t0,tfinal,N+1);  % vector de nodos
  y = u0;                       % condición inicial
  % Bucle con evolución temporal
  for i = 1:N
    K1 = feval(f,y(:,i),t(i));
    K2 = feval(f,y(:,i)+h*K1/2,t(i)+h/2);
    K3 = feval(f,y(:,i)+h*K2/2,t(i)+h/2);
    K4 = feval(f,y(:,i)+h*K3,t(i)+h);
    y = [y,(y(:,i)+h*(K1+2*K2+2*K3+K4)/6)];
  endfor
endfunction