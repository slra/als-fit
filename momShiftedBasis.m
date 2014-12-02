function Mk = momShiftedBasis(M, H, k)
%MOMSHIFTEDBASIS computes the $k$-th basis moment array
%   Mk = momShiftedBasis(M, H, k)
%
%   Input arguments:
%     M - Original moment array
%     H - coefficients of shifts (see nushift)
%     k - index k 
%
%   Output arguments:
%     Mk - the shifted moment array
  d = ndims(M);
  B = degSet(d,k);
  Mk = zeros(size(M));
  for i=1:size(B,2)
    Mk = Mk + nushift(M, H, 2 * B(:,i));
  end
end