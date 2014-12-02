%ALGEBRAICFIT computes the OLS estimator (algebraic fitting)
%   [theta, sh] = algebraicFit(D, A, invw, type)
%
%   Input arguments:
%     D - (q x N) matrix of data points
%     A - (q x m) matrix of multidegrees
%     invw - inverse vector of weights in the weighted 2-norm (optional)
%         by default, the Bombieri norm is used
%     type - 'eigen' (default) or  'svd'
%
%   Output arguments:
%     theta - the estimated parameters
%     sh    - the estimated variance
function [theta, sh] = algebraicFit(D, A, invw, type)
  if (nargin < 3)
    invw = multinomial(A);    
  end
  
  Lambda_diag = sqrt(invw(:));
  if (nargin < 4 || strcmp(type, 'eigen'))
    MM = momMatr(D, boxSet(2 * max(A, [], 2)'));
    Psi = (Lambda_diag * Lambda_diag') .* quasiHankel(MM, A);
    [theta, sh] = eigs(Psi, 1, 'sa');
  else
    Phi = diag(Lambda_diag) * vandMat(D, A);
    [U,S,~] = svd(Phi);
    theta = U(:,end);
    sh = S(end,end)^2;
  end 
  theta = Lambda_diag .* theta;
end
