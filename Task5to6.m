image_num = "09";

% Task 5: Robust method --------------------------
Im = imread("IMG_" + image_num + ".png");
I = rgb2gray(Im);

I = medfilt2(I, [5,5]);

T = graythresh(I);
I = imbinarize(I, T);

I = bwareaopen(I, 150);

I_inside = imclearborder(I);
I_outside = I & ~I_inside;

%find circular objects (differenciate between red blood cells and bacteria)
I_inside_labelled = bwlabel(I_inside); % label each region
properties = regionprops(I_inside_labelled, "Circularity"); % get circularity of regions
mask = [properties.Circularity] > 0.3; % only regions with over X circularity rating
I_inside_circles = ismember(I_inside_labelled, find(mask)); % match circular onjects to those in original image

% fill inside circles
I_inside_circles = imfill(I_inside_circles, "holes"); % fill in holes

I_out_labelled = bwlabel(I_outside);
properties2 = regionprops(I_out_labelled, "Circularity"); % get circularity of regions
mask2 = [properties2.Circularity] > 0.1; % only regions with over X circularity rating
I_out_circles = ismember(I_out_labelled, find(mask2)); % match circular onjects to those in original image

I_out_circles = bwconvhull(I_out_circles, "objects"); % and get their outline via bwconvhull()

I_circles = I_inside_circles + I_out_circles; % inner and outer circles
I_noncircles = I & ~I_circles;

imshow(I_circles);

% fill in circular objects

%I_A = imfill(I_inside_circles, "holes"); % fill in holes
%SE = strel("disk", 10, 0);
%I_A = imopen(I_A, SE); % think more about this

%I_B = I & ~I_A; % get only border-touching objects
%I_B = imopen(I_B, SE);
%I_B = bwconvhull(I_B, "objects"); % and get their outline via bwconvhull()

%I_circles = I_A + I_B; % add border circles to centre circles

%I_bact = I - I_circles;

%SE = strel("disk", 3); % unsure what this is doing
%I_circles = imerode(I_circles, SE);


%I_C2 = bwareaopen(I_bact, 150); %remove small bits of (noncircular) noise

%I = I_circles + I_C2;



%I_circles = bwareaopen(I_circles, 1000, 4);

%I_circles = imerode(I_circles, 1);

%I = I_circles + I_noncircles;
%composite = cat(3, I_circles, I_bact, I_bact);

% Task 6: Performance evaluation -----------------
% Step 1: Load ground truth data
GT = imread("IMG_" + image_num + "_GT.png");

% To visualise the ground truth image, you can
% use the following code.
GT = rgb2gray(GT); % grayscale image for label2rgb function
L_GT = label2rgb(GT, 'prism','k','shuffle');
%figure, imshow(L_GT);

%imshowpair(L_GT, im2uint8(composite), "montage");