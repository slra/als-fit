function [F] = thetaPolyEvaluate(D, A, theta)
%THETAPOLYEVALUATE evaluates a polynomial at data points
%   F = thetaPolyEvaluate(D, A, theta)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%     D - (q x N) matrix of data points
%
%   Output arguments:
%     F - (N x 1) vector of evaluations
  F = (theta(:)' * vandMat(D,A))';
end

