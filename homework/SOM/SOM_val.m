%% Use the generated SOM to classify the val images 

% Number of val samples
num_val_samples = length(Val_data(1,:));

Val_SOM_label = zeros(num_val_samples,1);
for i = 1:num_val_samples   
     current_val_sample =Val_data(:,i);
    [winner_output_neuron, winner_output_idx, winner_output_distance] = find_winner(train_weights, current_val_sample);    
    % Label the val sample with the one corresponding to the winner neuron
    Val_SOM_label(i) = train_SOM_labels(winner_output_idx);   
end

%% Calculate the recognition rate for the whole val sate
error_rate = get_error_rate(Val_SOM_label, Val_label);
accuracy = 1 - error_rate

    