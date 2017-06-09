function [xl,xu,xr,ea] = false_position(a,b,tol)

xl(1) = a;
xu(1) = b;
ea(1) = 1;
xr(1) = xu(1) -f(xu(1))*(xl(1)-xu(1))/(f(xl(1))-f(xu(1)));
if f(xl(1))*f(xr(1))<0
    xl(2) = xl(1);
    xu(2) = xr(1);
else
    if f(xl(1))*f(xr(1))>0
        xl(2) = xr(1);
        xu(2) = xu(1);
    end
end
index = 2;
while(ea(index-1)>tol)
    xr(index) = xu(index) -f(xu(index))*(xl(index)-xu(index))/(f(xl(index))-f(xu(index)));
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