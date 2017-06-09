function [result,i] = sor(a,b,w)
n = size(b,1);
D = diag(diag(a));                  %�������������
L = -tril(a, -1);
U = -triu(a,1); 
G = (D- w*L)\((1-w)*D + w* U );
f = (D-L)\(b*w);
i_max = 1e10;                       %���õ�������������ֹ��ѭ��
err=eps;                            %�����������ޣ���Ϊ������ֹ����
y(:,1) = zeros(n,1);                     %������ʼ����

for i = 2:i_max
    y(:,i) = G*y(:,i-1) + f;                       %��������
    if norm(y(:,i)-y(:,i-1))/norm(y(:,i-1)) < err         %�ж��Ƿ��������ѭ������
        break;
    end
end

result = y;