% Calcula una aproximación por diferencias finitas centradas del 
% PVF: x''(t) = r(t), t en [a,b],  x(a) = alpha, x(b) = beta
% Datos del problema
a = 0; b = 4; 
alpha = 1; beta = 2;
r = @(t) -cos(t);     % Función r(t) (evaluable sobre vectores)
% Definimos la discretización
N = 30;               % Número de nodos interiores (ha de ser >2)
h = (b-a)/(N+1); 
t = linspace(a,b,N+2);% Nodos, incluidos a y b
% Definición de la matriz de coeficientes
aux = ones(N,1)/h^2;
A = spdiags([aux -2*aux aux],[-1 0 1],N,N);
% Definición del vector de términos independientes
tint = (t(2:N+1))';   % Lista de N nodos interiores    
rhs = r(tint);        % rhs será el término independiente
rhs(1) = rhs(1)-alpha/h^2;
rhs(N) = rhs(N)-beta/h^2;
% Resolución del sistema
y = A\rhs;  
% Representación de la solución numérica y la exacta
y = [alpha; y; beta];
plot(t,y,'*',t,alpha -1+(beta-cos(4))*t/4+cos(t))