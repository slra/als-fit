function [D] = samplePointsInBox(A, theta, N, box)
%SAMPLEPOINTSINBOX This function samples points in a box using ezplot
%   F = samplePointsInBox(A, theta, box)
%
%   Input arguments:
%     A - (q x m) matrix of multidegrees
%     theta - (m) vector of parameters
%     N - number of data points 
%
%   Output arguments:
%     D - (q x N) matrix of data points

  h = figure;
  h2 = plotModel(A, theta, box); 
  D = get(h2, 'contourMatrix');
  D = D(:, (D(1,:) >= box(1)) & (D(1,:) <= box(2)) & (D(2,:) >= box(3)) & (D(2,:) <= box(4))); 
  D = D(:, round(linspace(1, size(D, 2), N)));
  close(h);
end

