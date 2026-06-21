%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 【座る・立つ・歩く・走る・ダンスの動作の散布図（3次元）】
%   x軸：加速度のx成分の平均値
%   y軸：加速度のy成分の平均値  
%   z軸：加速度のz成分の平均値   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIの機械学習（教師あり学習）
% 測定データ「motion5 = feat(4030:7384,1:3);」
% 座る・立つ・歩く・走る・ダンスの動作についての加速度データ
% 正解データ「correct = actid(4030:7384,1);」
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



load humanactivity.mat
motion5 = feat(4030:7384,1:3);
correct = actid(4030:7384,1);
scatter3(feat(4030:4801,1), feat(4030:4801,2), feat(4030:4801,3), "magenta", "o") 
hold on
scatter3(feat(4802:5676,1), feat(4802:5676,2), feat(4802:5676,3), "red", "+")
hold on
scatter3(feat(5677:6520,1), feat(5677:6520,2), feat(5677:6520,3), "blue", ".")
hold on
scatter3(feat(6521:6998,1), feat(6521:6998,2), feat(6521:6998,3), "cyan", ".")
hold on
scatter3(feat(6999:7384,1), feat(6999:7384,2), feat(6999:7384,3), "green", ".")
hold off
view(25, 30)
xlabel('$ \bar{a}_x$','FontSize',14,'Interpreter','latex')
ylabel('$ \bar{a}_y$','FontSize',14,'Interpreter','latex')
zlabel('$ \bar{a}_z$','FontSize',14,'Interpreter','latex')
lgd = legend('座る','立つ','歩く','走る','ダンス','Location','northeast','FontSize',13);
