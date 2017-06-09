function [result,i] = sor(a,b,w)
n = size(b,1);
D = diag(diag(a));                  %运算所需各矩阵
L = -tril(a, -1);
U = -triu(a,1); 
G = (D- w*L)\((1-w)*D + w* U );
f = (D-L)\(b*w);
i_max = 1e10;                       %设置迭代最大次数，防止死循环
err=eps;                            %近似相对误差限，作为迭代终止条件
y(:,1) = zeros(n,1);                     %迭代初始向量

for i = 2:i_max
    y(:,i) = G*y(:,i-1) + f;                       %进行运算
    if norm(y(:,i)-y(:,i-1))/norm(y(:,i-1)) < err         %判断是否符合跳出循环条件
        break;
    end
end

result = y;