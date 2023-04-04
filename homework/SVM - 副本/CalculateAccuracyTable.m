function accuracyTable = CalculateAccuracyTable(trainData,trainLabels,testData,testLabels)
%统计准确率表

    accuracyTable = {'accuracyTable';'KNN';'SVM'};
    disp('LBP features: ');
    LBP = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'LBP');
    
    accuracyTable = [accuracyTable,LBP];
    disp('HOG features: ');
    HOG = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'HOG');
    accuracyTable = [accuracyTable,HOG];
%     disp('Gabor features: ');
%     Gabor = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'Gabor');
%     accuracyTable = [accuracyTable,Gabor];
    disp('GLCM features: ');
    GLCM = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'GLCM');
    accuracyTable = [accuracyTable,GLCM];
    disp('Hu moment features:');
    Hu = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'Hu');
    accuracyTable = [accuracyTable,Hu];
end
