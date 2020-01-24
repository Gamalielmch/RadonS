function R=filtering(R,cutoff_freq,order)
%%%% Calculate radon transform
%%%% Reference image to compare with proccesed image
Lo=lpfilter('btw', size(R,1), size(R,2), cutoff_freq, order);
R=(fftshift(fft2(R))).*Lo;
R=abs(ifft2(ifftshift(R), 'symmetric'));