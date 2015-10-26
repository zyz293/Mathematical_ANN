clear;clc;

data = csvread('C:\Users\DaTui\Desktop\sample9-20rpm-60kx_2D_comsolbuild_AC_binary_05-Feb-2015_IP10+50_run_1_CompPermImag.csv');
x = log(data(:,1));
y = data(:,2);
figure(1)
plot(x,y,'-r');
hold on

a1 = -0.001986511;
a2 = 0.1955443;
a3 = 2.636626;
a4 = -0.00008177958;
a5 =0.001466347;
a6 = 0.002502012;
a7 = 0.0201888;

yf = a1*sin(a2*x+a3)+a4*x.^3 + a5*x.^2 + a6*x + a7;

plot(x,yf,'-r');
hold on;

p1 = 0.014447;  % 25 input linear **** (design)
p2 = -0.34024;
p3 = 5.0846;
p4 = -0.00010794;
p5 =0.0018834;
p6 = 0.0021284;
p7 = 0.01391;

yp1 = p1*sin(p2*x+p3)+p4*x.^3 + p5*x.^2 + p6*x + p7;

plot(x,yp1,'-g');
hold on;

p1 = 0.0072019;  % 25 input GRNN
p2 = 0.69978;
p3 = 1.1657;
p4 = -0.00010578;
p5 =0.001842;
p6 = 0.0017975;
p7 = 0.016223;

yp2 = p1*sin(p2*x+p3)+p4*x.^3 + p5*x.^2 + p6*x + p7;

plot(x,yp2,'-b');
hold on;

