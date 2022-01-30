image_num = "04";

% Task 5: Robust method --------------------------
Im = imread("IMG_" + image_num + ".png");
I = rgb2gray(Im);
I_plain = rgb2gray(Im);

I = adapthisteq(I);
I = imadjust(I, [], [], 0.16);

I = medfilt2(I, [7,7]);

T = graythresh(I);
I = imbinarize(I, "adaptive");

I = bwareaopen(I, 400, 4);

I_A = imclearborder(I); % get objects not attached to border
I_A = imfill(I_A, "holes"); % fill in holes
I_B = I & ~I_A; % get only border-touching objects
I_B = bwconvhull(I_B, "objects"); % and get their outline via bwconvhull()
I = I_A + I_B; % add border shapes to centre shapes

I_labelled = bwlabel(I); % label each region
properties = regionprops(I_labelled, "Circularity"); % get circularity of regions
mask = [properties.Circularity] > 0.6; % only regions with over X circularity rating
I_circles = ismember(I_labelled, find(mask)); % match circular onjects to those in original image
I_noncircles = I & ~I_circles;

I = bwareaopen(I_circles, 1000, 4);
I = I + I_noncircles;

% Task 6: Performance evaluation -----------------
% Step 1: Load ground truth data
GT = imread("IMG_" + image_num + "_GT.png");

% To visualise the ground truth image, you can
% use the following code.
GT = rgb2gray(GT); % grayscale image for label2rgb function
L_GT = label2rgb(GT, 'prism','k','shuffle');
%figure, imshow(L_GT);

imshowpair(L_GT, I, "montage");