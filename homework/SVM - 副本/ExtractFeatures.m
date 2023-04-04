function [trainFeatures,testFeatures] = ExtractFeatures(trainData,testData,method)
%ÌáÈ¡ÌØÕ÷
switch method
    case 'LBP'
        trainFeatures = Extract_LBP_Features(trainData);
        testFeatures = Extract_LBP_Features(testData);
    case 'HOG'
        trainFeatures = Extract_HOG_Features(trainData);
        testFeatures = Extract_HOG_Features(testData);
%     case 'Gabor'
%         trainFeatures = Extract_Gabor_Features(trainData);
%         testFeatures = Extract_Gabor_Features(testData);
    case 'GLCM'
        trainFeatures = Extract_GLCM_Features(trainData);
        testFeatures = Extract_GLCM_Features(testData);
    case 'Hu'
        trainFeatures = Extract_Hu_Features(trainData);
        testFeatures = Extract_Hu_Features(testData);
    otherwise
        disp("'method' should be 'GLCM' or 'LBP' or 'HOG' or 'Hu'");
end
[~,dimension] = size(trainFeatures);
if dimension > 50
    [trainFeatures,testFeatures] = PCA_DimensionReduct(trainFeatures,testFeatures,50);
end
end
