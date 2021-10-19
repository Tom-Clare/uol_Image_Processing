function [a] = arial
% [a] = arial - Reads the arial image of Lincoln

myImage = "Lincoln.jpg";
myImage = imread(myImage);
gray_image = rgb2gray ( myImage);
imshow(gray_image);