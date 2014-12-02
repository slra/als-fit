function V = vandMat(D, A)
%VANDMAT create multivariate Vandermonde matrix
%   V = vandMat(D, A)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%     D - (q x N) matrix of data points
%
%   Output arguments:
%     V - (m x N) matrix such that q-way array of moments, such that
%     V(i,j) =  D(1,j)^A(1,i) *  *  D(q,j)^A(q,i)
  mCoefDimsMin = max(A, [], 2)'+1;
  mCoefDims = mCoefDimsMin;
  
  maxSz = max(mCoefDimsMin);
  nDim = size(D,1);
  vandmats = zeros(size(D,2),maxSz,nDim);
  for i=1:size(D,1)
    vandmats(:,1:mCoefDimsMin(i),i) = bsxfun(@power, D(i,:)', 0:(mCoefDimsMin(i)-1));
  end
  
  V = zeros(size(A,2), size(D,2));
  for i=1:size(A,2)
    V(i,:) = prod(vandmats(:, sub2ind([maxSz,nDim], A(:,i)+1, (1:nDim)')), 2);
  end
end
