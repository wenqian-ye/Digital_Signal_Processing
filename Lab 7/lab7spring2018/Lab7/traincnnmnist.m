
%% Tutorial Code on Running A Neural Network
% Found on the following site:
%https://www.mathworks.com/help/nnet/examples/create-simple-deep-learning-network-for-classification.html

clc;
close all;
clear;

%% Load data
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
    'nndatasets','DigitDataset');

% imds is an imageDatastore object containing files and labels
% contains 10000 pictures of the digits 0-9, 1000 images per digit
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

%% Show randomly 20 images from this Dataset
figure;
perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end

%% Get label count

labelCount = countEachLabel(imds);
labelCount 

%% Get size of image

img = readimage(imds,1);
size(img)

%% Set the number of training files

numTrainFiles = 750; % MODIFY THIS LINE FOR numTrainFiles
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

%% Set the layers of the network

layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

%% Set training parameters

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.5, ... %Change this paramter
    'MaxEpochs',4, ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% Train the network

net = trainNetwork(imdsTrain,layers,options);

%% Verify the accuracy

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);
