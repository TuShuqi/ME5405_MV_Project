%% Create a map and show the weights of the output neurons

figure
% Set the indice to plot the figures column by column 
idx = reshape(1:sum_neurons,10,[])';
idx=idx(:);
for i = 1:sum_neurons
    h = subplot(10,10,idx(i));
    
    % Increase the size of each picture displayed
    p = get(h, 'pos');
    p(3) = p(3) + 0.015;
    set(h, 'pos', p);
    
    % Reshape the weight of the neuron into a 128x128 matrix
    picture = reshape(train_weights(:,i),128,128);
    imshow(double(picture)/255);
end
