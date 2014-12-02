function A = degSet(q, l)
%DEGSET creates the integer matrix for the degree-constrained set
%   A = degSet(q,l)
%
%   Input arguments:
%     q - numer of variables
%     l - total-degree
%
%   Output arguments:
%     A - integer matrix for all multidegrees of total degree l, 
%         such that A ~ { a : |a| = l }.
%         a graded order is used (similar to grlex)
%
%   For example, degSet(3,2) returns 
%     2     1     1     0     0     0
%     0     1     0     2     1     0
%     0     0     1     0     1     2
%
%   See also trgSet   
  if q == 1
    A = l;
    return;
  end
  
  A = trgSet(q-1,l);
  A = [l - sum(A,1);A];
end