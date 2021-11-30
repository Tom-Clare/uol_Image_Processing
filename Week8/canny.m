pkg load image;
im = imread("Lenna.png");
im = rgb2gray(im);
A = edge(im, "Canny");
imshow(A);