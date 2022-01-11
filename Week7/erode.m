pkg load image;
A = imread('coins.gif');
se = strel('disk', 8, 0);
B = imerode(A, se);
imshow(B);
