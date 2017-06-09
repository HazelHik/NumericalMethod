function [k,y,P] = secant(p0,p1,delta,max1)

P(1,1) = p0;
P(2,1) = p1;
for k=3:max1
 P(k,1)=P(k-1,1)-f(P(k-1,1))*(P(k-1,1)-P(k-2,1))/(f(P(k-1,1)) -f(P(k-2,1)));    %�µĵ���ֵ 
 err=abs(P(k,1)-P(k-1,1));                        %���ƾ������ͽ���������
 relerr=2*err/(abs(P(k,1))+delta);   
 P(k,2) = relerr;
 y=f(P(k,1));                             
 if (err<delta)||(relerr<delta)||(abs(y)<eps)
     break
 end  %��ֹ�����ж�
end

end