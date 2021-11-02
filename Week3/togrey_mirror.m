function [a] = togrey_mirror
% [a] = arial - Reads Lenna, turns it grey, and produces a mirror image

myImage = "SampleImages\\Lenna.png";
myImage = imread(myImage);
gray_image = rgb2gray ( myImage);
imshow(flip(gray_image, 2));