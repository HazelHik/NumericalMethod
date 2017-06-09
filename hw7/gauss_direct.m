function result = gauss_direct(a,b)
%% Guass 
equa = [a b];  
origin  = equa;
num = size(origin,1);

%% elimination
for i=1:num-1                       % 每次选取一个主元
    if (origin(i,i) == 0)           % 这一项是0的话可以不用消后面的了
        continue;
    end
    for j= i+1:num                  % 对后几行消元
        origin(j,:) = origin(j,:) - origin(j,i)/origin(i,i)*origin(i,:);
    end
end

%% inverse
origin(num,:) = origin(num,:)/origin(num,num);
for i = num-1:-1:1
    for j = i+1:num                 % 倒着对后面几项都消元
        origin(i,:) = origin(i,:)-origin(i,j)/origin(j,j)*origin(j,:);
    end
    origin(i,:) = origin(i,:)/origin(i,i);
end
    
%% validate
result = origin(:,size(origin,2));
