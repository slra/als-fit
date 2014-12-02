% generate table of coefficients of the Hermite polynomials (for the paper)
d = 8;
H = [hermTable(d)];
H(hankel(0:d,d:2*d) > d) = NaN;
dlmwrite('runGenTable.out.txt', H, ' ');
