function h = figTightBox(box, height)
%FIGTIGHTBOX create figure of given size with equal axis in a tight box
%   h = figTightBox(box, height)
%
%   Input arguments:
%     box - the box [left right bottom top]
%     height - (q x N) matrix of data points
%
%   Output arguments:
%     h - handle of the created figure
  h = figure;
  if (nargin < 2)
     height = 400;
  end    
  axis equal
  axis(box)
  set(gca,'LooseInset',get(gca,'TightInset'))
  pos = get(gcf, 'Position');
  set(gcf, 'Position', [pos(1) pos(2) (box(2)-box(1))* height / (box(4)-box(3)), height]); %<- Set size
end