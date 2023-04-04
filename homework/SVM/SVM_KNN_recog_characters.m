clc;
clear;
close;
fileRoot = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
fileRootTestPadding = 'D:\Documents\nus\5405-MV\project\test\test_padding' ;
fileRootTestResizing = 'D:\Documents\nus\5405-MV\project\test\test_Resizing\' ;
imageFormat = 'png';
trainNum = [1,762];
valNum = [763,1016];

[trainData,trainLabels,valData,valLabels] = ReadDataSet(fileRoot,imageFormat,trainNum,valNum);
[testPaddingData,testPaddingLabels] = ReadTestDataSet(fileRootTestPadding,imageFormat);
[testResizingData,testResizingLabels] = ReadTestDataSet(fileRootTestResizing,imageFormat);

% accuracyTableVal = CalculateAccuracyTable(trainData,trainLabels,valData,valLabels);
accuracyTableTestPadding = CalculateAccuracyTable(trainData,trainLabels,testPaddingData,testPaddingLabels);
accuracyTableTestResizing = CalculateAccuracyTable(trainData,trainLabels,testResizingData,testResizingLabels);





