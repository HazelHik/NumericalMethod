%% main
clc;
format long
A = [25 -41 10 -6;
    -41 68 -17 10;
    10 -17 5 -3;
    -6 10 -3 2];
b = [32 23 33 31]';
accurate = A\b;
% for i=1:4
%     m = max(A(i,:));
%     A(i,:)=A(i,:)/m;
% end
% A
% in = inv(A)
[X_j,i_j] = jacobi(A,b);

[X_g,i_g] = gs(A,b);

result = guass(A,b);

y = lumethod(A,b);