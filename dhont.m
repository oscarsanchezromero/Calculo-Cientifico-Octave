function [y,valor] = dhont(votos,n) 
% Reparto proporcional de n escaños según la Ley d'Hont 
% votos = vector fila conteniendo los votos de cada partido
% n = número de escaños a repartir 
% y = número de escaños asignados a cada partido en el mismo 
%     orden que aparecen en votos.
% valor = número de votos resultante para obtener un escaño.
% NOTA: votos ha de ser >=0
% Este programa básico NO contempla los casos de empates 
  a = 1./(1:n);
  x = vec(votos'*a); 
  for i = 1:n
    [valor,p] = max(x);
    x(p) = -1;
  endfor
  m = length(votos);
  x = reshape(x,m,n)';
  x = (x<0);
  y = sum(x);
endfunction