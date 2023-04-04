function [testData,testLabels] = ReadTestDataSet(fileRoot,imageFormat)
%读取测试集数据集
dataSetFiles = dir(strcat(fileRoot,'\S*'));
classNum = length(dataSetFiles);
testLabels = [];
k = 1;
for i = 1 : classNum
    imageData = dir(strcat(fileRoot,'\',dataSetFiles(i).name,'\*.',imageFormat));
    for j = 1 : length(imageData)
        image = im2double(imread(strcat(fileRoot,'\',dataSetFiles(i).name,'\',imageData(j).name)));
        testData(:,:,k) = image;
        k = k+1;
        testLabels = [testLabels;i];
    end
end
end

