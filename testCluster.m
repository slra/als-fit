fragmentStart('testClusterGenData.in.txt');
N = 20;
N2 = 20;
b1orig = [1,1,1];
b2orig = [1,-1,1];
Nb1 = null(b1orig);
Nb2 = null(b2orig);
X = zeros(3, 2* N2);
X1 = Nb1 * (4 .* (rand(2,N2) - 0.5));
X2 = Nb2 * (4 .* (rand(2,N2) - 0.5));
X = [X1 X2];
fragmentStop();

fragmentStart('testClusterCoefArrays.in.txt');
%test
Cb1 = zeros(2,2,2); Cb1(sub2ind(size(Cb1),[2;1;1],[1;2;1],[1;1;2])) = b1orig;
Cb2 = zeros(2,2,2); Cb2(sub2ind(size(Cb2),[2;1;1],[1;2;1],[1;1;2])) = b2orig;
Cc = multPolynomials(Cb1,Cb2);
b1 = vecarr(Cb1, degSet(3,1));
b2 = vecarr(Cb2, degSet(3,1));
A = degSet(3, 2);
c = vecarr(Cc, A);
fragmentStop();

fragmentStart('testClusterAlgFit.in.txt');
[theta,sh] = algebraicFit(X, A);
addpath '../../13agcd/uvgcd';
b1str = CoefMat2PolynString([degSet(3,1);b1], {'x' 'y' 'z'},3);
b2str = CoefMat2PolynString([degSet(3,1);b2], {'x' 'y' 'z'},3);
cstr = CoefMat2PolynString([A;c], {'x' 'y' 'z'},3);
cLSstr = CoefMat2PolynString([A;c], {'x' 'y' 'z'},3);
[cFacstr, res,cnd]  =  PolynomialFactor(cstr, 10e-2, 'row',-1);

fid=fopen('testClusterAlgFit.out.txt', 'w');
fprintf(fid,'b1(x,y,z) = %s\n', b1str);
fprintf(fid,'b2(x,y,z) = %s\n', b2str);
fprintf(fid,'c(x,y,z) = %s\n', cstr);
fprintf(fid,'c_ls(x,y,z) = %s\n', cLSstr);
fprintf(fid,'Factorized polynomial:\n');
fprintf(fid,'c(x,y,z) = %s\n', cFacstr);
fclose(fid);
fragmentStop();

fragmentStart('testClusterKsigmaFit.in.txt');
sigma = 0.02;
X1 = sigma * randn(size(X)) + X;
[theta2,sh] = algebraicFit(X1, A);
[theta3, sh] = alsKsigmaFit(X1, A, sigma);

chat_str = CoefMat2PolynString([A;theta3'], {'x' 'y' 'z'});
chat_strshort = CoefMat2PolynString([A;theta3'], {'x' 'y' 'z'},6);

fid=fopen('testClusterKsigmaFit.out.txt', 'w');
fprintf(fid,'chat_ls = ['); fprintf(fid,'%f\t', theta2'); fprintf(fid,']\n');
fprintf(fid,'chat_als = ['); fprintf(fid,'%f\t', theta3'); fprintf(fid,']\n');
fprintf(fid,'chat_als(x,y,z) = %s\n', chat_strshort);
fclose(fid);
fragmentStop();

fragmentStart('testClusterPolyFac.in.txt');
[chatFac, res,cnd]  =  PolynomialFactor(chat_str, 10e-2, 'cell',-1);
fid=fopen('testClusterPolyFac.out.txt', 'w');
fprintf(fid,'Approximate factorization of the polynomial:\n');
fprintf(fid, '|chat_als - a * bh1 * bh2| = eps, where\n');
fprintf(fid, 'a = %s\n', chatFac{1});
fprintf(fid, 'bh1(x,y,z) = %s\n', chatFac{2});
fprintf(fid, 'bh2(x,y,z) = %s\n', chatFac{3});
fprintf(fid, 'eps =  %f\n', res);
fclose(fid);
fragmentStop();
