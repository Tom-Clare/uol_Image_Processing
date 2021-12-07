clear; close all;
pkg load image;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('IMG_01.png');
imshow(I);

% Step-2: Covert image to grayscale
I_gray = rgb2gray(I);
imshow(I_gray);

% Step-3: Rescale image
I_sized = imresize(I_gray, [512, NaN]);
imshow(I_sized);

% Step-4: Produce histogram before enhancing
imhist(I_sized, 10);

% Step-5: Enhance image before binarisation
I_enhanced = contrast(I_sized);
imshow(I_enhanced);

% Step-6: Histogram after enhancement

% Step-7: Image Binarisation

% Task 2: Edge detection ------------------------

% Task 3: Simple segmentation --------------------

% Task 4: Object Recognition --------------------