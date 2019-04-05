function [ out ] = cconvfft( a, b, adj, fftsz, realout )

if nargin < 3;  adj = 0;      end
if nargin < 5;  realout = true;  end
if nargin < 4;  fftsz = max(length(a), length(b));  end

ahat = fft(a, fftsz);  bhat = fft(a, fftsz);

if (adj == 1) || (adj == 3);  ahat = conj(ahat);  end
if (adj == 2) || (adj == 3);  bhat = conj(bhat);  end

out = ifft(ahat.*bhat);
if realout;  out = real(out);  end
  
end