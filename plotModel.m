function H = plotModel(A, theta, rect, varargin)
%PLOTMODEL plots an algebraic curve defined by implicit equation
%   H = plotModel(A, theta, rect, ...)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%     theta - (m) vector of parameters
%     rect - the bounding rectangle
%
%   Output arguments:
%     H - handle of the created plot
  p = @(x,y) thetaPolyEvaluate([x y]', A, theta);
  H = ezplot(p, rect);
  if (nargin > 2)
    for h = H', set(h, varargin{:});
  end
end
  
  