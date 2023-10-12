function [xe_miller,y_miller] = MillerEncode(x)
% 对长为1000的输入0/1序列x进行密勒编码,脉冲宽度、波形采样率和前两种编码相同
% x: 输入序列
% xe_miller: 密勒编码后的0/1序列
% y_miller: 向量，存储密勒码的值
xe_miller = zeros(1,2000);
y_miller = zeros(1,8000);
if x(1)==1
    xe_miller(1:2) = [1,0];   % 若第1个码元为1，将起始码元编为高电平
end
for i = 2:1e3
    if x(i)==1   % 若当前码元为1，当前码元起始位置不跳变，中间位置跳变
        xe_miller(2*i-1) = xe_miller(2*i-2);
        if xe_miller(2*i-2)==0
            xe_miller(2*i) = 1;
        else
            xe_miller(2*i) = 0;
        end
    else        % 若当前码元为0，需看前一个码元
        if x(i-1)==0  % 若前一个码元为0，当前码元起始位置跳变，中间位置不跳变
            if xe_miller(2*i-2)==0
                xe_miller(2*i-1) = 1; 
            else
                xe_miller(2*i-1) = 0;
            end
            xe_miller(2*i) = xe_miller(2*i-1);
        else        % 若前一个码元为1，当前码元起始位置不跳变，中间位置不跳变
            xe_miller(2*i-1:2*i) = [xe_miller(2*i-2),xe_miller(2*i-2)];
        end
    end
end

for i = 1:2e3   % 按照波形采样率对编码后的码值向量赋值
    switch xe_miller(i)
        case 1
            y_miller(4*i-3:4*i) = ones(1,4);
        case 0
            y_miller(4*i-3:4*i) = zeros(1,4);
    end
end