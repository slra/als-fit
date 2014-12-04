function [box] = findExtendedBox(f, N, add)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
  test =  f(linspace(0,1,N));
  box = [min(test(1,:))-add  max(test(1,:))+add ...
       min(test(2,:))-add  max(test(2,:))+add];
end

