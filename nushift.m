function B = nushift(C, H, nu)
%NUSHIFT computes the nu-shift of a (moment) array
%   B = nushift(C, H, nu)
%
%   Input arguments:
%     C  - q-way (moment) array
%     H  - the table of shift coefficients 
%         (normally, coefficients of Hermite polynomials)
%     nu - the integer vector of length q corresponding to the shift
%
%   Output arguments:
%     B - the nu-shifted array of the same size
  B = zeros(size(C));
  sizeIdx = size(C)-nu'-1;
  if all(sizeIdx >=0)
    idx = boxSet(sizeIdx) + 1;
    for i=1:size(idx,2)
      idxCell = num2cell(idx(:,i));
      idxnuCell = num2cell(idx(:,i)+nu);
      B(idxnuCell{:}) = C(idxCell{:}) * prod(H(sub2ind(size(H), nu+1, idx(:,i))));
    end
  end  
end