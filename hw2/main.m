%% hw2
% e^x - 2 = cos(e^x - 2)
% root between [0.5,1.5]
% real_num = solve('exp(x)-2 = cos(exp(x)-2)','x');
% x = 0.5:0.02:1.5;
% y = f(x);
% plot(x,y);
%% bisect
[xl1,xu1,xr1,ea1] = bisect(0.5,1.5);
et1 = (xr1-real_num)/real_num;
%% false_position
[xl2,xu2,xr2,ea2] = false_position(0.5,1.5);
et2 = (xr2-real_num)/real_num;
%% improved_false_position
[xl3,xu3,xr3,ea3] = improved_false_position(0.5,1.5);
et3 = (xr3-real_num)/real_num;
%% plot
% figure;
% plot(1:size(ea1,2),ea1);
% hold on;
% plot(1:size(et1,2),et1);
% figure;
% plot(1:size(ea2,2),ea2);
% hold on;
% plot(1:size(et2,2),et2);
% figure;
% plot(1:size(ea3,2),ea3);
% hold on;
% plot(1:size(et3,2),et3);

figure;
plot(1:size(xr1,2),xl1(1:size(xr1,2)));
hold on;
plot(1:size(xr1,2),xu1(1:size(xr1,2)));
plot(1:size(xr1,2),xr1);
figure;
plot(1:size(xr2,2),xl2(1:size(xr2,2)));
hold on;
plot(1:size(xr2,2),xu2(1:size(xr2,2)));
plot(1:size(xr2,2),xr2);
figure;
plot(1:size(xr3,2),xl3(1:size(xr3,2)));
hold on;
plot(1:size(xr3,2),xu3(1:size(xr3,2)));
plot(1:size(xr3,2),xr3);