function accuracyTable = CalculateAccuracyTable(trainData,trainLabels,testData,testLabels)
%统计准确率表
    accuracyTable = {'accuracyTable';'KNN';'SVM'};
    disp('LBP features: ');
    [predictIndex_KNN,predictIndex_SVM,LBP] = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'LBP');
    plotconfusion(categorical(testLabels),categorical(predictIndex_KNN),'KNN(LBP)');
    plotconfusion(categorical(testLabels),categorical(predictIndex_SVM),'SVM(LBP)');
    accuracyTable = [accuracyTable,LBP];
    disp('HOG features: ');
    [predictIndex_KNN,predictIndex_SVM,HOG] = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'HOG');
    plotconfusion(categorical(testLabels),categorical(predictIndex_KNN),'KNN(HOG)')
    plotconfusion(categorical(testLabels),categorical(predictIndex_SVM),'SVM(HOG)')
    accuracyTable = [accuracyTable,HOG];
    disp('GLCM features: ');
    [predictIndex_KNN,predictIndex_SVM,GLCM] = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'GLCM');
    plotconfusion(categorical(testLabels),categorical(predictIndex_KNN),'KNN(GLCM)')
    plotconfusion(categorical(testLabels),categorical(predictIndex_SVM),'SVM(GLCM)')
    accuracyTable = [accuracyTable,GLCM];
    disp('Hu moment features:');
    [predictIndex_KNN,predictIndex_SVM,Hu] = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,'Hu');
    plotconfusion(categorical(testLabels),categorical(predictIndex_KNN),'KNN(Hu)')
    plotconfusion(categorical(testLabels),categorical(predictIndex_SVM),'SVM(Hu)')
    accuracyTable = [accuracyTable,Hu];
end
