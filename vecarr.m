function cv = vecarr(C, A)
%VECARR vectorizes the array C along the matrix of multidegrees A
%   cv = vecarr(C, A)
%
%   Input arguments:
%     C - q-way array
%     A - (q x m) matrix of multidegrees
%
%   Output arguments:
%     cv - (m x 1) vectorization of the array C along A, i.e.
%        cv(i) = C(A(1,i)+1, ..., A(q,i)+1)
%
%        1 is added because arrays in MATLAB are indexed from 1
%  
%   See also devecarr
  Acell = num2cell(A+1, 2);
  cv = C(sub2ind(size(C), Acell{:}));
end