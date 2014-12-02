function C = multPolynomials(B1,B2)
%MULTPOLYNOMIALS multiplies two polynomials 
%   C = multPolynomials(B1,B2)
%
%   Input arguments:
%     B1 - array of coefficients for the first polynomial
%     B2 - array of coefficients for the second polynomial
%
%   Output arguments:
%     C - product of two polynomials (convolution of two arrays)
  C = zeros(size(B1) + size(B2)-1);
  idx1 = boxSet(size(B1) -1);
  idx2 = boxSet(size(B2) -1);
  for i=1:size(idx1,2)
    idxElB1 = num2cell(idx1(:,i) +1);
    for j=1:size(idx2,2)
      idxElC = num2cell(idx1(:,i) + idx2(:,j) +1);
      idxElB2 = num2cell(idx2(:,j) +1);
      C(idxElC{:}) = C(idxElC{:}) + B1(idxElB1{:}) * B2(idxElB2{:});
  end
end
