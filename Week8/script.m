pkg load image;
im = imread("Lenna.png");
im = rgb2gray(im);
A = edge(im, "Canny");
imshow(A);

B = imsmooth(im, "Gaussian", 1);
f = fspecial("sobel");
B = imfilter(B, f);
imshow(B);