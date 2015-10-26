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

plot(x,yf,'-r');
hold on;


a1 = 4.2159; %from the matlab 20 input forward NN
a2 =  0.013347;
a3 = 0.26641;
a4 = -0.012595;
a5 = -0.0011892;
a6 = -0.00024632;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;

yp1 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp1,'-g');
hold on

a1 = 4.1297; %from the matlab 20 input  GRNN
a2 = 0.014766;
a3 = 0.27339;
a4 = -0.014499;
a5 = -0.00097175;
a6 = -0.00032539;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;

yp2 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp2,'-b');
hold on

a1 = 4.2048; %from the matlab 20 input  linear layer(design)
a2 = 0.020437;
a3 = 0.27313;
a4 = -0.017727;
a5 = -0.0007146;
a6 = -0.00047245;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;

yp3 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp3,'-y');
hold on

a1 = 4.0533; %from the matlab 25 input  forward NN
a2 = 0.010663;
a3 = 0.27896;
a4 = -0.012093;
a5 = -0.0011488;
a6 = -0.00022946;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;

yp4 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp4,'-og');
hold on

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

yp2 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp2,'-ob');
hold on

a1 = 4.1833; %from the matlab 25 input  linear layer(design)
a2 = 0.022168;
a3 = 0.24182;
a4 = -0.016003;
a5 = -0.00097386;
a6 = -0.00038046;
%weights
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;
w5 = 1;
w6 = 1;

yp3 = w1*a1 + w2*a2* exp(w3*a3*x)+ w4*a4*x + w5*a5*x.^2 + w6*a6*x.^3;

plot(x,yp3,'-oy');
hold on
