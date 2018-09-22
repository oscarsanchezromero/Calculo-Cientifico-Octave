1;
% Declaración de datos
function y = fun(x) 
  y = x+exp(2*x);
endfunction
a = -1;
b = 0;
tol = 10^(-2);
% Iniciación de variables
maxIter = ceil((log(b-a)-log(tol))/log(2))-1;
n = 0; 
c = (a+b)/2;
yc = fun(c);
fprintf('n      intervalo                  c_n        f(c_n) \n')
fprintf('%i     [%f,%f]     %f     %f \n', n, a, b, c, yc)
ya = fun(a);
yb = fun(b);
% Bucle para n>=1
for n = 1:maxIter
  if yc == 0 % La raíz es c
    a = c;
    b = c;
    fprintf('%i     [%f,%f]     %f     %f \n', n, a, b, c, yc)
    break
  elseif yb*yc>0 % La raíz está en [a,c]
    b = c;
    yb = yc;
  else % La raíz está en [c,b]
    a = c;
    ya = yc;
  endif
  c = (a+b)/2;
  yc = fun(c);
  fprintf('%i     [%f,%f]     %f     %f \n', n, a, b, c, yc)
endfor