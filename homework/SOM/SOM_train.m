%% Train the SOM 

% Size of the SOM
N = 10;
M = 10;
sum_neurons = N*M;
% Number of iterations
iter = 10000;
% Effective width
eff_width_init = (sqrt(N*N + M*M))/2;
eff_width_time_cst  = iter / log(eff_width_init);
% Learning rate
learning_rate_init = 0.2;
learning_rate_time_cst = iter;
% Use the SOM function
 [train_weights] = SOM(Train_data, N, M, iter, eff_width_init, eff_width_time_cst, learning_rate_init, learning_rate_time_cst);
 
%% Determine the label of each neuron of the SOM

% Define the label vector 
train_SOM_labels = zeros(sum_neurons,1);
% Loop on the neurons of the SOM 
for j = 1:sum_neurons    
    % Define the current neuron
    current_neuron = train_weights(:,j); 
    % Determine the winner input signal for neuron j (the closest one)
     [winner_input_sample, winner_input_idx, winner_input_distance] = find_winner(Train_data, current_neuron);    
    % Set the label of the neuron j
    train_SOM_labels(j) = Train_label(winner_input_idx); 
end


%% Create a matrix with the corresponding labels 
train_SOM_labels_matrix = zeros(N,M);
for j = 1:sum_neurons
    [pos_i, pos_j] = ind2sub(N, j);
    train_SOM_labels_matrix(pos_i, pos_j) = train_SOM_labels(j);
end


%% Plot the distribution of the labels

figure
SOM_label_categories = categorical(train_SOM_labels,[1 2 3 4 5 6 7],{ 'D', 'E', 'H', 'L', 'O', 'R','W'});
histogram(SOM_label_categories)
title('Distribution of the labels categories of the SOM into 7 clusters')
ylabel('number of labels')



