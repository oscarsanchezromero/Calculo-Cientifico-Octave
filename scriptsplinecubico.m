% En este script interpolamos la función de Runge f(x)=1/(1+25*x^2), en el 
% intervalo [-1,1], con 9 nodos, mediante un spline cúbico sujeto. 

% Datos de interpolación 
n = 8;
x = linspace(-1,1,n+1);
y = 1./(1+25*x.^2);
% Datos de la derivada en primer y último nodo
d0 = 0.073964497;
dn = -0.073964497;
% Vectores de diferencias 
h = diff(x);
w = diff(y)./h;
% Matriz y término independiente del sistema
A = diag(2./h(1:n-1)+2./h(2:n),0)+diag(1./h(2:n-1),1)+diag(1./h(2:n-1),-1);
b = 3*(w(1:n-1)./h(1:n-1)+w(2:n)./h(2:n));
b(1) = b(1)-d0./h(1);  
b(end) = b(end)-dn./h(end);
% Cálculo del vector de derivadas d
d = A\b';
d = [d0,d',dn];
% Construcción del spline
z = (w-d(1:n))./h;
t = (d(1:n)-2*w+d(2:n+1))./(h.^2);
s = zeros(n,4);
for i = 1:n
  s(i,:) = [0,0,0,y(i)]+[0,0,d(i)*poly([x(i)])]+[0,z(i)*poly([x(i),x(i)])]+t(i)*poly([x(i),x(i),x(i+1)]);
endfor
% Representación gráfica de la función de Runge y del spline
plotspline(s,x)
hold on
plot(x,y,'.*r','markersize',12)
