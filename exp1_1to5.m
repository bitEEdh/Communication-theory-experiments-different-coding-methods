% 解答实验一（1）～（5）
clear;
x = randsrc(1,1000,[0,1;0.7,0.3]); % 产生1000点0/1序列x，0的概率为0.7,1的概率为0.3
[xe_ami,y_ami] = AMIencode(x);   % 对x进行AMI编码
[xe_hdb3,y_hdb3] = HDB3encode(x); % 对x进行HDB3编码
[xe_miller,y_miller] = MillerEncode(x); % 对x进行密勒编码
figure; plot_20(y_ami,1);
figure; plot_20(y_hdb3,2);
figure; plot_20(y_miller,3);
figure;
PSDEstimate(y_ami,y_hdb3,y_miller); % 估计三种编码后的波形的功率谱