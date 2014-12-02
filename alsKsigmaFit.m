function [theta, sh] = alsKsigmaFit(D, A, sigma, invw)
%ALSKSIGMAFIT computes the ALS estimator with known variance (ALS1)
%   [theta, sh] = alsKsigmaFit(D, A, sigma, invw)
%
%   Input arguments:
%     D - (q x N) matrix of data points
%     A - (q x m) matrix of multidegrees
%     sigma - the known standard deviation     
%     invw - inverse vector of weights in the weighted 2-norm (optional)
%         by default, the Bombieri norm is used (invw = multinomial(A))
%
%   Output arguments:
%     theta - the estimated parameters
%     sh    - the estimated variance
  if (nargin < 4)
    invw = multinomial(A);    
  end
  MM = momMatr(D, boxSet(2 * max(A, [], 2)'));
  Msigma = MM;
  maxdeg = max(sum(A));
  H = hermTable(maxdeg * 2);
  for k=1:maxdeg
    Msigma = Msigma + sigma^(2 * k) * momShiftedBasis(MM, H, k);
  end
  Lambda_diag = sqrt(invw(:));
  psi_sigma = (Lambda_diag * Lambda_diag') .* quasiHankel(Msigma, A);
  [theta, sh] = eigs(psi_sigma, 1, 'sa');
  theta = Lambda_diag .* theta;
end