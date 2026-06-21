clear; clc; close all;

%% 層の読み込みと画像のセット
load mylayers
% 学習用データの定義
imdshandTrain = imageDatastore('image_mine\train', 'IncludeSubfolders',true,'LabelSource','foldernames');
% テスト用データの定義
imdshandValidation = imageDatastore('image_mine\test', 'IncludeSubfolders',true,'LabelSource','foldernames');
%% 学習オプションの設定
options = trainingOptions('sgdm', ... % 最適化エンジン。確率的勾配降下法を選択
    'MaxEpochs',1, ... % 学習のデータセットの繰り返し頻度
    'ValidationData',imdshandValidation, ... % 評価用データの指定
    'ValidationFrequency',10, ... % 評価用データでの検証頻度
    'Verbose',false); % 

%% 学習と結果の可視化、プロット作成
k=30; % 学習の繰り返し回数(Epoch)
f = figure; % プロットの作成
f.Units = 'normalized';
f.Position = [0.05 0 0.5 0.8];shg
% 変数の初期値設定
% 精度が指定の値を超えたかチェックするフラグを指定
flag25 =1;
flag50 =1;
flag75 =1;
m =zeros(4,1);
for nn = 1:k
    if nn == 1
        net = trainNetwork(imdshandTrain,layers,options); % 学習
    else
        net = trainNetwork(imdshandTrain,net.Layers,options); % 学習
    end
    YPred = classify(net,imdshandValidation);% 予測
    for ii = 1:numel(imdshandValidation.Labels)  
        Itest = read(imdshandValidation); % 画像の読み込み
        YPred1 = classify(net,Itest); % 画像ごとに予測
        Itest3 = cat(3,Itest,Itest,Itest); % 画像をカラーに変換
        if ~(YPred1 == imdshandValidation.Labels(ii))
            Color = 'red'; % 予測結果が間違っていたら赤
        else
            Color = 'green'; % 予測が正しければ緑
        end
        Itest3 = insertShape(Itest3,'Rectangle',[1 1 28 28],...
            'Color', Color,'LineWidth',3); % 画像の周囲に指定した枠をつける
        data{ii} = Itest3; % 枠が付いたあとの画像をdataに格納
    end
    reset(imdshandValidation); % imagedatastoreの読み出しをリセット
    subplot(1,2,1), montage(data,'Size',[10 5]); % 各画像の判定結果をfigureの左側に表示
    YValidation = imdshandValidation.Labels;
    accuracy(nn) = sum(YPred == YValidation)/numel(YValidation);% 現時点での精度を計算
    % 精度が25%,50%,75%を超えた直後のファイルのみ変数として保持
    if accuracy(nn) < 0.25 
    elseif accuracy(nn) >0.25 & flag25 ==1 % 25%を超えたとき
        net25 = net;
        m(1) =nn;
        flag25=0;
    elseif accuracy(nn) > 0.5 & flag50 ==1 % 50%を超えたとき
        net50 = net;
        m(2) =nn;
        flag50=0;
    elseif accuracy(nn) > 0.75 & flag75 ==1 % 75%を超えたとき
        net75 = net;
        m(3) =nn;
        flag75 =0;      
    end
    subplot(1,2,2),plot(accuracy*100,'blue -','LineWidth',2),ylim([0 100]) % 精度をfigureの右側に表示
    axis([0 k 0 100]);
    title('Machine Learning','FontSize',12,'Interpreter','latex','FontName','Euclida')% タイトル
    xlabel('Iteration','FontSize',12,'Interpreter','latex','FontName','Euclid');% x座標ラベル
    ylabel('Accuracy','FontSize',12,'Interpreter','latex','FontName','Euclid'); % y座標ラベル
    shg;
end
accuracyfin = accuracy(end)*100; 
disp(['Accuracy of machine learning mode is ',num2str(accuracyfin),' %.']); % 精度の表示
m(4) = nn(end);
% 精度の曲線、4つのネットワーク、保存した回数の番号
save('netresult_mine.mat','net*','accuracy','m')

% Copyright 2019 The MathWorks, Inc.