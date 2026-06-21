%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 【座る・立つ・歩くの動作の散布図（3次元）】
%   x軸：加速度のx成分の平均値
%   y軸：加速度のy成分の平均値  
%   z軸：加速度のz成分の平均値   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AIの機械学習（教師なし学習）：階層クラスタリング
% 測定データ「humanactivity.mat」
% 座る・立つ・歩くの動作についての加速度データ
% 正解データ「actid」: 座る(1), 立つ(2), 歩く(3)  actid(:,1)
% 特徴量「feat」: 加速度のx成分の平均値（1列） feat(:,1)
% 　　　　　　　　加速度のy成分の平均値（2列） feat(:,2)
% 　　　　　　　　加速度のz成分の平均値（3列） feat(:,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



load humanactivity.mat
scatter3(feat(4030:4801,1), feat(4030:4801,2), feat(4030:4801,3), "magenta", "o") 
hold on
scatter3(feat(4802:5676,1), feat(4802:5676,2), feat(4802:5676,3), "red", "+")
hold on
scatter3(feat(5677:6520,1), feat(5677:6520,2), feat(5677:6520,3), "blue", ".")
hold off
view(25, 30)
xlabel('$ \bar{a}_x$','FontSize',14,'Interpreter','latex')
ylabel('$ \bar{a}_y$','FontSize',14,'Interpreter','latex')
zlabel('$ \bar{a}_z$','FontSize',14,'Interpreter','latex')
legend('座る','立つ','歩く','Location','northeast')
