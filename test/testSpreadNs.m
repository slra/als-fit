function [rms_hats] = testSpreadNs(name, A, theta, g, M, Ns, sigmas, tnoise)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  rms_hats = zeros(4, length(Ns));
  
  teststr = ['Testing consistency in ''' name ''' example, noise type #' num2str(tnoise) ': '];
  hbar = waitbar(0, [teststr num2str(0) '%']);
  for j=1:length(Ns)
    rms_hats(:,j) = calcSpreadEstimators(A, theta, g, M, Ns(j), sigmas(j), tnoise);
    waitbar(j / length(Ns), hbar,  [teststr num2str(round(100*j / length(Ns))) '%']);
  end
  close(hbar);

  filename = [name '_noise' num2str(tnoise) '.txt'];
  f = fopen(filename, 'w');
  headers = {'Ns', 'sigmas', 'ols', 'als2', 'als1', 'sigmahat'};
  fprintf(f, '%s\t', headers{:});
  fprintf(f, '\n');  
  dlmwrite(filename, [Ns ; sigmas; rms_hats]', '-append', 'delimiter', '\t');  
end

