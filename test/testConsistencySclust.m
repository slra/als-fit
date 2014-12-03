% Subspace clustering example
clear all;
  
M = 100;
name = 'subspace';

% True directions
B = [0 1 0;
     1 1 0;
     1 1 1];
B = diag(diag(B * B') .^(-0.5)) * B; 

% Create a product of linear forms
arrB = devecarr(B(1,:), eye(3));
for j=2:size(B,1)
  arrB = multPolynomials(arrB, devecarr(B(j,:), eye(3)));  
end    

A = degSet(3, 3);
theta = vecarr(arrB, A);
sigma = 0.05;

% plot an example
D = sampleSubspaces(B,1000);
thetaPolyEvaluate(D,A,theta);
D = D + randn(size(D)) * sigma;
h = figure;
scatter3(D(1,:), D(2,:), D(3,:));
axis equal;
xlabel d1;
ylabel d2;
zlabel d3;
view(-117,26);
save2pdf('subspace.pdf');


g = @(N) sampleSubspaces(B, N);

Ns = 2.^(7:17);
rms_hats = testSpreadNs([name 'Ns'], A, theta, g, M, Ns, sigma * ones(size(Ns)), 1);
figure; loglog(Ns, rms_hats(1,:), 'g-x', Ns, rms_hats(2,:), 'r-+');
xlabel('N');  ylabel('s(theta, N)');
figure; loglog(Ns, rms_hats(3,:), 'b-+');
xlabel('N'); ylabel('s(sigma^2, N)');

rms_hats = testSpreadNs([name 'Ns'], A, theta, g, M, Ns, sigma * ones(size(Ns)), 2);
loglog(Ns, rms_hats(1,:), 'g-x', Ns, rms_hats(2,:), 'r-+');
xlabel('N');  ylabel('s(theta, N)');
loglog(Ns, rms_hats(3,:), 'b-+');
xlabel('N'); ylabel('s(sigma^2, N)');



