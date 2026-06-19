 img = imread('lena.jpg');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
R_img = cat(3, R, zeros(size(R)), zeros(size(R)));
G_img = cat(3, zeros(size(G)), G, zeros(size(G)));

B_img = cat(3, zeros(size(B)), zeros(size(B)), B);
figure;
subplot(2,3,2);
imshow(img);
title('元画像');

subplot(2,3,4);
imshow(R_img);
title('R要素');

subplot(2,3,5);
imshow(G_img);
title('G要素');
subplot(2,3,6);
imshow(B_img);
title('B要素');
