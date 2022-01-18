fixed = imread("fixed.png");
moving = imread("moving.png");

%cpselect(moving, fixed);

affineObj = fitgeotrans(movingPoints, fixedPoints, "affine");
simObj = fitgeotrans(movingPoints, fixedPoints, "similarity");

affine = imwarp(moving, affineObj, "OutputView", imref2d(size(fixed)));
similarity = imwarp(moving, simObj, "OutputView", imref2d(size(fixed)));

fuse = imfuse(affine,fixed,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
imshow(fuse);
