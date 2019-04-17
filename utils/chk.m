function [ chk_x ] = chk(x, m)
%CHK  Adjoint cyclic convolution vector.
%  Usage:  CHK(X, M)
%  where  X  is a vector and  M  is the length of cyclic convolution.
%

if nargin >= 2 && ~isempty(m) && (m > numel(x))
  x = [x(:) ; zeros(m-numel(x),1)];
else
  m = numel(x);
  x = x(:);
end

chk_x = circshift(flipud(x),1);

end