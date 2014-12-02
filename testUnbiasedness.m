
A = trgSet(2, 2)


testCurveFitting([-1 0 0 1 0 1], [-1.2 1.2 -1.2 1.2], 20, trgSet(2,2), 0.06, 'tn0123')

N = 20;
Ms = 100:200:2000;
sigmaMean = zeros(2, length(Ms));
sigmaStd = zeros(2, length(Ms));

sigma = 0.06;
X = [sin(linspace(0,2*pi, N )) ; cos(linspace(0,2*pi, N ))];
 


theta = [-1 0 0 1 0 1]';
thetamean2 = [0 0 0 0 0 0]';
thetamean3 = [0 0 0 0 0 0]';


for j=1:length(Ms)
  M = Ms(j)  
  
  for i=1:M
    Xn = X+randn(size(X))*sigma;
    [theta2,sh2] = algebraicFit(Xn, A); 
    theta2 = theta2 /norm(theta2);
    [theta3,sh3] = alsUsigmaFit(Xn, A); 
    theta3 = theta3 /norm(theta3);

    thetamean2 = thetamean2 + (theta2-theta).^2;
    thetamean3 = thetamean3 + (theta3-theta).^2;
  end    
  thetamean2 = thetamean2 / M;
  thetamean3 = thetamean3 / M;
  
  sigmaMean(1,j) = norm(thetamean2 - theta, 2);
  sigmaMean(2,j) = norm(thetamean3 - theta, 2);
end

plot(Ms,sigmaMean(1,:), 'b-', Ms,sigmaMean(2,:), 'r-')
