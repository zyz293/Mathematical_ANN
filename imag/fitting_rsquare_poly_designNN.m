clear;clc;

data = csvread('C:\Users\DaTui\Desktop\sample9-20rpm-60kx_2D_comsolbuild_AC_binary_05-Feb-2015_IP10+50_run_1_CompPermImag.csv');
x = log(data(:,1));
y = data(:,2);
figure(1)
plot(x,y,'-r');
hold on

a1 = 0.00000001526143;
a2 = -0.0000003124087;
a3 = -0.0000007050768;
a4 = 0.00003541667;
a5 =-0.0001058866;
a6 = 0.0005033774;
a7 = 0.003135387;
a8 = 0.02281132;
yf = a8+a7*x+a6*x.^2+a5*x.^3+a4*x.^4+a3*x.^5+a2*x.^6+a1*x.^7;

plot(x,yf,'-r');
hold on;

p1 = 1.6323e-08;  % 25 input linear **** (design)
p2 = -3.2779e-07;
p3 = -1.0393e-06;
p4 = 4.2964e-05;
p5 = -0.00014447;
p6 = 0.00047959;
p7 = 0.0033536;
p8 = 0.022579;
yp = p8+p7*x+p6*x.^2+p5*x.^3+p4*x.^4+p3*x.^5+p2*x.^6+p1*x.^7;

plot(x,yp,'-g');
hold on;


%%%%%%%R-square between real and yp
ybar1 = mean(y);
SSE_real_prediction = sum((yf - y).^2)  %A small SSE indicates a tight fit of the model to the data
SST_real_prediction = sum((y - ybar1).^2)
R2_real_prediciton = 1 - SSE_real_prediction/SST_real_prediction
%%%%%%%R-square between yf and yp
ybar2 = mean(yf);
SSE_fit_prediciton = sum((yp - yf).^2)
SST_fit_prediction = sum((yf - ybar2).^2)
R2_fit_prediciton = 1 - SSE_fit_prediciton/SST_fit_prediction