%% 手書き文字から学習用データの作成
clear all;clc;close all;[status] = rmdir('image_other','s');
%% スキャナーで読み取った100個の手書き文字が書かれた画像を読み込み
I = imread('image_other.jpg');
figure,imshow(I);
%% 数値が書かれた領域のボックスを作成
BW = imbinarize(I); % 二値化
BW = imclearborder(BW); % 周囲に接している部分を
BWbbox = imfill(BW,'holes'); % 穴を埋める
BWbbox = imclose(BWbbox,ones(30)); % クローズ処理
BWbbox = bwareaopen(BWbbox,100); % 100より小さいごみを処理
% figure, imshow(BWbbox);
%% 各数字をトリミングで切り出しフォルダに保存
% 各数字の領域の範囲を指定
thresh = [0 320 520 720 920 1100 1280 1480 1680 1880 2080];
% 各数字の位置とサイズの情報を取得
statsbbox = regionprops('table',BWbbox,'Centroid','BoundingBox');
% 数字の種類ごとに処理
for n= 1:10
    % 数字nの場所だけを取り出す
    idx = statsbbox.Centroid(:,2) < thresh(n+1) & statsbbox.Centroid(:,2) > thresh(n);
    % 各数字のエリアの中心座標を取り出す
    r = statsbbox.Centroid(idx,2); 
    c = statsbbox.Centroid(idx,1);
    % 取り出すエリアの情報とサイズの調整
    rect = statsbbox.BoundingBox(idx,:);
    rect(:,1) = rect(:,1)+ 5;
    rect(:,2) = rect(:,2)+ 5;
    rect(:,3) = rect(:,3)- 10;
    rect(:,4) = rect(:,4)- 10;
    BW2 = bwselect(BWbbox,c,r,4);
    % 保存用のディレクトリを作成
    if n == 10 
        mkdir image_other\train\0
        mkdir image_other\test\0
    else
        mkdir(['image_other\train\' num2str(n)])
        mkdir(['image_other\test\' num2str(n)])
    end
    % 各種10個ずつ数値があるので、トリミングし輝度反転し名前を付けて保存
    for i=1:10
        BW3 = bwselect(BW2,c(i),r(i),4); % 10個のうち一つを指定
        I2 = imcrop(I,rect(i,:)); % 指定領域をトリミング
        I3 = imadjust(255 - I2); % 輝度反転し、正規化
        I4 = imresize(I3,[28 28]); % サイズを28ｘ28に変換
        % 各フォルダに保存
        % 一枚ずつ表示
        imshow(I4);shg;
        if i < 6 % 5番目までは学習用
            ftype = 'train';
            fnum=i;
        else % 6番目以降は評価用
            ftype = 'test';
            fnum=i-5;
        end
        % 画像を保存
        if n ==10
            imwrite(I4,['image_other\' ftype '\0' '\' ftype '_' num2str(0) '_' num2str(fnum) '_other.jpg'] );
        else
            imwrite(I4,['image_other\' ftype '\' num2str(n) '\' ftype '_' num2str(n) '_' num2str(fnum) '_other.jpg'] );
        end
        clear I2 I3 
    end
end
winopen('image_other') % Windowsのエクスプローラでフォルダを開く
%% 
function buttonaction
    if isempty(txt.String)
    else
        b =false;
    end
end
% Copyright 2019 The MathWorks, Inc.