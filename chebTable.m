function H = chebTable(l)
%CHEBTABLE computes the matrix of coefficients for Chebyshev polynomials
%   H = chebTable(l)
%
%   Input arguments:
%     l - the maximal degree of the polynomial
%
%   Output arguments:
%     H - (l+1)x(l+1) matrix such that
%         H(i,j) = 0, if  i + j > l+2, and
%         h_k(s,j)  = H(1,s+1) s^0 j^k + ... + H(s+1,1) s^k j^0,
%         are homogenized Chebyshev polynomials
%
% See also nushift
  H = zeros(l+1,l+1);
  H(1:2, 1:2) = eye(2);
  for i=2:l
    H(i+1,1:(i+1)) = 2* [0 H(i, 1:i)] - [H(i-1, 1:(i-1)) 0 0];
  end  
  H = shiftTriangleUp(H);  
end
