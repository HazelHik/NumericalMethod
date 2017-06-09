function [p0,k,P] = newton(p0,delta,max1)
P(1,1) = p0;
for k=2:max1
    P(k,1) = P(k-1,1) - f(P(k-1,1))/df(P(k-1,1));
    err = abs(P(k,1)-P(k-1,1));
    P(k,2) = err;
    relerr = 2*err/(abs(P(k,1))+delta);
    P(k,3) = relerr;
    y = f(P(k-1,1));
    P(k,4) = y;
    if (err<delta)||(relerr<delta)||(abs(y)<eps)
        break
    end
end