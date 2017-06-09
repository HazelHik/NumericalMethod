function [k,p,P]= fixpt(p0,tol,max1)                         

P(1,1)=p0;                           %不动点初始值                        
for k=2:max1    %最大迭代次数，防止不动点迭代发散或者无法达到设置精度而死循环
    P(k,1)=g(P(k-1,1));                 %以重组函数旧值为新的自变量值
    err = abs(P(k)-P(k-1));
    relerr = err/(abs(P(k))+eps);   %计算迭代近似值的近似相对误差；
    P(k,2) = relerr;
    p = P(k);   
    dP(k)=df(P(k));              %计算此时所对应的导数值
    if ((err<tol)||(relerr<tol))               %近似的相对误差达到机器精度即停止
        break
    end    
end
if k==max1                           %k等于最大迭代次数时未算出则提示
    disp('maximum number of iterations exceeded')
end

end
