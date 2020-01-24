function I=inverse_Radon_transform(R,theta,size,thr)
%%%% Calculate radon transform
%%%% Reference image to compare with proccesed image
I=iradon(R,theta,size);
I=im2bw(I,thr);