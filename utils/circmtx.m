function [ Cx ] = circmtx(x, m)
%CIRCMTX  Circulant matrix of a vector.
%  Usage:  CIRCMTX(X, M)
%  where  X  is a vector and  M  is the length of cyclic convolution.
%

if nargin >= 2 && ~isempty(m) && (m > numel(x))
  x = [x(:) ; zeros(m-numel(x),1)];
else
  m = numel(x);
  x = x(:);
end

Cx = zeros(m);
Cx(:,1) = x;
for i = 2:m
  Cx(:,i) = circshift(x, i-1);
end

end