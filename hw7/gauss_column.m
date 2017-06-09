function result = gauss_column(a,b)
%% Guass 
equa = [a b];  
origin  = equa;
num = size(origin,1);

%% elimination
for i=1:num-1                       % ÿ��ѡȡһ����Ԫ
    temp = abs(origin(i:num,i));
    [~,line] = max(temp);
    if (line~=1)                    % ��һ�е�i�����ݲ������ģ���Ҫ����
        temp1 = origin(i,:);
        origin(i,:) = origin(line+i-1,:);
        origin(line+i-1,:) = temp1;
    end
    if (origin(i,i) == 0)           % ��һ����0�Ļ����Բ������������
        continue;
    end
    for j= i+1:num                  % �Ժ�����Ԫ
        origin(j,:) = origin(j,:) - origin(j,i)/origin(i,i)*origin(i,:);
    end
end

%% inverse
origin(num,:) = origin(num,:)/origin(num,num);
for i = num-1:-1:1
    for j = i+1:num                 % ���ŶԺ��漸���Ԫ
        origin(i,:) = origin(i,:)-origin(i,j)/origin(j,j)*origin(j,:);
    end
    origin(i,:) = origin(i,:)/origin(i,i);
end
    
%% validate
result = origin(:,size(origin,2));
% ans(:,1) = equa(:,1:num)*result;    % ����ȥ���㷽���Ҳ�
% ans(:,2) = ans(:,1) - equa(:,size(origin,2));  % �������
