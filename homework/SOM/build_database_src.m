pathSource = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
dirSourceList = dir(pathSource);
countSourceList = length(dirSourceList);%�ļ��и���
for numDirList = 3:countSourceList
    fileName = dir(strcat(pathSource,"\",dirSourceList(numDirList).name));        %��ȡ���ļ����е�ͼƬ
    fileSum = length(fileName);
    fileNum = fileSum-2;            %Ϊ�����ɶ�Ӧ�ڶ�ȡ�Ĵ�3��ʼ���ļ���ֻ���ȼ�ȥ2��Ȼ����������������2
    numFileList = randperm(fileNum);
    numFileList = numFileList+2;
    partitionPosition = round(fileNum/4);
    pathValDir = 'D:\Documents\nus\5405-MV\project\homework\SOM\val';
    for picNum = 1:partitionPosition%������Ҫ��ȡnumFileList�����ɵ�������ݣ����Դ�1��ʼ       
        k1 = [pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k11 = [pathValDir,'\',fileName(numFileList(picNum)).name];
        k11 = erase(k11,".png");
        img = imread(k1);%��ȡͼƬ;
        im = imresize(img,[128,128]);%����ͼƬ��С;
        if(length(size(im)) == 3)%����ǲ�ɫͼ���лҶȻ�(���ݸ�����Ҫ);
            gray = rgb2gray(im);
        else
            gray = im;
        end
        src_x(:,:) = gray;%�洢ͼ������;
        path = strcat(k11,'.mat');
        save(path,'src_x','-mat');

    end
    pathTrainDir='D:\Documents\nus\5405-MV\project\homework\SOM\train';
    for picNum=partitionPosition+1:fileNum
        k2 = [pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k21 = [pathTrainDir,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k21 = erase(k21,".png");
        img = imread(k2);%��ȡͼƬ;
        im = imresize(img,[128,128]);%����ͼƬ��С;
        if(length(size(im)) == 3)%����ǲ�ɫͼ���лҶȻ�(���ݸ�����Ҫ);
            gray = rgb2gray(im);
        else
            gray = im;
        end
        gray = double(gray) / 255;%��ͼƬ��������һ��(���ݸ�����Ҫ);
        src_x(:,:) = gray;%�洢ͼ������;
        path = strcat(k21,'.mat');
        save(path,'src_x','-mat');
    end

end

