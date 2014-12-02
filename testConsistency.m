clear all;
  
M = 100;
%Define the parametric curve
name = 'circle2';
A = trgSet(2, 2);
theta = [0 -2 0 1 0 1]';
f = @(t) ([1+sin(2*pi*t(:)) cos(2*pi*t(:))])';
g = @(N) (f(linspace(0,1,N)));
sigma = 0.06

testCurveFitting(A, theta, findExtendedBox(f, 100, 3 * sigma), 100, sigma, 'tn012', [name '_uniform']); 

Ns = 2.^(7:17);
rms_hats = testSpreadNs(name, A, theta, g, M, Ns, sigma * ones(size(Ns)), 1);
loglog(Ns, rms_hats(1,:), 'g-x', Ns, rms_hats(2,:), 'r-+');
xlabel('N');  ylabel('s(theta, N)');

%Define the parametric curve
name = 'eight';
A = trgSet(2,4);
theta = [0 0 0 -1 0 1 0 0 0 0 1 0 0 0 0];
f = @(t) ([sin(2*pi*t(:)) sin(2*pi*t(:)).*cos(2*pi*t(:))])';
g = @(N) (f(linspace(0,1,N)));
sigma = 0.01;

testCurveFitting(A, theta, findExtendedBox(f, 100, 3 * sigma), 100, sigma, 'tn012', [name '_uniform']); 

Ns = 2.^(7:17);
rms_hats = testSpreadNs([name 'Ns'], A, theta, g, M, Ns, sigma * ones(size(Ns)), 1);
figure; loglog(Ns, rms_hats(1,:), 'g-x', Ns, rms_hats(2,:), 'r-+');
xlabel('N');  ylabel('s(\theta, N)');
figure; loglog(Ns, rms_hats(3,:), 'b-+');
xlabel('N'); ylabel('s(\sigma^2, N)');

rms_hats = testSpreadNs([name 'Ns'], A, theta, g, M, Ns, sigma * ones(size(Ns)), 2);
loglog(Ns, rms_hats(1,:), 'g-x', Ns, rms_hats(2,:), 'r-+');
xlabel('N');  ylabel('s(\theta, N)');
loglog(Ns, rms_hats(3,:), 'b-+');
xlabel('N'); ylabel('s(\sigma^2, N)');

N = 1000;
sigmas = 1e-6 * 2.^(0:13);
rms_hats = testSpreadNs([name 'Sigmas'], A, theta, g, M, N * ones(size(sigmas)), sigmas, 2);
figure; loglog(sigmas, rms_hats(1,:)./sigmas, 'g-x', sigmas, rms_hats(2,:)./sigmas, 'r-+');
xlabel('sigma');  ylabel('s(\theta, N)');
figure; loglog(sigmas, rms_hats(3,:), 'b-+');
xlabel('sigma'); ylabel('s(\hat\sigma^2, N)');