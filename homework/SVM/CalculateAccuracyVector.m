function [predictIndex_KNN,predictIndex_SVM,accuracyVector] = CalculateAccuracyVector(trainData,trainLabels,testData,testLabels,method)
%   ͳ����ȡ�������ڲ�ͬ�������µ�׼ȷ��
    [trainFeatures,testFeatures] = ExtractFeatures(trainData,testData,method);
    [predictIndex_KNN,KNN_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'KNN');
    [predictIndex_SVM,SVM_accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'SVM');
    accuracyVector = {method;KNN_accuracy;SVM_accuracy};
end
