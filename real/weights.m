clear;clc;

data = csvread('C:\Users\DaTui\Desktop\sample7-20rpm-60kx_2D_comsolbuild_AC_binary_03-Feb-2015_IP10+50_run_1_CompPermReal.csv');
x = log(data(:,1));
fid = fopen('weights.csv','w');
fprintf(fid,'%s,','w1');
fprintf(fid,'%s,','w2');
fprintf(fid,'%s,','w3');
fprintf(fid,'%s,','w4');
fprintf(fid,'%s,','w5');
fprintf(fid,'%s,','w6');
fprintf(fid,'%s\n','fval');
w = [1;1;1;1;1;1];
s = 1;
e = 46;
for k = 1:100

for i = 1: size(x,1)
    z = x(i,1);

b = [1;1;1;1;1;1];
%A = [-1,0,0,0,0,0;...
%      1,0,0,0,0,0;...
%      0,-1,0,0,0,0;...
%      0,1,0,0,0,0;...
%      0,0,-1,0,0,0;...
%      0,0,1,0,0,0;...
%      0,0,0,-1,0,0;...
%      0,0,0,1,0,0;...
%      0,0,0,0,-1,0;...
%      0,0,0,0,1,0;...
%      0,0,0,0,0,-1;...
%      0,0,0,0,0,1];
%b = [10;10;10;10;10;10;10;10;10;10;10;10];


  %parameter of fit
    a1 = 4.1183;
    a2 = 0.0195756;
    a3 = 0.2530429;
    a4 = -0.01546296;
    a5 = -0.001090984;
    a6 = -0.0003350593;
    %parameter of prediction
    p1 = 4.1875*w(1,1);
    p2 = 0.0069894*w(2,1);
    p3 = 0.30864*w(3,1);
    p4 = -0.021045*w(4,1);
    p5 = -0.0011918*w(5,1);
    p6 = -0.00045412*w(6,1);
    
f = @(w)((a1 + a2* exp(a3*z)+ a4*z + a5*z.^2 + a6*z.^3) - (w(1)*p1 + w(2)*p2* exp(w(3)*p3*z)+ w(4)*p4*z + w(5)*p5*z.^2 + w(6)*p6*z.^3))^2;

[w,fval] = fminsearch(f,b);
    for j = 1:size(w,1)
        fprintf(fid,'%d,',w(j));
    end
fprintf(fid,'%d\n',fval);
end
fprintf(fid,'\n');

data = csvread('C:\Users\DaTui\Desktop\winter_quarter\research\doing\weights.csv',1,0);
for i = 1 : 5
    pre = data(s:e,i);
    total = sum(pre);
    mean = total/46;
    fprintf(fid,'%d,',mean);
  
end
    pre = data(s:e,6);
    total = sum(pre);    
    mean = total/46;
    fprintf(fid,'%d\n',mean);
   s = s+47;
   e = e+47;
fprintf(fid,'\n');
fprintf(fid,'\n');
end
fclose(fid);