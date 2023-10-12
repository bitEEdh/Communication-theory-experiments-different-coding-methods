% 解答实验一（6）
clear;
fs = 8e3;
x = randsrc(1,1000,[0,1;0.7,0.3]); % 产生1000点0/1序列x，0的概率为0.7,1的概率为0.3
[~,y_ami] = AMIencode(x);   % 对x进行AMI编码
[p_ami,f] = periodogram(y_ami,hamming(8e3),[],fs);
plot(f,10*log10(p_ami),'r'); hold on

x = randsrc(1,1000,[0,1;0.4,0.6]); % 产生1000点0/1序列x，0的概率为0.4,1的概率为0.6
[~,y_ami] = AMIencode(x);   % 对x进行AMI编码
[p_ami,f] = periodogram(y_ami,hamming(8e3),[],fs);
plot(f,10*log10(p_ami),'g'); hold on

x = randsrc(1,1000,[0,1;0.1,0.9]); % 产生1000点0/1序列x，0的概率为0.1,1的概率为0.9
[~,y_ami] = AMIencode(x);   % 对x进行AMI编码
[p_ami,f] = periodogram(y_ami,hamming(8e3),[],fs);
plot(f,10*log10(p_ami),'b');
xlabel('频率/Hz')
ylabel('功率谱密度/(dBW/Hz)')
legend('“0”的概率为0.7','“0”的概率为0.4','“0”的概率为0.1');