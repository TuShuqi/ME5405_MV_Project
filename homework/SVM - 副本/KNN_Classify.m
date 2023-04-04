function [predictIndex,accuracy] = KNN_Classify(trainFeatures,trainLabels,testFeatures,testLabels)
%KNN classify
classifer = fitcknn(trainFeatures,trainLabels,'NumNeighbors',1);
[predictIndex,~] = predict(classifer,testFeatures);
accuracy = length(find(predictIndex==testLabels))/length(testLabels);
end
