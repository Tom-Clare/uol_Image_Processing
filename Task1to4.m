clear; close all;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('IMG_04.png');
imshow(I);

% Step-2: Covert image to grayscale
I = rgb2gray(I);
%imshow(I);

% Step-3: Rescale image
I = imresize(I, [512, NaN]);
%imshow(I);

% Step-4: Produce histogram before enhancing
imhist(I);

% Step-5: Enhance image before binarisation
%I_histeq = histeq(I);
I_filt = medfilt2(I, [5,5]);
%imshow(I);


% Step-6: Histogram after enhancement
%imhist(I_histeq, 10);

% Step-7: Image Binarisation
% Use Otsu's method
G = graythresh(I);
I = imbinarize(I, G);

G = graythresh(I_filt);
I_filt = imbinarize(I_filt, G);


% extra step to open and erode to further reduce noise
I = bwareaopen(I, 400, 4);
I_filt = bwareaopen(I_filt, 400, 4);

imshowpair(I, I_filt, 'montage');

% Task 2: Edge detection ------------------------

% Task 3: Simple segmentation --------------------

% Task 4: Object Recognition --------------------