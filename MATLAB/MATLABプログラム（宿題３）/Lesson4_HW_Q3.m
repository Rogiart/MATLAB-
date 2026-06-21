%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 【アヤメの散布図】（横軸：花びらの長さ，縦軸：花びらの幅）を表示する課題  
%  Lesson2_HW_Q1_1.mを参考にして、自分でプログラムを作成する。               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% AIの機械学習（教師なし学習）：階層クラスタリング
% 測定データ: fisheriris.csv
% アヤメの花の種: setosa（1行～50行）, versicolor（51行～100行）, virginica（101行～150行）
% 特徴量: がく片の長さ（1列）,  がく片の幅（2列）,  花びらの長さ（3列）,  花びらの幅（4列）
% 正解データ：アヤメの花の種（5列）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load fisheriris
gscatter(meas(:,3),meas(:,4),species,'rgb','od+')
axis([0 8 0 5])
xlabel("花びらの長さ（Petal Length） [cm]")
ylabel("花びらの幅（Petal Width） [cm]")
hold on; xline(2.45,'--b',{'2.45'},'LabelVerticalAlignment','bottom','LabelOrientation','horizontal')
hold on; yline(1.75,'--b',{'1.75'},'LabelHorizontalAlignment','left','LabelOrientation','horizontal')
hold on; xline(4.95,'--m',{'4.95'},'LabelVerticalAlignment','bottom','LabelOrientation','horizontal')
hold on; yline(1.65,'--m',{'1.65'},'LabelHorizontalAlignment','left','LabelVerticalAlignment','bottom','LabelOrientation','horizontal'); hold off
legend('Setosa','Versicolor','Virginica','Location','northwest')
axis([0 7 0 2.6])
