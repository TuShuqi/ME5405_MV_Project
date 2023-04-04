function accuracyVector = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,method)
%统计某种特征，不同分类器下的准确率
    [trainFeatures,testFeatures] = ExtractFeatures(trainData,testData,method);
    [~,KNN_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'KNN');
    [~,SVM_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'SVM');
    % [~,NB_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'NB');
    % [~,Tree_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'Tree');
    accuracyVector = {method;KNN_accuracy;SVM_accuracy};
end
