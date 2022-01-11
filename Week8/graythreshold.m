I = imread("SampleImages/Face.jpg");
level = graythresh(I);
A = im2bw(I, level);

imshow(A);
