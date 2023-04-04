function total_GLCM_Features = Extract_GLCM_Features(data)
%提取灰度共生矩阵特征
[~,~,totalNum] = size(data);
total_GLCM_Features = [];
for i = 1 : totalNum
    GLCMS = graycomatrix(data(:,:,i),'Offset',[0,1;-1,1;-1,0;-1,-1],'NumLevels',16);
    for j = 1 : 4
        GLCM_Features = [];
        entropy = 0;contrast = 0;homogenity = 0;
        GLCMS(:,:,j) = GLCMS(:,:,j)/sum(sum(GLCMS(:,:,j)));
        energy = sum(sum(GLCMS(:,:,j).^2));
        for k = 1 : 16
            for l = 1 : 16
                if GLCMS(k,l,j) > 0
                    entropy = entropy-GLCMS(k,l,j)*log10(GLCMS(k,l,j));
                end
                contrast = contrast+(k-l)^2*GLCMS(k,l,j);
                homogenity = homogenity+GLCMS(k,l,j)/(1+(k-l)^2);
            end
        end
        GLCM_Features = [GLCM_Features;entropy,energy,contrast,homogenity];
    end
    total_GLCM_Features = [total_GLCM_Features;GLCM_Features];
end
end
