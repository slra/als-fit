function [D] = sampleSubspaces(B, N)
%SAMPLESUPBSPACES Summary of this function goes here
  nSubs =  size(B, 1); 
  nDims = size(B, 2);
  
  Bnorm = zeros(nDims, nDims - 1, nSubs); 
  for i=1:nSubs
    Bi = B(i,:);
    Bi = Bi(:);
    [Q, ~] = qr(Bi);
    Bnorm(:,:,i) = Q(:,2:end);
  end    
  
  D = rand(nDims, N);
  D(1,:) = floor(D(1,:) * nSubs) +1;
  D(2:end,:) = D(2:end,:) - 0.5;
  for j=1:size(D,2)
    D(:,j) = Bnorm(:, :, D(1,j))  * D(2:end,j);
  end    
end

