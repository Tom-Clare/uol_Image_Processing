function [a] = togray_interpolate
% [a] = arial - Reads X.png, turns it gray, and interpolates using NN

myImage = "SampleImages\\X.png";
myImage = imread(myImage);
gray_image = rgb2gray ( myImage);
imshow(gray_image);
figure, imshow(imresize(gray_image,1.2,'nearest'));