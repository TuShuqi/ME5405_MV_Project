clear;
close all;
clc;
%% READ then transpose
Train_label = zeros(1, 762 * 7);

%% read D
train_D = readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleD\');
TS_D=ones(762,16384);

for i=1:762
    TS_D(i,1:end)=reshape(train_D{i},[1,16384]);
    Train_label(1, i) = 1;
end

%% read E
train_E=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleE\');
TS_E=ones(762,16384);
for i=1:762
    TS_E(i,1:end)=reshape(train_E{i},[1,16384]);
    Train_label(1, i + 762) = 2;
end

%% read H
train_H=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleH\');
TS_H=ones(762,16384);
for i=1:762
    TS_H(i,1:end)=reshape(train_H{i},[1,16384]);
    Train_label(1, i + 762*2) = 3;
end

%% read L
train_L=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleL\');
TS_L=ones(762,16384);
for i=1:762
    TS_L(i,1:end)=reshape(train_L{i},[1,16384]);
    Train_label(1, i + 762*3) = 4;
end

%% read O
train_O=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleO\');
TS_O=ones(762,16384);
for i=1:762
    TS_O(i,1:end)=reshape(train_O{i},[1,16384]);
    Train_label(1, i + 762*4) = 5;
end

%% read R
train_R=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleR\');
TS_R=ones(762,16384);
for i=1:762
    TS_R(i,1:end)=reshape(train_R{i},[1,16384]);
    Train_label(1, i + 762*5) = 6;
end

%% read W
train_W=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\train\SampleW\');
TS_W=ones(762,16384);
for i=1:762
    TS_W(i,1:end)=reshape(train_W{i},[1,16384]);
    Train_label(1, i + 762*6) = 7;
end
%% combine 7 train_dataset
Train_data = [TS_D.',TS_E.',TS_H.',TS_L.',TS_O.',TS_R.',TS_W.'];

%% testing set
label1 = ones(1,254);
label2 = 2*ones(1,254);
label3 = 3*ones(1,254);
label4 = 4*ones(1,254);
label5 = 5*ones(1,254);
label6 = 6*ones(1,254);
label7 = 7*ones(1,254);

Test_label = [label1,label2,label3,label4,label5,label6,label7];

Test_set=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\val');
Test_all=ones(1778,16384);
for i=1:1778
    Test_all(i,:)=reshape(Test_set{i},[1,16384]);
end
Test_data = Test_all.';

