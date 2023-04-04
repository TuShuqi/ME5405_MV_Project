clc;
clear;
close all;

pathSource = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
dirSourceList = dir(pathSource);
countSourceList = length(dirSourceList);%�ļ��и���

for numDirList = 3:countSourceList
    fileName = dir(strcat(pathSource,"\",dirSourceList(numDirList).name));        %��ȡ���ļ����е�ͼƬ
    fileSum = length(fileName);
    fileNum = fileSum-2;            %Ϊ�����ɶ�Ӧ�ڶ�ȡ�Ĵ�3��ʼ���ļ���ֻ���ȼ�ȥ2��Ȼ����������������2
    % disp(['ԭʼ�������ļ���',num2str(dirSourceList(numDirList).name),'����ͼƬ��',num2str(fileNum)]);
    numFileList = randperm(fileNum);
    numFileList = numFileList+2;
    partitionPosition = round(fileNum/4);%����ͨ����������ȷ���ķָ�λ�á����ǻ������ݵı�����2�ǰ�һ�뻮�֣������4�Ļ���'�ȿ���val(ǰ25%)�󿽱�train(��75%)'
    %�ڳ���������һЩ�����Ϣ������鿴��������
    % disp(['�ȿ���val(ǰ25%)�󿽱�train(��75%)']);

%     %�������Լ�����val
%     %�ڳ���������һЩ�����Ϣ������鿴����ִ�н���
%     disp(['��val�ļ����´������ļ���',num2str(dirSourceList(numDirList).name)]);
%     disp(['����',num2str(partitionPosition),'��ͼƬ��val�ļ��������ļ���',num2str(dirSourceList(numDirList).name),'��']);
%     %��֪�����ֿ�����������ĵط������ȿ����������Ƚ϶�Ĳ��֣������������Ƚ��ٵĲ��֣�����ʲô������
%     %��Ŀ��val�ļ����У�������Ӧ�����ļ���
%     pathCreValDir=[pathCreDirVal,dirSourceList(numDirList).name,'\'];
%     mkdir(pathCreValDir);
    pathValDir = 'D:\Documents\nus\5405-MV\project\homework\val';
%     %�ڳ���������һЩ�����Ϣ������鿴����ִ�н���
%     disp(['���Ʋ������ݵ�val���ļ���',num2str(dirSourceList(numDirList).name),'��']);
%     %����ͼƬ��ָ��·��
    for picNum = 1:partitionPosition%������Ҫ��ȡnumFileList�����ɵ�������ݣ����Դ�1��ʼ
        copyfile([pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name], ...
        [pathValDir,'\',dirSourceList(numDirList).name,'\']);
    end
    
    
    %����ѵ��������train
    %�ڳ���������һЩ�����Ϣ������鿴����ִ�н���
    % disp(['��train�ļ����´������ļ���',num2str(dirSourceList(numDirList).name)]);
    % disp(['����',num2str(fileNum-partitionPosition),'��ͼƬ��train�ļ��������ļ���',num2str(dirSourceList(numDirList).name),'��']);
    %��Ŀ��train�ļ����У�������Ӧ�����ļ���

    pathTrainDir='D:\Documents\nus\5405-MV\project\homework\train';
    %�ڳ���������һЩ�����Ϣ������鿴����ִ�н���
    % disp(['����ѵ�����ݵ�Train���ļ���',num2str(dirSourceList(numDirList).name),'��']);   
    %����ͼƬ��ָ��·��
    for picNum=partitionPosition+1:fileNum%������Ҫ��ȡnumFileList�����ɵ�������ݣ����Դ�1��ʼ
        copyfile([pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name], ...
        [pathTrainDir,'\',dirSourceList(numDirList).name,'\']);
    end
end