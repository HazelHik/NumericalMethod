function result = gauss_direct(a,b)
%% Guass 
equa = [a b];  
origin  = equa;
num = size(origin,1);

%% elimination
for i=1:num-1                       % ÿ��ѡȡһ����Ԫ
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
