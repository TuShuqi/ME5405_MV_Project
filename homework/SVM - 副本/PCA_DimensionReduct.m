function [trainFeatures,testFeatures] = PCA_DimensionReduct(trainFeatures,testFeatures,dimensionReduct)
%PCA½µÎ¬
    [totalTrainNum,~] = size(trainFeatures);
    [totalTestNum,~] = size(testFeatures);
    [~,score,~,~] = pca([trainFeatures;testFeatures]);
    trainFeatures = score(1:totalTrainNum,1:dimensionReduct);
    testFeatures = score(totalTrainNum+1:totalTrainNum+totalTestNum,1:dimensionReduct);
end
