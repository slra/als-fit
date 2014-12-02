function [phi] = monomials2(A)
str = []; q = size(A, 1);
for i = size(A, 2):-1:1
  for k = 1:q, 
    str = sprintf('.* d(%d,:) .^ %d %s', k, A(k,i), str); 
  end
  str = sprintf('; %s', str(4:end));
end
eval(sprintf('phi = @(d) [%s];', str(2:end)))