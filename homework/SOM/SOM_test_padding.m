%% Use the generated SOM to classify the test padding images 
%% test set original
label1_test = 3*ones(1,1);
label2_test = 2*ones(1,1);
label3_test = 4*ones(1,1);
label4_test = 4*ones(1,1);
label5_test = 5*ones(1,1);
label6_test = 7*ones(1,1);
label7_test = 5*ones(1,1);
label8_test = 6*ones(1,1);
label9_test = 4*ones(1,1);
label10_test = 1*ones(1,1);
Test_label = [label1_test,label2_test,label3_test,label4_test,label5_test,label6_test,label7_test,label8_test,label9_test,label10_test];
Test_set=readall_mat('D:\Documents\nus\5405-MV\project\homework\SOM\test_padding');
Test_all=ones(10,16384);
for i=1:10
    Test_all(i,:)=reshape(Test_set{i},[1,16384]);
end
Test_data = Test_all.';



% Number of test samples
num_test_samples = length(Test_data(1,:));

test_SOM_label = zeros(num_test_samples,1);
for i = 1:num_test_samples   
     current_test_sample = Test_data(:,i);
    [winner_output_neuron, winner_output_idx, winner_output_distance] = find_winner(train_weights, current_test_sample);    
    % Label the test sample with the one corresponding to the winner neuron
    test_SOM_label(i) = train_SOM_labels(winner_output_idx);   
end

%% Calculate the recognition rate for the whole test sate
error_rate = get_error_rate(test_SOM_label, Test_label);
accuracy = 1 - error_rate
