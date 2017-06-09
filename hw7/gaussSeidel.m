function [x,i] = gaussSeidel(a,b)
n = size(b,1);
D = diag(diag(a));                  %运算中所需各矩阵
L = -tril(a, -1);
U = -triu(a,1);
G=(D-L)^-1*U;
f=(D-L)^-1*b;
max_iter = 1e10;                       %设置迭代最大次数，防止死循环
x(:,1) = zeros(n,1);                     %生成向量
for i=2:max_iter                       %进行运算
    x(:,i) = G*x(:,i-1) + f;
    err(i) = norm(x(:,i)-x(:,i-1))/norm(x(:,i));
    if err(i) < eps         %判断是否符合跳出循环条件
        break;
    end
end

plot(2:i-1,err(2:i-1));