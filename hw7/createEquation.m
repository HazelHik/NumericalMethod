function [a, b] = createEquation(n)
a = zeros(n);      % Ԥ����
b = zeros(n,1);   
a(1,1)=-5.8;              % ��һ�����һ��Ϊ����ֵ   
a(1,2)=4.8;
a(n,n-1)=1;                  
a(n,n)=-5.8;
for i=2:1:n-1                
    a(i,i-1)=1;
    a(i,i)=-5.8;
    a(i,i+1)=4.8;
end
b(1) = -0.5;
end