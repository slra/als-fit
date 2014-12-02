function Ms = shiftTriangleUp(M)
%SHIFTTRIANGLEUP shifts a lower-triangular matrix up
%   M = hermTable(M)
%
%   Input arguments:
%     M - the input matrixthe maximal degree of the polynomial
%
%   Output arguments:
%     Ms - the shifted matrix
%
%   The function performs the following transformation:
%   * ^            * * * *
%   * * ^    -->   * * *          
%   * * * ^        * *
%   * * * *        *
%   where ^ denotes the direction of the shift
  Ms = [M zeros(size(M,1), 1)];
  Ms = reshape(Ms, size(Ms,2), size(Ms,1));
  Ms(end,:) = [];
end

