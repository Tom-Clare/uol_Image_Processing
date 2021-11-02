function [a] = togray_interpolate
% [a] = arial - Reads X.png, turns it gray, and interpolates using NN

myImage = "SampleImages\\X.png";
myImage = imread(myImage);
gray_image = rgb2gray ( myImage);
original = gray_image;
resized = imresize(gray_image,1.2,'nearest');
subplot(1,2,1), imshow(original);
subplot(1,2,2), imshow(resized);
