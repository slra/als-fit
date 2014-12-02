function h = quasiHankel(B, A, A2)
%QUASIHANKEL creates a quasi-Hankel matrix from the array
%
%   h = quasiHankel(B, A, A2)
%
%   Input arguments:
%     B -  initial part of the infinite array B
%     A -  matrix of multidegrees
%     A2 - (optional) second matrix of multidegrees :
%          for non-symmetric quasi-Hankel matrices
%
%   Output arguments:
%     h - the quasi-Hankel matrix  
  if (nargin < 3)
    A2 = A;
  end    
  h = zeros(size(A,2), size(A2,2));
  for i=1:size(h,1)
    for j=1:size(h,2)
      Acell = num2cell(A(:,i) + A2(:,j)+1);
      h(i,j) = B(Acell{:});
    end
  end
end