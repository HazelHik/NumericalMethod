
stan_value = pi^4/90;
iter = 10000;
%% single
tic
fs_1 = single(0);
fs_2 = single(0);
for i=1:iter
    fs_1 = fs_1 + single(1/(i^4));
    fs_2 = fs_2 + single(1/(iter+1-i)^4);
end
toc
%% double
tic
fd_1 = 0;
fd_2 = 0;
for i=1:iter
    fd_1 = fd_1 + 1/(i^4);
    fd_2 = fd_2 + 1/(iter+1-i)^4;
end
toc
%% output
error = [stan_value-fs_1;stan_value-fs_2;
    stan_value-fd_1;stan_value-fd_2];

fprintf('Standard_value = %0.15f\n',stan_value);
fprintf('Single 1:10000  result = %0.7f\n',fs_1);
fprintf('                 error = %0.15f\n',error(1));
fprintf('       10000:1  result = %0.7f\n',fs_2);
fprintf('                 error = %0.15f\n',error(2));
fprintf('Double 1:10000  result = %0.15f\n',fd_1);
fprintf('                 error = %0.15f\n',error(3));
fprintf('       10000:1  result = %0.15f\n',fd_2);
fprintf('                 error = %0.15f\n',error(4));

figure;
bar(error(1:2),0.5);
title('Error of Single');
xlabel(' 1-1:10000   2-10000:1');
figure;
bar(error(3:4),0.5);
title('Error of Double');
xlabel(' 1-1:10000   2-10000:1');

%% addition
% change the iternirent

error_1 = zeros(25000,1);
error_2 = zeros(25000,1);
for k= 5001:30000
    fd_3 = 0;
    fd_4 = 0;
    for i=1:k
        fd_3 = fd_3 + 1/(i^4);
        fd_4 = fd_4 + 1/(k+1-i)^4;
    end
    error_1(k+1-5001) = fd_3 - stan_value;
    error_2(k+1-5001) = fd_4 - stan_value;
end
figure
plot(5001:30000,error_1,'-r');
hold on;
plot(5001:30000,error_2,'-b');

