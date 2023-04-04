function [predictIndex,accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,method)
%����
switch method
    case 'KNN'
        [predictIndex,accuracy] = KNN_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
    case 'SVM'
        [predictIndex,accuracy] = SVM_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
%     case 'NB'
%         [predictIndex,accuracy] = NB_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
%     case 'Tree'
%         [predictIndex,accuracy] = Tree_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
    otherwise
        disp("'method' should be 'KNN' or 'SVM' or 'NB' or 'Tree'");
end
disp([method,'׼ȷ�ʣ�',num2str(accuracy)]);
end
