function I=area_normalization(I,A)
%%%% In:  I = Binary Image, A = area of normalization (px)     
%%%% Out:  I = Normalized Image with margins 
Area=regionprops(I,'Area');
Area=Area.Area;
k=sqrt(A/Area);
I=imresize(I,k);
I=padarray(I,[20 20],'both');

    
    

