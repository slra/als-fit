% CODE
%
% Files
%   algebraicFit      - computes the OLS estimator (algebraic fitting)
%   alsKsigmaFit      - computes the ALS estimator with known variance (ALS1)
%   alsUsigmaFit      - computes the ALS estimator with unknown variance (ALS2)
%   boxSet            - creates the integer matrix for box set
%   degSet            - creates the integer matrix for the degree-constrained set
%   devecarr          - creates an array from the multidegrees A and the vector of values
%   examplesBook      - 
%   figTightBox       - create figure of given size with equal axis in a tight box
%   geometricFit      - computes the OR estimator (geometric fitting)
%   goodExamples      - 
%   hermTable         - computes the matrix of coefficients of Hermite polynomials
%   momMatr           - computes the moment array for data points
%   momShiftedBasis   - computes the $k$-th basis moment array
%   monomials2        - 
%   multinomial       - computes the vector of multinomial coefficients
%   multPolynomials   - multiplies two polynomials 
%   nushift           - computes the nu-shift of a (moment) array
%   plotModel         - plots an algebraic curve defined by implicit equation
%   quasiHankel       - creates a quasi-Hankel matrix from the array
%   runAll            - 
%   runGenTable       - generate table of coefficients of the Hermite polynomials (for the paper)
%   save2pdf          - saves a figure as a properly cropped pdf

%   testCluster       - 
%   testConsistency   - 
%   testCurveFitting  - 
%   testUnbiasedness  - 
%   thetaPolyEvaluate - evaluates a polynomial at data points

%   trgSet            - creates the integer matrix for the triangular set
%   vecarr            - vectorizes the array C along the matrix of multidegrees A
%   vandMat           - create multivariate Vandermonde matrix
%   deconvTable       - computes the deconvolution polynomials for arbitrary measure
%   shiftTriangleUp   - shifts a lower-triangular matrix up
%   chebTable         - computes the matrix of coefficients for Chebyshev polynomials
%   samplePointsInBox - This function samples points in a box using ezplot
%   testRotInvar      - Test rotation invariance and Bombieri norm
%   testTransRotInvar - translation/rotation invariance: example from Gander, Golub, Strebel
