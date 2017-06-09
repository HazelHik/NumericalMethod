% main

List = [5 10 15 20 25];
x = zeros(5,6);
y = zeros(5,6);
standard_y = zeros(5,1);
standard_x = zeros(5,1);
for i = 1:5
   
    index = List(i);
    [a,b] = createEquation(index);
    
    temp = vpa(a\b,20);
    standard_y(i) = temp(index);
    standard_x(i) = 5/6*(0.5-standard_y(i));
    
    %% 高斯直接
    result1 = vpa(gauss_direct(a,b),20);
    y(i,1) = result1(index);
    x(i,1) = 5/6*(0.5-y(i,1));
    
    %% 高斯列主元
    result2 = vpa(gauss_column(a,b),20);
    y(i,2) = result2(index);
    x(i,2) = 5/6*(0.5-y(i,2));
    
    %% LU分解
    result3 = vpa(lumethod(a,b),20);
    y(i,3) = result3(index);
    x(i,3) = 5/6*(0.5-y(i,3));
    
    %% Jacobi
    [result4] = vpa(jacobi(a,b),20);
    k(i,1) = size(result4,2);
    y(i,4) = vpa(result4(index,k(i,1)),20);
    x(i,4) = vpa(5/6*(0.5-y(i,4)),20);
    
    %% Gauss-Seidel
    [result5] = vpa(gaussSeidel(a,b),20);
    k(i,2) = size(result5,2);
    y(i,5) = vpa(result5(index,k(i,2)),20);
    x(i,5) = vpa(5/6*(0.5-y(i,5)),20);
    
    %% SOR
    [result6] = vpa(sor(a,b,1),20);
    k(i,3) = size(result6,2);
    y(i,6) = vpa(result6(index,k(i,3)),20);
    x(i,6) = vpa(5/6*(0.5-y(i,6)),20);
    
end
figure;hold on;
for i = 1:5
    plot(1:6,x(i,1:6));
end