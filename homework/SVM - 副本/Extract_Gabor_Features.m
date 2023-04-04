function total_Gabor_Features = Extract_Gabor_Features(data)
%ÌáÈ¡GaborÌØÕ÷
    [~,~,totalNum] = size(data);
    total_Gabor_Features = [];
    GaborArray = gabor(10,[0,45,90,135]);
    for i = 1 : totalNum
        total_Gabor_Features = [total_Gabor_Features;reshape(imgaborfilt(data(:,:,i),GaborArray),1,[])];
    end
end
