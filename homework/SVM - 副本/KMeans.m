function label = KMeans( data,K,mode)
%  -data 
%  -K: number of clusters
%  -mode: 
%   1: use kmeans cluster algorithm in matlab
%   2: k_medroid algorithm: use data points as k centers

N_samples = 91024;
N_features = 128;
switch (mode)
    %call system function KMeans
    case 1 
        label = kmeans(data,K);
     %use kmedroid method
    case 2
        for testcase = 1:10% do 10 times to get rid of the influence from Initial_center
            K_center = Initial_center(data,K); %select initial points randomly
            changed_label = N_samples;
            label = zeros(1,N_samples);
            iteration_times = 0;
            while changed_label~=0
                cls_label = cell(1,K);
                for i = 1: N_samples
                    for j = 1 : K
                        D(j) = dis(data(i,:),K_center(j,:));
                    end
                    [~,label(i)] = min(D);
                    cls_label{label(i)} = [cls_label{label(i)} i];
                end
                changed_label = 0;
                cls_center = zeros(K,N_features);
                for i = 1 : K
                    cls_center(i,:) = mean(data(cls_label{i},:));
                    D1 = [];
                    for j = 1:size(cls_label{i},2)%number of samples clsutered in i-th class
                        D1(j) = dis(cls_center(i,:),data(cls_label{i}(j),:));
                    end
                    [~,min_ind] = min(D1);
                    if ~isequal(K_center(i,:),data(cls_label{i}(min_ind),:))
                        K_center(i,:) = data(cls_label{i}(min_ind),:);
                        changed_label = changed_label+1;
                    end
                end
                iteration_times = iteration_times+1;
            end
        end
end

    function center = Initial_center(X,K)
        rnd_Idx = randperm(N_samples,K);
        center = X(rnd_Idx,:);
    end

    function res = dis(X1,X2)
        res = norm(X1-X2);
    end
end

