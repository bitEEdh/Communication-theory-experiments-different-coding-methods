function [xe_ami,y_ami] = AMIencode(x)
% 对长为1000的输入0/1序列x进行归零AMI编码，脉冲宽度为符号宽度的50%，波形采样率为符号速率的8倍
% x: 输入序列
% xe_ami: AMI编码后的0/1序列
% y_ami: 向量，存储归零AMI码的值
xe_ami = zeros(1,1000);
y_ami = zeros(1,8000);
flag = -1;
for i = 1:1e3
    y_ami(8*i-3:8*i) = zeros(1,4);  % 每个码元的后一半归零
    if x(i)==1
        if flag==-1
            xe_ami(i) = -1;        % flag控制相邻1码元的符号反转
            y_ami(8*i-7:8*i-4) = -ones(1,4); % 每个码元包含8个波形采样点，将前4点置为码元当前值，后4点归零
            flag = 1;
        else
            xe_ami(i) = 1;
            y_ami(8*i-7:8*i-4) = ones(1,4);
            flag = -1;
        end
    elseif x(i)==0
        xe_ami(i) = 0;     % 码元0的值编码后仍为0
        y_ami(8*i-7:8*i-4) = zeros(1,4);
    end
end
