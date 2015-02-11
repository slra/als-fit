function A = degSet(q, l)
%DEGSET creates an integer matrix for the degree-constrained set
%   A = degSet(q,l)
%
%   Input arguments:
%     q - numer of variables
%     l - total-degree
%
%   Output arguments:
%     A - integer matrix for all multidegrees of total degree l, 
%         such that A ~ { a : |a| = l }.
%
%        Degree negative lexicographic order ("degneglex") is used, i.e.
%          (a_1,...,a_q) < (b_1,..., b_q) if
%            either (a_1 + ... + a_q) <  (b_1 + ... + b_q)
%            or there exists i, 1 <= i <= q such that
%               a_1 = b_1, ..., a_{i-1} = b_{i-1}, a_i > b_i   
%
%        This order permits a recursive generation.
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