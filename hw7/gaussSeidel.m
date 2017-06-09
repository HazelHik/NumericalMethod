function [x,i] = gaussSeidel(a,b)
n = size(b,1);
D = diag(diag(a));                  %���������������
L = -tril(a, -1);
U = -triu(a,1);
G=(D-L)^-1*U;
f=(D-L)^-1*b;
max_iter = 1e10;                       %���õ�������������ֹ��ѭ��
x(:,1) = zeros(n,1);                     %��������
for i=2:max_iter                       %��������
    x(:,i) = G*x(:,i-1) + f;
    err(i) = norm(x(:,i)-x(:,i-1))/norm(x(:,i));
    if err(i) < eps         %�ж��Ƿ��������ѭ������
        break;
    end
end

plot(2:i-1,err(2:i-1));