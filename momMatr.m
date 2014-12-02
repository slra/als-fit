function M = momMatr(D, A)
%MOMMATR computes the moment array for data points
%   M = momMatr(D, A)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%     D - (q x N) matrix of data points
%
%   Output arguments:
%     M - q-way array of moments, such that
%                           __N
%     M(i_1+1,..., i_q+1) = \    D(1,j)^(i_1) *  *  D(q,j)^(i_q)
%                           /_j=1
%
%     The moments are only computed for [i_1,...,i_q]' = A(:,k)
  degs = sum(A, 1);  mCoefDimsMin = max(A, [], 2)'+1;
  mCoefDims = mCoefDimsMin;
  
  maxSz = max(mCoefDimsMin);
  nDim = size(D,1);
  vandmats = zeros(size(D,2),maxSz,nDim);
  for i=1:size(D,1)
    vandmats(:,1:mCoefDimsMin(i),i) = bsxfun(@power, D(i,:)', 0:(mCoefDimsMin(i)-1));
  end
  
  M = zeros(mCoefDims);
  for i=1:size(A,2)
    Acell = num2cell(A(:,i)+1);
    M(Acell{:}) = sum(prod(vandmats(:, sub2ind([maxSz,nDim], A(:,i)+1, (1:nDim)')), 2));
  end
end
