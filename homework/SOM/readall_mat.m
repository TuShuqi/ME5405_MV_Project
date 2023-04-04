function data = readall_mat(path)

% READALL_MAT 读取�?有文�?
% DATA = READALL_MAT(PATH)读取路径PATH下的�?有mat文件中的数据赋给data
% mat文件中含有多个数据项
% 输出cell格式以免各数据项长度不同
% 输出data后若要使用data中的内容请使用data{index}访问
%
% 原始版本：V1.0 作�?�：贾郑�? 时间�?2018.03.05
A = dir(fullfile(path,'*.mat'));
% 读取后A的格式为
% name -- filename
% date -- modification date
% bytes -- number of bytes allocated to the file
% isdir -- 1 if name is a directory and 0 if not
% ？？�?--都显示为7.3702e+05标识
    A = struct2cell(A);
    num = size(A);
    for k =0:num(2)-1
        x(k+1) = A(num(1)*k+1);
    end
    m = 1;
    for k = 1:num(2)
    newpath = strcat(path,'\',x(k));
    temp = load(char(newpath));
    temp = struct2cell(temp);
    num2 = size(temp);
        for l = 1:num2(1)
            data{m} = temp{l};
            m = m+1;
        end
    end
end
% [EOF] readall_mat.m