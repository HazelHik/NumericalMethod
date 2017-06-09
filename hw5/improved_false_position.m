function [xl,xu,xr,ea] = improved_false_position(a,b,tol)
xl(1) = a;
xu(1) = b;
ea(1) = 1;
fu(1) = f(xu(1));
fl(1) = f(xl(1));
xr(1) = xu(1) -fu(1)*(xl(1)-xu(1))/(fl(1)-fu(1));
if fl(1)*f(xr(1))<0
    xl(2) = xl(1);
    xu(2) = xr(1);
else
    if f(xl(1))*f(xr(1))>0
        xl(2) = xr(1);
        xu(2) = xu(1);
    end
end
fu(2) = f(xu(2));
fl(2) = f(xl(2));
index = 2;
while(ea(index-1)>tol)
    xr(index) = xu(index) -fu(index)*(xl(index)-xu(index))/(fl(index)-fu(index));
    ea(index) = abs((xr(index)-xr(index-1))/xr(index));
    if f(xl(index))*f(xr(index))<0
        xl(index+1) = xl(index);
        xu(index+1) = xr(index);
    else 
        if f(xl(index))*f(xr(index))>0
            xl(index+1) = xr(index);
            xu(index+1) = xu(index);
        else
            break;
        end
    end
    fu(index+1) = f(xu(index+1));
    fl(index+1) = f(xl(index+1));
    if ((fu(index+1)==fu(index))&&(fu(index)==fu(index-1)))
        fu(index+1) = fu(index+1)/2;
    end
    if ((fl(index+1)==fl(index))&&(fl(index)==fl(index-1)))
        fl(index+1) = fl(index+1)/2;
    end
    index = index + 1;
end
end