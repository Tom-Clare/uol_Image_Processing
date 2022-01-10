clear; close all;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('IMG_10.png');
imshow(I);

% Step-2: Covert image to grayscale
I = rgb2gray(I);
%imshow(I);

% Step-3: Rescale image
I = imresize(I, [512, NaN]);
%imshow(I);

% Step-4: Produce histogram before enhancing
%imhist(I);

% Step-5: Enhance image before binarisation
I = medfilt2(I, [5,5]);


% Step-6: Histogram after enhancement
%imhist(I_histeq, 10);

% Step-7: Image Binarisation
% Use Otsu's method
G = graythresh(I);
I_bin = imbinarize(I, G);


% extra step to open and erode to further reduce noise
I_area = bwareaopen(I_bin, 400, 4);

showpair(I_bin, I_area, "montage");

% Task 2: Edge detection ------------------------
I = medfilt2(I, [12,12]);
I = imadjust(I, [], [], 3);
imshow(I);

I = edge(I, 'log');

imshow(I);

% Task 3: Simple segmentation --------------------
mask = zeros(size(I));
mask(25:end-25,25:end-25) = 1;
I = activecontour(I, mask, 500);

% Task 4: Object Recognition --------------------