function [trainData,trainLabels,testData,testLabels] = ReadDataSet(fileRoot,imageFormat,trainNum,testNum)
%读取训练集和测试集的数据集
dataSetFiles = dir(strcat(fileRoot,'\S*'));
classNum = length(dataSetFiles);
trainLabels = [];
testLabels = [];
for i = 1 : classNum
    imageData = dir(strcat(fileRoot,'\',dataSetFiles(i).name,'\*.',imageFormat));
    for j = trainNum(1) : trainNum(2)
        image = im2double(imread(strcat(fileRoot,'\',dataSetFiles(i).name,'\',imageData(j).name)));
        trainData(:,:,(trainNum(2)-trainNum(1)+1)*(i-1)+j-trainNum(1)+1) = image;
        trainLabels = [trainLabels;i];
    end
    for j = testNum(1) : testNum(2)
        image = im2double(imread(strcat(fileRoot,'\',dataSetFiles(i).name,'\',imageData(j).name)));
        testData(:,:,(testNum(2)-testNum(1)+1)*(i-1)+j-testNum(1)+1) = image;
        testLabels = [testLabels;i];
    end
end
end

