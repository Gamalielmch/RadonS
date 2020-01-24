function bw=image_segmentation(I)

if size(I,3)>3
    I=I(:,:,1:3);
end
%%% Otsu's segmentation 
bw=im2bw(I); 