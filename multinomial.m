function [coefs] = multinomial(A)
%MULTINOMIAL computes the vector of multinomial coefficients
%   [coefs] = multinomial(A)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%
%   Output arguments:
%     coef - (1 x m)  vector of the multinomial coefficients, such that
%                (A(1,i) * ... * A(q,i))!
%     coef(i) = -------------------------
%                 A(1,i)! * ... * A(q,i)!  
  tdegs = sum(A, 1);
  fc = factorial(0:max(tdegs));
  coefs = fc(tdegs+1) ./ prod(fc(A+1), 1);
end

