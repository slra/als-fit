function H = deconvTable(moments)
%DECONVTABLE computes the deconvolution polynomials for arbitrary measure
%   H = deconvTable(l)
%
%   Input arguments:
%     moments - the sequence of moments for a measure
%
%   Output arguments:
%     P - (l+1)x(l+1) matrix such that
%         P(i,j) = 0, if  i + j > l+2, and
%         p_k(s,j)  = P(1,s+1) s^0 j^k + ... + P(s+1,1) s^k j^0,
%         are the deconvolution polynomials for the given measure
%
% See also nushift
  moments = moments(:);
  l = length(moments) - 1;
  scale = factorial(0:l)';
  M = toeplitz(moments./scale, [moments(1); zeros(l,1)]);
  
  H = (scale * (1./scale') ) .* pinv(M);
  H = shiftTriangleUp(H);  
end
