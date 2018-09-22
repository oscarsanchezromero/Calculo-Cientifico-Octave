% Definiciones: longitud, número de nodos interiores y matriz
L = 5;  n = 50;                   
v = [-2,1,zeros(1,n-2)];  A = toeplitz(v);     
% Cálculo de valores propios y localización del menor en |.|
[P,D] = eig(A);	
[lambda,posicion] = max(diag(D));  % Valores propios negativos  
vector = P(:,posicion); 
% Representación gráfica de la deformación
y = linspace(0,L,n+2);     
deformacion = [0,vector',0]; 
plot(deformacion,y)
texto = sprintf("fuerza = %f", lambda*(n+1)^2/L^2); 
xlabel(texto);
axis([-3,3,0,L]);