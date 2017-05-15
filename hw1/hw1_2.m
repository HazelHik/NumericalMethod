
x = 100000;

%% standard
digits(64);
y1 = vpa(log(x-sqrt(x^2-1)));
digits(64);
y2 = vpa(-log(x+sqrt(x^2-1)));

%% single
xs2 = single(sqrt(x^2-1));
ys1 = single(log(x-xs2));
ys2 = single(-log(x+xs2));

%% double
xd2 = sqrt(x^2-1);
yd1 = log(x-xd2);
yd2 = -log(x+xd2);

%% output
diff_s = [ys1-y2;ys2-y2];
diff_d = [yd1-y2;yd2-y2];
