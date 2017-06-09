function [k,y,P] = secant(p0,p1,delta,max1)

P(1,1) = p0;
P(2,1) = p1;
for k=3:max1
 P(k,1)=P(k-1,1)-f(P(k-1,1))*(P(k-1,1)-P(k-2,1))/(f(P(k-1,1)) -f(P(k-2,1)));    %新的迭代值 
 err=abs(P(k,1)-P(k-1,1));                        %近似绝对误差和近似相对误差
 relerr=2*err/(abs(P(k,1))+delta);   
 P(k,2) = relerr;
 y=f(P(k,1));                             
 if (err<delta)||(relerr<delta)||(abs(y)<eps)
     break
 end  %终止条件判断
end

end