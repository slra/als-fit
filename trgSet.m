function A = trgSet(q, l)
%TRGSET creates the integer matrix for the triangular set
%   A = trgSet(q,l)
%
%   Input arguments:
%     q - numer of variables
%     l - total-degree
%
%   Output arguments:
%     A - integer matrix for all multidegrees of total degree  <= l, 
%        such that A ~ { a : |a| <= l }
%         a graded order is used (similar to grlex)
%
%   For example, trgSet(2,3) returns 
%     0     1     0     2     1     0     3     2     1     0
%     0     0     1     0     1     2     0     1     2     3
%   See also degSet, boxSet
  if q == 1 
    A = 0:l;
    return;
  end
  
  A = [];
  for k=0:l
    A = [A degSet(q,k)];
  end
end