pathSource = 'D:\Documents\nus\5405-MV\project\p_dataset_26\';
dirSourceList = dir(pathSource);
countSourceList = length(dirSourceList);%文件夹个数
for numDirList = 3:countSourceList
    fileName = dir(strcat(pathSource,"\",dirSourceList(numDirList).name));        %读取子文件夹中的图片
    fileSum = length(fileName);
    fileNum = fileSum-2;            %为了生成对应于读取的从3开始的文件，只能先减去2，然后生成随机数后加上2
    numFileList = randperm(fileNum);
    numFileList = numFileList+2;
    partitionPosition = round(fileNum/4);
    pathValDir = 'D:\Documents\nus\5405-MV\project\homework\SOM\val';
    for picNum = 1:partitionPosition%由于是要读取numFileList中生成的随机数据，所以从1开始       
        k1 = [pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k11 = [pathValDir,'\',fileName(numFileList(picNum)).name];
        k11 = erase(k11,".png");
        img = imread(k1);%读取图片;
        im = imresize(img,[128,128]);%设置图片大小;
        if(length(size(im)) == 3)%如果是彩色图进行灰度化(根据个人需要);
            gray = rgb2gray(im);
        else
            gray = im;
        end
        src_x(:,:) = gray;%存储图像数据;
        path = strcat(k11,'.mat');
        save(path,'src_x','-mat');

    end
    pathTrainDir='D:\Documents\nus\5405-MV\project\homework\SOM\train';
    for picNum=partitionPosition+1:fileNum
        k2 = [pathSource,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k21 = [pathTrainDir,'\',dirSourceList(numDirList).name,'\',fileName(numFileList(picNum)).name];
        k21 = erase(k21,".png");
        img = imread(k2);%读取图片;
        im = imresize(img,[128,128]);%设置图片大小;
        if(length(size(im)) == 3)%如果是彩色图进行灰度化(根据个人需要);
            gray = rgb2gray(im);
        else
            gray = im;
        end
        gray = double(gray) / 255;%对图片数据做归一化(根据个人需要);
        src_x(:,:) = gray;%存储图像数据;
        path = strcat(k21,'.mat');
        save(path,'src_x','-mat');
    end

end

