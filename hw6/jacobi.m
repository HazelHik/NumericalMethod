function [x,i]=jacobi(a,b)
D = diag(diag(a));                  %����Խ�����Ԫ����ɵ�����
N = D-a;                            %�����������������
G = D^-1*N;
f = D^-1*b;
max_iter = 1e10;                       %���õ�������������ֹ��ѭ��
x(:,1) = zeros(4,1);                     %���ɳ�ʼ����
for i=2:max_iter                       %��������
    x(:,i) = G*x(:,i-1) + f;
    if isnan(sum(x(:,i)))
        break;
    end
    err(i) = norm(x(:,i)-x(:,i-1))/norm(x(:,i));
    if err(i) < eps %�ж��Ƿ��������ѭ������
        break;
    end
end

plot(2:i-1,err(2:i-1));