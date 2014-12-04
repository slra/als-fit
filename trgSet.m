function A = trgSet(q, l)
%TRGSET creates the multidegree matrix for the triangular set
%   A = trgSet(q,l)
%
%   Input arguments:
%     q - numer of variables
%     l - total-degree
%
%   Output arguments:
%     A - integer matrix for all multidegrees of total degree  <= l, 
%        such that A ~ { a : |a| <= l }
%        A graded order is used, induced by degSet.
%        (The multidegrees are ordered by total degree, and then by 
%         the order defined in degSet.)
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