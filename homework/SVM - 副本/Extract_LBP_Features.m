function total_LBP_Features = Extract_LBP_Features(data)
%Ã·»°LBPÃÿ’˜
    [~,~,totalNum] = size(data);
    total_LBP_Features = [];
    for i = 1 : totalNum
        LBP_Features = extractLBPFeatures(data(:,:,i),'CellSize',[16,16],'Upright',true);
        numNeighbors = 8;
        numBins = numNeighbors*(numNeighbors-1)+3;
        LBP_CellHists = reshape(LBP_Features,numBins,[]);
        LBP_CellHists = bsxfun(@rdivide,LBP_CellHists,sum(LBP_CellHists));
        LBP_Features = reshape(LBP_CellHists,1,[]);
        total_LBP_Features = [total_LBP_Features;LBP_Features];
    end
end
