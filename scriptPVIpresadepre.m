1;
%
function udot = presadepre(u,t) 
a=1; b=1; c=1; d=1;udot(1,1) = a*u(1)-b*u(1)*u(2); 
udot(2,1) = -c*u(2)+d*u(1)*u(2);endfunction
t = linspace(0,10,100)';
sol = lsode("presadepre",[0.5;0.5],t);

plot(t,sol')

fontsize=16;
fontname='Arial';
%ley=legend('example');
%set(ley, "fontsize", fontsize, 'FontName', fontname)
%text (2, 8, "arbitrary text");
set(gca(), 'tickdir','in');
%set(gca(), 'tickdir','out','xtick',[1:15]);
set([gca; findall(gca, 'Type','text')], 'FontSize', fontsize, 'FontName', fontname);
set([gca; findall(gca, 'Type','line')], 'linewidth', 3);
saveas(1, "../graficas/Cap9-presadepre1.pdf");


plot(sol(:,1),sol(:,2))

fontsize=16;
fontname='Arial';
%ley=legend('example');
%set(ley, "fontsize", fontsize, 'FontName', fontname)
%text (2, 8, "arbitrary text");
set(gca(), 'tickdir','in');
%set(gca(), 'tickdir','out','xtick',[1:15]);
set([gca; findall(gca, 'Type','text')], 'FontSize', fontsize, 'FontName', fontname);
set([gca; findall(gca, 'Type','line')], 'linewidth', 3);
saveas(1, "../graficas/Cap9-presadepre2.pdf");
hold off