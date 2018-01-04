clear
O_RGB = imread('over.jpg'); % Read images
U_RGB = imread('under.jpg');
O_GPU = gpuArray(O_RGB); % Transfer the matrices to gpu
U_GPU = gpuArray(U_RGB);
O_GPU_MAP = zeros(size(O_GPU,1),size(O_GPU,2),'gpuArray'); % Create empty maps
U_GPU_MAP = zeros(size(U_GPU,1),size(U_GPU,2),'gpuArray');
tic;
O_GPU_BW = rgb2gray(O_GPU); % rgb2gray
U_GPU_BW = rgb2gray(U_GPU);
O_GPU_MAP(gt(O_GPU_BW,250)) = 1; % Map overexposed and underexposed pixels
U_GPU_MAP(lt(U_GPU_BW,5)) = 1;
t = toc;
figure,
subplot(2,2,1), imshow(O_GPU)
subplot(2,2,2), imshow(U_GPU)
subplot(2,2,3), imshow(O_GPU_MAP)
subplot(2,2,4), imshow(U_GPU_MAP)
disp(['gpu:', num2str(t)])