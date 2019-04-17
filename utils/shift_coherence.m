function [ mu, ell, xr ] = shift_coherence(a, b, fftsz)
  if nargin < 2 || isempty(b);      b = a;      end
  if nargin < 3 || isempty(fftsz);  fftsz = 0;  end

  na = numel(a);  nb = numel(b);
  fftsz = max([na nb fftsz]);
  a = [a(:); zeros(fftsz-na,1)];
  b = [b(:); zeros(fftsz-nb,1)];

  xr = cconvfft({b a},[1 0],fftsz);
  if norm(a-b) == 0;  xr(1) = 0;  end
  [mu, ell] = max(abs(xr));
end