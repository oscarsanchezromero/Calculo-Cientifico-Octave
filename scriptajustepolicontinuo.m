% Script para calcular la aproximación por mínimos cuadrados 
% continua de la función seno, en [0,pi], mediante polinomios 
% de grado menor o igual que un valor prefijado.
% Definición del polinomio t^i (tomando i como parámetro).
1;
function y = pol(x,i) y = x.^i; endfunction;
gr = 3;        % Elección del grado del polinomio.
vgr = gr:-1:0; % Vector de grados en el polinomio.
% Construcción de la matriz de coeficientes del sistema.
gramm = quadv(@(x) pol(x,vgr)'*pol(x,vgr),0,pi)
% Costrucción del vector de términos independientes.
b = quadv(@(x) pol(x,vgr)'*sin(x),0,pi)
% Resolución del sistema y expresión del polinomio obtenido.
p = gramm\b;
polyout(p,'x')
% Gráfica comparativa del seno y el polinomio obtenido.
x = linspace(0,pi,100); 
plot(x,sin(x),'g',x,polyval(p,x),':k');
legend('Seno','Aproximacion'); 
axis([0 pi 0 1.05]);