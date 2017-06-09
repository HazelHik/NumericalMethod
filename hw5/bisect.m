function [xl,xu,xr,ea] = bisect(a,b,tol)
xl(1) = a;
xu(1) = b;                          % ≥ı ºµ„
index = 1;
ea(index) = 1;
xr(index) = (xl(index)+xu(index))/2;
if f(xl(index))*f(xr(index))<0
    xl(index+1) = xl(index);
    xu(index+1) = xr(index);
else
    if f(xl(index))*f(xr(index))>0
        xl(index+1) = xr(index);
        xu(index+1) = xu(index);
    end
end
index = 2;
while(ea(index-1)>tol)
    xr(index) = (xl(index)+xu(index))/2;
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
    index = index + 1;
end
end