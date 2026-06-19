% Sobelフィルタ処理

% 画像の読み込み
img = imread('4.1.05.tiff');

% カラー画像をグレースケール化
gray = rgb2gray(img);

% 横方向のSobelフィルタ
sobel_x = [-1 0 1;
           -2 0 2;
           -1 0 1];

% 縦方向のSobelフィルタ
sobel_y = [ 1  2  1;
            0  0  0;
           -1 -2 -1];

% フィルタ処理
fx = imfilter(double(gray), sobel_x);
fy = imfilter(double(gray), sobel_y);

% 表示
figure;

subplot(2,2,1);
imshow(img);
title('カラー画像');

subplot(2,2,2);
imshow(gray);
title('グレースケール画像');

subplot(2,2,3);
imshow(mat2gray(abs(fx)));
title('横方向のフィルタ処理');

subplot(2,2,4);
imshow(mat2gray(abs(fy)));
title('縦方向のフィルタ処理');