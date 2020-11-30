% Calcula una aproximación por diferencias finitas centradas del 
% PVF lineal: x''(t) = q(t)x(t) + p(t)x'(t)+ r, t en [a,b],
%             x(a)=alpha, x(b)=beta
% Definimos los datos del problema
a = 1;  alpha = 1;
b = 4;  beta = 4^(1/3)+log(4);
q = @(t) 1./(t.^2);         % Funciones p(t), q(t) y r(t)
p = @(t) -11./(3*t) ;       % (evaluables sobre vectores)
r = @(t) 8./(3*t.^2)-log(t)./(t.^2);
% Definimos la discretizacion
N = 30;               % Número de nodos interiores (ha de ser >2)
h = (b-a)/(N+1); 
t = linspace(a,b,N+2);% Nodos, incluidos a y b
tint = (t(2:N+1))';   % Vector columna de N nodos interiores 
% Definición de la matriz A de coeficientes
B = [1+p(tint)*h/2,-2-q(tint)*h^2,1-p(tint)*h/2]./h^2;
A = spdiags(B, [1 0 -1], N, N)';
% Definición del vector de términos independientes
rhs = r(tint);
rhs(1) = rhs(1)-alpha*B(1,1);
rhs(N) = rhs(N)-beta*B(N,3);
% Resolución del sistema
y = A\rhs;  
% Representación de las soluciones numérica y exacta
soln = [alpha; y; beta];
plot(t,soln,'*',t,t.^(1/3)+log(t))
