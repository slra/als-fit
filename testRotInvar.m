% Test rotation invariance and Bombieri norm
alpha =2 * pi /3;
load('Dtestrot.txt', 'Dtestrot', '-ascii');
transf2 = { [1 0; ...
             0 1], ...
            [cos(alpha) sin(-alpha); ...
             sin(alpha) cos(alpha)] };

A = trgSet(2,2);
olivecol = [0.75 0.75 0];
box =   [-3 2.5 -0.8 2.2]; 
h = figTightBox(box, 260);
hold on;
for j = 1:2
  D = transf2{j} * Dtestrot;  
  plot(D(1,:), D(2,:), 'o', 'markersize', 7, 'LineWidth', 2);
  plotModel(A, algebraicFit(D, A), box, 'color', olivecol, 'LineWidth', 2); 
  plotModel(A, algebraicFit(D, A, ones(1, size(A,2))), box, 'color', [0 0.75 0.75], 'LineWidth', 2);
  plotModel(A, alsUsigmaFit(D, A), box, 'color', 'r', 'LineWidth', 2);
end  
title('');
hold off;
save2pdf('rotinvar.pdf', h)
