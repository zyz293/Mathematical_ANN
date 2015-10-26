clear;clc;
list = dir('C:\Users\DaTui\Desktop\winter_quarter\research\Simulation_results\imag\*.csv');
num = length(list);
fid = fopen('real_fit_parameter_poly_new.csv','w');
fprintf(fid,'%s,','sample_name');
fprintf(fid,'%s,','a1');
fprintf(fid,'%s,','a2');
fprintf(fid,'%s,','a3');
fprintf(fid,'%s,','a4');
fprintf(fid,'%s,','a5');
fprintf(fid,'%s,','a6');
fprintf(fid,'%s,','a7');
fprintf(fid,'%s,','a8');
fprintf(fid,'%s,','SSE');
fprintf(fid,'%s,','R_square');
fprintf(fid,'%s,','DFE');
fprintf(fid,'%s,','adj_R_square');
fprintf(fid,'%s\n','RMSE');
for i = 1 : num
    current_file = list(i).name;
    disp(strcat('===========',current_file,'========='))
    path = strcat('C:\Users\DaTui\Desktop\winter_quarter\research\Simulation_results\imag\',current_file);
    data = load(path);
    x = log(data(:,1));
    y = data(:,2);
    [fitresult, gof] = createFit_poly(x,y);
    a1 = fitresult.p1;
    a2 = fitresult.p2;
    a3 = fitresult.p3;
    a4 = fitresult.p4;
    a5 = fitresult.p5;
    a6 = fitresult.p6;
    a7 = fitresult.p7;
    a8 = fitresult.p8;
    SSE = gof.sse;
    R_square = gof.rsquare;
    DFE = gof.dfe;
    adj_R_square = gof.adjrsquare;
    RMSE = gof.rmse;
    
    name = strsplit(current_file,'_');
    fprintf(fid,'%s,',name{1});
    fprintf(fid,'%d,',a1);
    fprintf(fid,'%d,',a2);
    fprintf(fid,'%d,',a3);
    fprintf(fid,'%d,',a4);
    fprintf(fid,'%d,',a5);
    fprintf(fid,'%d,',a6);
    fprintf(fid,'%d,',a7);
    fprintf(fid,'%d,',a8);
    fprintf(fid,'%d,',SSE);
    fprintf(fid,'%d,',R_square);
    fprintf(fid,'%d,',DFE);
    fprintf(fid,'%d,',adj_R_square);
    fprintf(fid,'%d\n',RMSE);
end
fclose(fid);
%real = a1*exp(-((x-b1)/c1).^2) + a2*exp(-((x-b2)/c2).^2); 
% less accurate, but less parameters

%y = b1 + b2* exp(b3*x)+c1 + c2*x + c3*x.^2 + c4*x.^3;	
%better accurate, but more parameters