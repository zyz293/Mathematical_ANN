clear;clc;

data = csvread('C:\Users\DaTui\Desktop\sample9-20rpm-60kx_2D_comsolbuild_AC_binary_05-Feb-2015_IP10+50_run_1_CompPermReal.csv');
x = log(data(:,1));
y = data(:,2);
figure(1)
plot(x,y,'-r');
hold on

a1 = 4.20451;
a2 = 0.0127611;
a3 = 0.2749536;
a4 = -0.01447229;
a5 =-0.0009255385;
a6 = -0.0003364819;
yf = a1 + a2* exp(a3*x)+ a4*x + a5*x.^2 + a6*x.^3;
plot(x,yf,'-g');
hold on;

a1 = 4.173; %from the matlab 25 input  GRNN 0.001
a2 = 0.01689;
a3 = 0.26468;
a4 = -0.014802;
a5 = -0.00079846;
a6 = -0.00036784;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;
yp = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;
plot(x,yp,'-b');

legend('simulation curve','fitting curve','prediction curve');
%%%%%%%R-square between real and yp
ybar1 = mean(y);
SSE_real_prediction = sum((yp - y).^2)  %A small SSE indicates a tight fit of the model to the data
SST_real_prediction = sum((y - ybar1).^2)
R2_real_prediciton = 1 - SSE_real_prediction/SST_real_prediction
%%%%%%%R-square between yf and yp
ybar2 = mean(yf);
SSE_fit_prediciton = sum((yp - yf).^2)
SST_fit_prediction = sum((yf - ybar2).^2)
R2_fit_prediciton = 1 - SSE_fit_prediciton/SST_fit_prediction

figure(2)
plot(y,yp)
hold on
a = 3.5:0.1:4.5;
plot(a,a,'-r')
xlabel('simulation result');
ylabel('prediction result');