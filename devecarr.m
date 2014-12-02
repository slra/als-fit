function C = devecarr(cv, A, mCoefDims)
%DEVECARR creates an array from the multidegrees A and the vector of values
%   C = devecarr(cv, A, mCoefDims)
%
%   Input arguments:
%     cv        - vector of length m
%     A         - (q x m) matrix of multidegrees
%     mCoefDims - (optional) vector of the desired array sizes
%                 if not supplied, the minimal array sizes are used
%
%   Output arguments:
%     C - (mCoefDims(1) x ...x mCoefDims(q)) array, such that
%        C(A(1,i)+1, ..., A(q,i)+1) = cv(i)
%
%        1 is added because arrays in MATLAB are indexed from 1
%  
%   See also vecarr
  mCoefDimsMin = max(A, [], 2)'+1;
  if (~exist('mCoefDims', 'var'))
    mCoefDims = mCoefDimsMin;
  end
  if (prod(double(mCoefDims >= mCoefDimsMin)) == 0)
    error('Insufficient sizes of coefficient array specified');
  end

  Acell = num2cell(A+1, 2);
  C = zeros(mCoefDims);
  C(sub2ind(size(C), Acell{:})) = cv(:);
end