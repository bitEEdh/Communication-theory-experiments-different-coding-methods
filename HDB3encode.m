function [xe_hdb3,y_hdb3] = HDB3encode(x)
% 对长为1000的输入0/1序列x进行归零HDB3编码，脉冲宽度为符号宽度的50%，波形采样率为符号率的8倍
% x: 输入序列
% xe_hdb3: HDB3编码后的0/1序列
% y_hdb3: 向量，存储归零HDB3码的值
vc = 0;        % 记录V码个数
zc = 0;        % 记录连续的0的个数
flag = -1;
xe_hdb3 = zeros(1,1000);
y_hdb3 = zeros(1,8000);
v = zeros(1,250); % 存储V码的值(1或-1)
for i=1:1e3
    if x(i)==1
        zc = 0;  % 若当前码元为1，则将连续的0的个数清零
        if flag==-1  % 用flag控制相邻的1码极性交替、V码和其后相邻的1码极性交替
            xe_hdb3(i) = -1; flag = 1;
        else 
            xe_hdb3(i) = 1; flag = -1;
        end
    else
        zc = zc+1; % 当前码元为0，连续0的计数加1
    end
    if zc==4       % 若出现4个连续的0
        vc = vc+1; % 需要插入1个V码，V码计数值加1
        if vc==1   % 若是第一次插入V码
            if i==4  % 若序列的前4个码元是连0，则将第4个和第1个码元置为-1
                xe_hdb3(i) = -1; xe_hdb3(i-3) = -1; flag = 1;
            elseif x(i-4)==1  % 若4个连0的前1个码元(是1或-1)为1
                xe_hdb3(i) = 1; flag = -1; % V码极性为正
            else              % 若4个连0的前1个码元为-1
                xe_hdb3(i) = -1; flag = 1; % V码极性为负
            v(vc) = xe_hdb3(i);  % 存储V码的值
            end
        else         % 保证相邻的V码极性交替
            if v(vc-1)==1
                xe_hdb3(i) = -1; flag = 1;
                if xe_hdb3(i-4)==1
                    xe_hdb3(i-3) = -1; % 插入B码，保证V的破坏作用
                end
            else
                xe_hdb3(i) = 1; flag = -1;
                if xe_hdb3(i-4)==-1
                    xe_hdb3(i-3) = 1; % 插入B码，保证V的破坏作用
                end
            end
            v(vc) = xe_hdb3(i);      % 存储V码的值
        end
        zc = 0;
    end        
end
for i = 1:1e3          % 按照波形采样率为符号速率的8倍，产生8000点波形向量
    y_hdb3(8*i-3:8*i) = zeros(1,4);
    switch xe_hdb3(i)
        case 1
            y_hdb3(8*i-7:8*i-4) = ones(1,4);
        case -1
            y_hdb3(8*i-7:8*i-4) = -ones(1,4);
        case 0
            y_hdb3(8*i-7:8*i-4) = zeros(1,4);    
    end
end