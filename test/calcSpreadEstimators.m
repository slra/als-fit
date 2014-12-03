function [rms_hat] = calcSpreadEstimators(A, th0, g, M, N, sigma, tnoise)
  th0 = th0 / norm(th0, 2);
  
  n_est = 3; % Number of estimators
  theta_est = zeros(length(th0), n_est);
  rms_hat = zeros(n_est+1, 1);
  
  D0 = g(N); 
  for i=1:M
    if tnoise < 2 % Gaussian noise
      D = D0+randn(size(D0))*sigma;
    else          % Uniform noise 
      D = D0+(rand(size(D0))-0.5)*sigma*sqrt(12);
    end    
    th_hat(:,1) = algebraicFit(D, A);
    [th_hat(:,2), shat] = alsUsigmaFit(D, A);
    th_hat(:,3) = alsKsigmaFit(D, A, sigma);

  
    for i=1:n_est
      th_hat(:,i) = th_hat(:,i) / norm(th_hat(:,i), 2);  
      rms_hat(i) = rms_hat(i) + (1 - (th_hat(:,i)'*th0(:)).^2);
    end
    rms_hat(n_est+1) = rms_hat(n_est+1) + ((shat^2 - sigma^2)^2); 
  end
  
  for i=1:n_est+1
    rms_hat(i) = sqrt(rms_hat(i) / M);
  end
end


