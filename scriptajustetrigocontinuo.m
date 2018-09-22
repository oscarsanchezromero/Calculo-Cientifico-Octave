% Script para calcular la aproximación trigonométrica por 
% mínimos cuadrados continua de la función x^2 en [-1,1].
% Definición de una función vectorial, que contiene a la base,
% evaluable sobre vectores columna.
1+1;
function y = basetrig(x) 
  y = [1+0*x,sin(x),cos(x)];
endfunction;
% Construcción  del sistema.
gramm = quadv(@(x) basetrig(x)'*basetrig(x),-1,1);
% Costrucción del vector de términos independientes.
b = quadv(@(x) basetrig(x)'*x.^2,-1,1);
% Resolución del sistema y expresión de la aprox obtenida.
c = gramm\b
% Gráfica comparativa de la identidad y su aprox trigonométrica.
x = linspace(-1,1,100)'; 
plot(x,x.^2,'g',x,basetrig(x)*c,':k');
legend('Parabola','Aproximacion'); 
axis([-1 1 -0.05 1.05]);