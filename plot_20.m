function plot_20(y,j)
% 绘制编码后前20个码元的波形
for i = 1:20
    n = 8*i-8:8*i;
    plot(n/8,y(8*i-7:8*i+1),'b'); hold on;   % 每次循环绘制1个码元的波形
end
xlabel('码元序号');
switch j
    case 1
        title('AMI码前20个码元的波形');
    case 2 
        title('HDB3码前20个码元的波形');
    case 3
        title('密勒码前20个码元的波形');
end
