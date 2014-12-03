% translation/rotation invariance: example from Gander, Golub, Strebel
A = trgSet(2, 2);
olivecol = [0.75 0.75 0];
browncol = [0.6 0.3 0];

Dext = [ 1 2 5 7 9 3 6 8;
         7 6 8 7 5 7 2 4;
         1 1 1 1 1 1 1 1 ];

beta = -pi * 0.25;
% Matrices of transformations
transf = { [1 0 0; ...
            0 1 0], ...
            1.5 * [cos(beta) sin(-beta) 6; ...
                    sin(beta) cos(beta) 3], ...
           [1 0 -13; ...
            0 1 -3],  };
               
box =   [-15 28 -7 18];       
h = figTightBox(box, 260);
hold on;
for j = 1:length(transf)
  D = transf{j} * Dext;  
  plot(D(1,:), D(2,:), 'o', 'markersize', 7, 'LineWidth', 2);
  plotModel(A, algebraicFit(D, A), box, 'color', olivecol, 'LineWidth', 2); 
  plotModel(A, alsUsigmaFit(D, A), box, 'color', 'r', 'LineWidth', 2);
  plotModel(A, alsKsigmaFit(D, A, 0.5), box, 'color', browncol, 'LineWidth', 2);
end  
title('')
hold off;
save2pdf('transrotinvar.pdf', h);