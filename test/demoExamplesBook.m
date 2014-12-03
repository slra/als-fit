clear all

testCurveFitting(trgSet(2,2), [1 0 -1 1 0 0], [-1 1 1 2.2], 20, 0.1, 'tn012', 'parabola');
[~,~,hvec]=testCurveFitting(trgSet(2,2), [1 0 0 1 0 -1], [-2 2 -2 2], 20, 0.3, 'tn012', 'hyperbola');
%save2pdf('polyeig',hvec)
%testCurveFitting(trgSet(2,3), [-1 3 0 -3 0 1 -1 0 1 0], [-1 0 -10 10], 25, 0.02, 'tn0123', 'cissoid'); % unscaled
% testCurveFitting(trgSet(2,3), [0 0 0 0 -3 0 1 0 0 1], [-2 2 -2 2], 25, 0.1, 'tn012', 'folium'); %original 
A = trgSet(2,3);
theta = [-1 3 0 -3 0 400 -1 0 400 0];
[~,~,hvec]=testCurveFitting(A(:, theta~=0), theta(:, theta~=0), [-1 0 -0.5 0.5], 25, 0.04, 'tn012', 'cissoid');
theta = [0 0 0 0 -3 0 1 0 0 1];
testCurveFitting(A(:, theta~=0), theta(:, theta~=0), [-2 2 -2 2], 25, 0.2, 'tn012', 'folium'); 
save2pdf('polyeigcissoid',hvec)



%testCurveFitting(trgSet(2,3), [-1 3 0 -3 0 400 -1 0 400 0], [-1 0 -0.5 0.5], 25, 0.2, 'tn012', 'cissoid');
%testCurveFitting(trgSet(2,3), [-1 0.15 0 -0.0075 0 1 -0.000125 0 0.05 0], [-20 0 -10 10], 25, 0.5, 'tn012', 'cissoid'); 

testCurveFitting(trgSet(2,3), [0 0 0 0 -3 0 1 0 0 1], [-2 2 -2 2], 25, 0.1, 'tn012', 'folium'); 
testCurveFitting(trgSet(2,4), [0 0 0 -1 0 1 0 0 0 0 1 0 0 0 0], [-1.1 1.1 -1 1], 25, 0.01, 'tn0123', 'eight'); 
[~,~,hvec]=testCurveFitting(trgSet(2,4), [0 0 0 -3 0 1 16 0 16 0 -16 0 -32 0 -16], [-.1 .8 -0.5 .5], 25, 0.003, 'tn012', 'limacon'); 

[~,~,hvec]=testCurveFitting(trgSet(2,6), [0 0 0 0 0 0 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 0 1 0 3 0 3 0 1], ...
                 [-1 1 -1 1], 40, 0.002, 'tn012', 'rose'); 
             
N = 40;
sigma = 0.002;
testCurveFitting(trgSet(2,6), [0 0 0 0 0 0 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 0 1 0 3 0 3 0 1], ...
                 [-1 1 -1 1], N, sigma, 'tn0123', 'rose', sigma * sqrt(3) * (2 * rand(2,N)-1));              

% name = 'rose'; 
% N = 30; s = 0.002; 
% deg = 6; syms x y; 
% r = (x^2 + y^2)^3 ...
%     - 4 * x^2 * y^2;
% ax = [-1 1 -1 1];
% test_curve_fitting
testCurveFitting(trgSet(2,3), [0 0 0 0 -3 0 1 0 0 1], [-2 2 -2 2], 25, 0.05, 'tn0123', 'folium'); 
[~,~,hvec]=testCurveFitting(trgSet(2,4), [0 0 0 -3 0 1 16 0 16 0 -16 0 -32 0 -16], [-.1 .8 -0.5 .5], 25, 0.004, 'tn0123', 'limacon'); 
