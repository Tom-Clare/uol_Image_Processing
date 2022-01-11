%% Task 1: Load data
clear all; close all; clc;
file_list = dir("C:\Users\apric\Documents\uni\Year3\uol_Image_Processing_Workshops\Week11\workshop_data");
imgs = {};
masks = {};

for i = 1:numel(file_list)
    
    file = file_list(i);
    [filepath,name,ext] = fileparts(file.name);
    abs_path = fullfile(file.folder, file.name);
    
    if regexp(file.name, "I\d+.png")
        % load the file
        img = imread(abs_path);
        % append to cell array
        imgs{end+1} = img;
    elseif regexp(file.name, "L\d+.png")
        % load image
        mask = imread(abs_path);
        % normalise to between 0 and 1
        mask = mask / 255;
        % append to cell array
        masks{end+1} = mask;
    end
   
end

k = 5; % look at some others as well
showOne(imgs, masks, k);

%% Task 2: Extract region properties
perims = []; eccen = []; comp = [];

for i = 1:numel(masks)
    mask = masks{i};
    % call regionprops on each mask in turn, and store the results
    perims(end+1) = regionprops(mask, 'Perimeter');
    % you'll need to compute compactness yourself (check the lectures!)
   
end

%% Task 3: GLCMs

for i = 1:numel(imgs)
   
    % for each img, mask out the background region with NaNs
    % compute GLCM using graycomatrix
    % compute features from GLCM using graycoprops
   
end

%% Task 4: Display results

% Look at each computed feature in turn, and see how the images are ranked
% when you sort them by each value (hint: use [out,idx] = sort(...))

%% Task 5 (stretch): Evaluate robustness

%% Handy functions
function showOne(imgs, masks, index)
    figure;
    masks
    B = bwboundaries(masks{index});
    imagesc(imgs{index}); hold on;
    for k = 1:length(B)
       boundary = B{k};
       plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
    end
    colormap gray;
    axis equal off;
end

