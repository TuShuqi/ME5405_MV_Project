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
%     fprintf('δ�ҵ��κ�ͼ��\n');
% else
%     fprintf('���ҵ�%d��ͼ��\n',image_num);
%     for i=1:image_num
%         image_name=image_list(i).name;%��ȡÿһ��ͼƬ����
%         %��eval��������ʵ�ֽ�ÿһ��ͼƬ�Ա�����ʽ����
%         val=strcat('Image',num2str(i));
%         eval([val,'=imread(fullfile(image_path,image_name));']);%����ÿһ��ͼƬ��ע�⣬���ﵼ�������ͨ����ɫͼ��
%         if i==1
%             save('ImageDatas.mat',val);%��ͼƬ������.mat�ļ���������
%         else
%             save('ImageDatas.mat',val,'-append');%��ͼƬ������.mat�ļ���������
%         end
%     end
% end
