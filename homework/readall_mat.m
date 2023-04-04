function data = readall_mat(path)
    % READALL_MAT ��ȡ�����ļ�
    % DATA = READALL_MAT(PATH)��ȡ·��PATH�µ�����mat�ļ��е����ݸ���data
    % mat�ļ��к��ж��������
    % ���cell��ʽ�����������Ȳ�ͬ
    % ���data����Ҫʹ��data�е�������ʹ��data{index}����
    %
    % ԭʼ�汾��V1.0 ���ߣ���֣�� ʱ�䣺2018.03.05
    A = dir(fullfile(path,'*.mat'));
    % ��ȡ��A�ĸ�ʽΪ
    % name -- filename
    % date -- modification date
    % bytes -- number of bytes allocated to the file
    % isdir -- 1 if name is a directory and 0 if not
    % ������--����ʾΪ7.3702e+05��ʶ
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

% [EOF] readall_mat.m

