function [a] = script
% [a] = given - Reads X.png, turns it gray, and interpolates using NN

I = imread("POut.png");

I = 255*im2double(I);
mi = min(min(I));
ma = max(max(I));
L = ma - mi + 1;
for i = 1:L
    pixel_value(i) = i - 1;
    frequency = find( I == pixel_value(i) );
    Nk(i) = length(frequency);
end

J = uint8(zeros(size(I)));
for row = 1 :size(I,1)
    for col = 1:size(I,2)
        J(row,col) = Sk(I(row,col)+1);
    end
end

imhist(J);