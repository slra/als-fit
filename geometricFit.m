function [theta, Dh] = geometricFit(D, A, thini)
%GEOMETRICFIT computes the OR estimator (geometric fitting)
%   [theta, sh] = geometricFit(D, A, thini)
%
%   Input arguments:
%     D - (q x N) matrix of data points
%     A - (q x m) matrix of multidegrees
%     thini - initial approximation for theta
%
%   Output arguments:
%     Dh    - the estimated data points
  [q, N] = size(D); 
  nt = size(A, 2);
  if nargin < 3
    thini = algebraicFit(D, A);
  end 
  xini = [D(:); thini(:)];
  Dh = @(x) reshape(x(1:(q * N)), q, N); 
  th = @(x) reshape(x((q * N + 1):end), nt, 1);
  
  prob = optimset(); 
  prob.solver = 'fmincon';
  prob.options = optimset('disp', 'off'); 
  prob.objective = @(x) norm(D - Dh(x), 'fro');
  prob.nonlcon   = @(x) deal([], ...
           [thetaPolyEvaluate(Dh(x), A, th(x))', th(x)' * th(x) - 1]);
  prob.x0 = xini;
  [x, fval, flag, info] = fmincon(prob); info.M = fval; Dh = Dh(x); theta = th(x);
end