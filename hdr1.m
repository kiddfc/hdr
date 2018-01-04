clear
O_RGB = imread('over.jpg'); % Read images
U_RGB = imread('under.jpg');
O_MAP = zeros(size(O_RGB,1), size(O_RGB,2)); % Create empty maps
U_MAP = zeros(size(U_RGB,1), size(U_RGB,2));
tic;
O_BW = rgb2gray(O_RGB); % rgb2gray
U_BW = rgb2gray(U_RGB);
O_MAP(gt(O_BW,250)) = 1; % Map overexposed and underexposed pixels
U_MAP(lt(U_BW,5)) = 1;
t = toc;
figure,
subplot(2,2,1), imshow(O_RGB)
subplot(2,2,2), imshow(U_RGB)
subplot(2,2,3), imshow(O_MAP)
subplot(2,2,4), imshow(U_MAP)
disp(['cpu:', num2str(t)])