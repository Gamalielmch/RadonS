function Id=differences_image(Iref,If,thr)

Id=bwmorph(abs(Iref-If),'majority');
s=regionprops(Id,'PixelIdxList');
for si=1:length(s)
    if length(s(si).PixelIdxList)<thr
        Id(s(si).PixelIdxList)=0;
    end
end