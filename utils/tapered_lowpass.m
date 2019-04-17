function [ a, win ] = tapered_lowpass(p, bw, sigma, fftsz, thresh)
if nargin < 4 || isempty(fftsz);   fftsz = p;      end
if nargin < 5 || isempty(thresh);  thresh = 1e-2;  end

a = randn(p,1);
a = fftshift(fft(a, fftsz));

cut = floor(fftsz*(1-bw)/2);
a(1:cut) = 0;  a(end-cut+1:end) = 0;
a = real(ifft(fftshift(a)));  

%win = exp(-linspace(0,1,p).^2/sigma^2);
win = cos(linspace(0, 1, p)/sigma) + 1; 
win = win'/max(win);  cut = find(win<=thresh, 1);
assert(cut < floor(p/2), 'sigma is too large.');
win = win(1:cut);
win = [flipud(win); ones(p-2*cut,1); win; zeros(fftsz,1)];
win = win(1:fftsz);
a = a.*win;
a = a/norm(a);
end