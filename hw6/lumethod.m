function [u]=lumethod(A,B)          %tol为系统与0的接近容限
n = 4;
flag=0;
[A,h,flag]=decompose(A,n,eps,flag);     %h中放置行序号
if flag~=-1
    [u]=back1(A,h,n,B);
end
end
%% decompose
function [A,h,flag]=decompose(A,n,tol,flag) 
for i=1:n
    h(i)=i;
    s(i)=abs(A(i,1));
    for j=2:n
        if abs(A(i,j))>s(i)
            s(i)=abs(A(i,j));               %选行最大元素
        end
    end
end
for k=1:n-1
    [h]=change1(A,h,s,n,k);
    if abs(A(h(k),k)/s(h(k)))<tol           %判断是否有0
        flag=-1;
        A(h(k),k)/s(h(k))
        break;
    end
    for i=k+1:n
        factor=A(h(i),k)/A(h(k),k);
        A(h(i),k)=factor;                   %L放入A
        for j=k+1:n                         %U放入A
            A(h(i),j)=A(h(i),j)-factor*A(h(k),j);
        end
    end
end
if abs(A(h(k),k)/s(h(k)))<tol
    flag=-1;
    A(h(k),k)/s(h(k))
end
end
%%回代部分函数
function [u]=back1(A,h,n,B)
for i=2:n
    sum=B(h(i));
    for j=1:i-1
        sum=sum-A(h(i),j)*B(h(j));
    end
    B(h(i))=sum;                                %前向代入求U
end
u(n)=B(h(n))/A(h(n),n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+A(h(i),j)*u(j);
    end
    u(i)=(B(h(i))-sum)/A(h(i),i);               %后向代入求U
end
u=u';
end
%% inverse
function [h]=change1(A,h,s,n,k)
p=k;                                            %p记录行序号
big=abs(A(h(k),k)/s(h(k)));
for ii=k+1:n
    dummy=abs(A(h(ii),k)/s(h(ii)));
    if dummy>big
        big=dummy;
        p=ii;
    end
end
dummy=h(p);                                     %主元的行序号交换
h(p)=h(k);
h(k)=dummy;
end    
