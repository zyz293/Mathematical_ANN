clear;clc;

data = csvread('C:\Users\DaTui\Desktop\sample9-20rpm-60kx_2D_comsolbuild_AC_binary_05-Feb-2015_IP10+50_run_1_CompPermImag.csv');
x = log(data(:,1));
y = data(:,2);
figure(1)
plot(x,y,'.');

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
ylabel('y');
xlabel('log(freq)');
legend('simulation curve','fitting curve');