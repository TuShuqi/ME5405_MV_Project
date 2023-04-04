function [predictIndex,accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,method)
%·ÖÀà
switch method
    case 'KNN'
        [predictIndex,accuracy] = KNN_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
    case 'SVM'
        [predictIndex,accuracy] = SVM_Classify(trainFeatures,trainLabels,testFeatures,testLabels);
    otherwise
        disp("'method' should be 'KNN' or 'SVM' or 'NB' or 'Tree'");
end
disp([method,' Accuracy: ',num2str(accuracy)]);
end
