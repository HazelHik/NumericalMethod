%% Guass 

equa =[5 5 0 0 0 5.35;
        0 5 -7 -2 0 0;
        0 0 0 2 -3 0;
        1 -1 -1 0 0 0;
        0 0 1 -1 -1 0];
    
origin  = equa;
num = size(origin,1);

% for i=1:num                       % 缩放
%     origin(i,:) = origin(i,:)/max(abs(origin(i,:)));
% end

%% elimination
for i=1:num-1                       % 每次选取一个主元
    temp = abs(origin(i:num,i));
    [m,line] = max(temp);
    if (line~=1)                    % 这一行的i列数据不是最大的，则要交换
        temp1 = origin(i,:);
        origin(i,:) = origin(line+i-1,:);
        origin(line+i-1,:) = temp1;
    end
    if (origin(i,i) == 0)           % 这一项是0的话可以不用消后面的了
        continue;
    end
    for j= i+1:num                  % 对后几行消元
        origin(j,:) = origin(j,:) - origin(j,i)/origin(i,i)*origin(i,:)
    end
end

%% inverse
origin(num,:) = origin(num,:)/origin(num,num);
for i = num-1:-1:1
    for j = i+1:num                 % 倒着对后面几项都消元
        origin(i,:) = origin(i,:)-origin(i,j)/origin(j,j)*origin(j,:);
    end
    origin(i,:) = origin(i,:)/origin(i,i)
end
    
%% validate
result = origin(:,size(origin,2));
ans(:,1) = equa(:,1:num)*result;    % 代回去计算方程右侧
ans(:,2) = ans(:,1) - equa(:,size(origin,2));  % 计算误差
