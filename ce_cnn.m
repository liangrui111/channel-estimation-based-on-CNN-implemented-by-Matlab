layers = [
    imageInputLayer([32 32 2])
    
    convolution2dLayer(9,64,'Padding','same')
   
    reluLayer

    
    convolution2dLayer(1,32,'Padding','same')
    
    reluLayer
    
   
    
    convolution2dLayer(5,2,'Padding','same')
   
    regressionLayer
];



options = trainingOptions('adam', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',3, ...
    'Shuffle','every-epoch', ...
    'ValidationData',vData, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'ExecutionEnvironment','parallel',...
    'Plots','training-progress');


net = trainNetwork(trainData,layers,options);