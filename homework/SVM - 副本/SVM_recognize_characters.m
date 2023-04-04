clc;
clear;
close all;

trainingSet = imageDatastore('D:\Documents\nus\5405-MV\project\homework\train', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
testSet = imageDatastore('D:\Documents\nus\5405-MV\project\homework\val', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
countEachLabel(trainingSet)
countEachLabel(testSet)

figure;

subplot(2,4,1);
imshow(trainingSet.Files{1});
title('training example D')

subplot(2,4,2);
imshow(trainingSet.Files{764});
title('training example E')

subplot(2,4,3);
imshow(trainingSet.Files{1528});
title('training example H')

subplot(2,4,4);
imshow(testSet.Files{1});
title('test example L')

subplot(2,4,5);
imshow(testSet.Files{255});
title('test example O')

subplot(2,4,6);
imshow(testSet.Files{510});
title('test example R')




% % figure;
% label_train = zeros(1,7);
% label_test = zeros(1,7);
% label_test = [label_test,ones(1,7)];
% label_test = label_test';
% model = fitcsvm(label_train,trainingSet);
% [predice_label,accuracy,dec_values] = svmpredict(label_test,test_data,model);

% if image_num==0
%     fprintf('未找到任何图像\n');
% else
%     fprintf('已找到%d张图像\n',image_num);
%     for i=1:image_num
%         image_name=image_list(i).name;%获取每一张图片名称
%         %用eval函数可以实现将每一张图片以变量形式保存
%         val=strcat('Image',num2str(i));
%         eval([val,'=imread(fullfile(image_path,image_name));']);%导入每一张图片，注意，这里导入的是三通道彩色图像
%         if i==1
%             save('ImageDatas.mat',val);%将图片数据以.mat文件保存下来
%         else
%             save('ImageDatas.mat',val,'-append');%将图片数据以.mat文件保存下来
%         end
%     end
% end
