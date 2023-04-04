clc
clear
close
fileRoot = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
imageFormat = 'png';
trainNum = [1,762];
testNum = [763,1016];
[trainData,trainLabels,testData,testLabels] = ReadDataSet(fileRoot,imageFormat,trainNum,testNum);
accuracyTable = CalculateAccuracyTable(trainData,trainLabels,testData,testLabels);
% [trainFeatures,testFeatures] = ExtractFeatures(trainData,testData,'LBP');
% [predictIndex,accuracy] = Classify(trainFeatures,trainLabels,testFeatures,testLabels,'KNN');
