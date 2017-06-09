%% main
format long;   %���������ʽ�����˫���Ƚ��
close all;
syms first_h

first_h = fsolve(@f,[1:1.5]);
real_h = fsolve(@f2,[0:1]);
%% show the curve
% x = 0:0.01:pi;
% y = f(x);
% plot(x,y,'r.');
% grid on;
% title('Function Curve');

tol = 1e-10;
a = -10;
b = 10;
maxl = 10^10;                   % ����������
%% bisect 
[xl1,xu1,xr1,ea1] = bisect(a,b,tol);
size(xr1,2) 
figure;
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(xr1) 
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(ea1)           
subplot(1,3,3)                    %�������������У�������ı仯����
r = (xr1-first_h)/first_h;
plot(r)
%% false_position
[xl2,xu2,xr2,ea2] = false_position(a,b,tol);
size(xr2,2)
figure;
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(xr2) 
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(ea2)           
subplot(1,3,3)                    %�������������У�������ı仯����
r = (xr2-first_h)/first_h;
plot(r)

% improved_false_position
[xl3,xu3,xr3,ea3] = improved_false_position(a,b,tol);
size(xr3,2)
figure;
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(xr3) 
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(ea3)           
subplot(1,3,3)                    %�������������У�������ı仯����
r = (xr3-first_h)/first_h;
plot(r)

%% fixpt
p0 = 10;
[k,p_fix,P]= fixpt(p0,tol,maxl);
k
xlswrite('fixpt.xls',P,'sheet1');     %�����������excel
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(P(:,1))
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(P(:,2))
subplot(1,3,3)                    %�������������У�������ı仯����
P(:,3) = (P(:,1)-first_h)/first_h;
plot(P(:,3))

%% newton
[p_new,k,P] = newton(p0,tol,maxl);
k
xlswrite('newton.xls',P,'sheet1');     %�����������excel
figure;
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(P(:,1))
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(P(:,3))
subplot(1,3,3)                    %�������������У�������ı仯����
P(:,5) = (P(:,1)-first_h)/first_h;
plot(P(:,5))

%% secant
[k,y,P] = secant(a,b,tol,maxl);
k
xlswrite('secant.xls',P,'sheet1');     %�����������excel
figure;
subplot(1,3,1)                    %�������������У�����ֵ�ı仯����
plot(P(:,1)) 
subplot(1,3,2)                    %�������������У�����������ı仯����
plot(P(:,2))           
subplot(1,3,3)                    %�������������У�������ı仯����
P(:,3) = (P(:,1)-first_h)/first_h;
plot(P(:,3))


