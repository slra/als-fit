function [h, h2,hvec] = testCurveFitting(A, th0, box, N, sigma, plotstr, name, Dtilde)
  rand('seed', 0), rand('seed',0)
  
  D0 = samplePointsInBox(A, th0, N, box); 
  if (nargin < 8)
    Dtilde = sigma * randn(size(D0));
  end    
  D  = D0 + Dtilde;
  
  h = figTightBox(box, 300); 
  hold on

  olivecol = [0.5 0.5 0];
  browncol = [1 0.75 0];
  
  if (~isempty(strfind(plotstr, 'n')))
    plot(D(1,:), D(2,:), 'o', 'markersize', 7, 'LineWidth', 2); 
  end  
  %hold on; 
  if (~isempty(strfind(plotstr, 't')))
    plot(D0(1,:), D0(2,:), 'x', 'markersize', 7, 'LineWidth', 2, 'color', 'k'); 
  end  

  if (~isempty(strfind(plotstr, '0')))
    plotModel(A, th0, box, 'LineStyle', '-', 'color', 'k', 'LineWidth', 2); 
  end
  if (~isempty(strfind(plotstr, '1')))
    plotModel(A, algebraicFit(D, A), box, 'LineStyle', '--', 'color', olivecol, 'LineWidth', 2); 
  end  
  if (~isempty(strfind(plotstr, '2')))
    plotModel(A, alsUsigmaFit(D, A), box, 'LineStyle', '--', 'color', 'r', 'LineWidth', 2); 
  end  
  if (~isempty(strfind(plotstr, '3')))
    plotModel(A, geometricFit(D, A), box, 'LineStyle', '--', 'color', 'm', 'LineWidth', 2);
  end  
  title('')  
  xlabel('u')  
  ylabel('v')
  hold off
  
  if (nargin >= 7)
    save2pdf([name '.pdf'], h);
  end   
end