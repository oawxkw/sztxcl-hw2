%% hw2
%
clc; clear; close all;
Image_A = imread(".\pic\Image A.jpg");
Image_B = imread(".\pic\Image B.jpg");

%% hw2-1a
%  
cpselect(Image_A,Image_B); 

%% hw2-1b
%  
% figure(3)
% imshow(Image_A);
% points_A = zeros(7,2);
% for i = 1:7
%     [x,y] = ginput(1); 
%     hold on; 
%     plot(x,y,"or"); 
%     points_A(i,:) = [x,y];
% end
% 
% figure(4)
% imshow(Image_B);
% points_B = zeros(7,2);
% for i = 1:7
%     [x,y] = ginput(1); 
%     hold on; 
%     plot(x,y,"or"); 
%     points_B(i,:) = [x,y];
% end

%% hw2-2
%  
points_A = [
    1022.87500000000,1814.25000000000;
    1023.62500000000,2125.12500000000;
    1211.37500000000,2240.12500000000;
    1371.62500000000,2318.12500000000;
    2427.87500000000,1613.62500000000;
    2901.62500000000,1076.37500000000;
    973.375000000000,1021.37500000000]; % fixedPoints

points_B = [
    708.125000000000,1323.12500000000;
    628.875000000000,1624.87500000000;
    780.375000000000,1782.87500000000;
    914.875000000000,1901.12500000000;
    2117.62500000000,1489.87500000000;
    2713.87500000000,1093.37500000000;
    863.125000000000,544.625000000000]; % movingPoints

figure(1)
subplot(121); imshow(Image_A); hold on; plot(points_A(:,1),points_A(:,2),"or",'LineWidth',2); title('\fontsize{24}original Image A with fixedPoints');
subplot(122); imshow(Image_B); hold on; plot(points_B(:,1),points_B(:,2),"or",'LineWidth',2); title('\fontsize{24}original Image B with movingPoints');

%% hw2-3
%  
tform = fitgeotrans(points_B,points_A,"affine"); % fitting the image B to image A

%% hw2-4
%  
Image_B_t = imwarp(Image_B,tform); % moving the image B
points_B_t = [points_B,ones(7,1)]*tform.T; % moving the movingPoints in image B
figure(2)
subplot(121),imshow(Image_A); hold on; plot(points_A(:,1),points_A(:,2),"or",'LineWidth',2); title('\fontsize{24}original Image A with fixedPoints');
subplot(122),imshow(Image_B_t); hold on; plot(points_B_t(:,1),points_B_t(:,2),"or",'LineWidth',2); title('\fontsize{24}fitted Image B with movingPoints');
