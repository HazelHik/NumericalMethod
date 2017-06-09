function [x,i]=jacobi(a,b)
D = diag(diag(a));                  %计算对角线上元素组成的向量
N = D-a;                            %计算运算所需各矩阵
G = D^-1*N;
f = D^-1*b;
max_iter = 1e10;                       %设置迭代最大次数，防止死循环
x(:,1) = zeros(4,1);                     %生成初始向量
for i=2:max_iter                       %进行运算
    x(:,i) = G*x(:,i-1) + f;
    if isnan(sum(x(:,i)))
        break;
    end
    err(i) = norm(x(:,i)-x(:,i-1))/norm(x(:,i));
    if err(i) < eps %判断是否符合跳出循环条件
        break;
    end
end

plot(2:i-1,err(2:i-1));