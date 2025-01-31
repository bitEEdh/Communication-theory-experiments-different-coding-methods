# Communication-theory-experiments-different-coding-methods
本实验包含 exp1_1to5.m, exp1_6.m, AMIencode.m, HDB3encode.m, 
MillerEncode.m, plot_20.m, PSDestimate.m 这些代码文件。\
exp1_1to5.m：解答本实验（1）～（5），可直接运行。调用了 AMIencode.m, 
HDB3encode.m, MillerEncode.m, plot_20.m, PSDestimate.m.\
exp1_6.m：解答本实验（6），可直接运行，调用了 AMIencode.m.\
AMIencode.m：对长为 1000 的输入 0/1 序列进行归零 AMI 编码，脉冲宽度为
符号宽度的 50%，波形采样率为符号速率的 8 倍。\
HDB3encode.m：对长为 1000 的输入 0/1 序列进行归零 HDB3 编码，脉冲宽度
和波形采样率与 AMI 相同。\
MillerEncode.m：对长为 1000 的输入 0/1 序列进行密勒编码，脉冲宽度和
波形采样率与 AMI 相同。\
plot_20.m：绘制编码后序列前 20 个码元的波形。\
PSDestimate.m：用周期图法估计三种编码波形的功率谱
