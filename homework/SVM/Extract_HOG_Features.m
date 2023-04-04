function total_HOG_Features = Extract_HOG_Features(data)
%ÌáÈ¡HOGÌØÕ÷
    [~,~,totalNum] = size(data);
    total_HOG_Features = [];
    for i = 1 : totalNum
        total_HOG_Features = [total_HOG_Features;extractHOGFeatures(data(:,:,i))];
    end
end
