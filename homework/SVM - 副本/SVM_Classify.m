function [predictIndex,accuracy] = SVM_Classify(trainFeatures,trainLabels,testFeatures,testLabels)
%SVM∑÷¿‡∆˜
    classifer = fitcecoc(trainFeatures,trainLabels);
    [predictIndex,~] = predict(classifer,testFeatures);
    accuracy = length(find(predictIndex==testLabels))/length(testLabels);
end
