clc;
clear;
close all;

pathSource = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
dirSourceList = dir(pathSource);
countSourceList = length(dirSourceList);%文件夹个数

for numDirList = 3:countSourceList
    fileName = dir(strcat(pathSource,"\",dirSourceList(numDirList).name));        %读取子文件夹中的图片
    fileSum = length(fileName);
    fileNum = fileSum-2;            %为了生成对应于读取的从3开始的文件，只能先减去2，然后生成随机数后加上2
    % disp(['原始数据子文件夹',num2str(dirSourceList(numDirList).name),'中有图片：',num2str(fileNum)]);
    numFileList = randperm(fileNum);
    numFileList = numFileList+2;
    partitionPosition = round(fileNum/4);%这是通过四舍五入确定的分割位置。这是划分数据的比例，2是按一半划分，如果是4的话，'先拷贝val(前25%)后拷贝train(后75%)'
    %在程序中增加一些输出信息，方便查看数据内容
    % disp(['先拷贝val(前25%)后拷贝train(后75%)']);

%     %拷贝测试集数据val
%     %在程序中增加一些输出信息，方便查看程序执行进度
%     disp(['在val文件夹下创建子文件夹',num2str(dirSourceList(numDirList).name)]);
%     disp(['拷贝',num2str(partitionPosition),'张图片到val文件夹下子文件夹',num2str(dirSourceList(numDirList).name),'中']);
%     %不知道这种拷贝东西到别的地方，是先拷贝数据量比较多的部分，还是数据量比较少的部分，这有什么讲究。
%     %在目标val文件夹中，创建对应的子文件夹
%     pathCreValDir=[pathCreDirVal,dirSourceList(numDirList).name,'\'];
%     mkdir(pathCreValDir);
    pathValDir = 'D:\Documents\nus\5405-MV\project\homework\val';
%     %在程序中增加一些输出信息，方便查看程序执行进度
%     disp(['复制测试数据到val子文件夹',num2str(dirSourceList(numDirList).name),'中']);
%     %复制图片到指定路径
    for picNum = 1:partitionPosition%由于是要读取numFileList中生成的随机数据，所以从1开始
        copyfile([pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name], ...
        [pathValDir,'\',dirSourceList(numDirList).name,'\']);
    end
    
    
    %拷贝训练集数据train
    %在程序中增加一些输出信息，方便查看程序执行进度
    % disp(['在train文件夹下创建子文件夹',num2str(dirSourceList(numDirList).name)]);
    % disp(['拷贝',num2str(fileNum-partitionPosition),'张图片到train文件夹下子文件夹',num2str(dirSourceList(numDirList).name),'中']);
    %在目标train文件夹中，创建对应的子文件夹

    pathTrainDir='D:\Documents\nus\5405-MV\project\homework\train';
    %在程序中增加一些输出信息，方便查看程序执行进度
    % disp(['复制训练数据到Train子文件夹',num2str(dirSourceList(numDirList).name),'中']);   
    %复制图片到指定路径
    for picNum=partitionPosition+1:fileNum%由于是要读取numFileList中生成的随机数据，所以从1开始
        copyfile([pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name], ...
        [pathTrainDir,'\',dirSourceList(numDirList).name,'\']);
    end
end