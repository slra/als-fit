function A = boxSet(gamma)
%BOXSET creates the integer matrix for box set
%   A = boxSet(gamma)
%
%   Input arguments:
%     gamma - vector of sizes of length q
%
%   Output arguments:
%     A - integer matrix for box set in the lexicographical order, 
%          such that  A ~ {0,...,gamma(1)} x ... {0,...,gamma(q)}
%
%   For example, boxSet([2 2]) returns
%     0     1     2     0     1     2     0     1     2
%     0     0     0     1     1     1     2     2     2
  ind = cell(1,length(gamma));
  [ind{:}] =  ind2sub(gamma+1, (1:prod(gamma+1))');
  A = cell2mat(ind)' - 1;
end