function PSDEstimate(y_ami,y_hdb3,y_miller)
% 周期图法估计三种编码波形的功率谱密度
fs = 8e3;
[p_ami,f] = periodogram(y_ami,hamming(8e3),[],fs);
plot(f,10*log10(p_ami),'r'); hold on
[p_hdb3,f] = periodogram(y_hdb3,hamming(8e3),[],fs);
plot(f,10*log10(p_hdb3),'g'); hold on
[p_miller,f] = periodogram(y_miller,hamming(8e3),[],fs);
plot(f,10*log10(p_miller),'b')
xlabel('频率/Hz')
ylabel('功率谱密度/(dBW/Hz)')
legend('AMI','HDB3','Miller');

