function [a] = togrey_permute
% [a] = arial - Reads Lenna and turns it grey

myImage = "SampleImages\\Lenna.png";
myImage = imread(myImage);
gray_image = rgb2gray ( myImage);
imshow(permute(gray_image,[2 1]));