clear; close all;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('IMG_03.png');
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
I_con = medfilt2(I, [5,5]);
%imshowpair(I, I_con, 'montage');

% Step-6: Histogram after enhancement
%imhist(I_histeq, 10);

% Step-7: Image Binarisation
G = graythresh(I);
Im = im2bw(I, G);
Im = imbinarize(I);

T = adaptthresh(I_con, 0.1);
I = imbinarize(I);
I_con = imbinarize(I_con, T);
imshowpair(I_con, Im, 'montage');
%imshow(I);


% Task 2: Edge detection ------------------------

% Task 3: Simple segmentation --------------------

% Task 4: Object Recognition --------------------