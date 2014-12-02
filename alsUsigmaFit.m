function [theta, sh, evorig] = alsUsigmaFit(D, A, type)
%ALSUSIGMAFIT computes the ALS estimator with unknown variance (ALS2)
%   [theta, sh] = alsUsigmaFit(D, A, type)
%
%   Input arguments:
%     D     - matrix of data points
%     A     - matrix of multi degrees
%     type  - type of the polynomials used, either:
%                'hermite' for Hermite polynomials (default)
%                'chebyshev' for Chebyshev polynomials
%                'uniform' for deconvolution polynomials
%
%   Output arguments:
%     theta  - the estimated parameters
%     sh     - the estimated variance
%     evorig - original eigenvalues (for debugging purposes)
%
%   See also algebraicFit, alsKsigmaFit
  M = momMatr(D, boxSet(2 * max(A, [], 2)'));
  maxdeg = max(sum(A));
  
  if (nargin < 3 || strcmp(type, 'hermite'))
    H = hermTable(maxdeg*2);
  else
    if (strcmp(type, 'chebyshev'))
      H = chebTable(maxdeg*2);
    else
      l = maxdeg*2;
      moments = 1./((1:l+1).*(2.^(0:l)));
      moments(2:2:end) = 0;
      H = deconvTable(moments);
    end
  end  
  
  psi_array = cell(maxdeg+1,1);
  psi_array{1} = quasiHankel(M, A);
  for k=1:maxdeg
    psi_array{k+1} = quasiHankel(momShiftedBasis(M,H,k), A);
  end
  
  [evec, ev] = polyeig(psi_array{:});
  evorig = ev;
  ev(find(ev < -1e-14)) = inf;
  [sh2, min_ind]  = min(ev); 
  sh = sqrt(sh2); 
  theta = evec(:, min_ind); 
end