clear;clc;
SV = csvread('C:\Users\DaTui\Desktop\winter_quarter\research\doing\imag\SVs_final_normalization.csv',0,1);
par = csvread('C:\Users\DaTui\Desktop\winter_quarter\research\doing\imag\real_fit_parameter.csv',1,1);
para = par(:,1:7); % where to make the change

fid = fopen('combine_input_output.csv','w');
for i = 1: size(SV,2)
    input = strcat('input',num2str(i));
    fprintf(fid,'%s,',input);
end
for i = 1:size(para,2)-1
    output = strcat('output',num2str(i));
    fprintf(fid,'%s,',output);
end
output2 = strcat('output',num2str(size(para,2)));
fprintf(fid,'%s\n',output2);

for i = 1 : size(SV,1)
   for j = 1: size(SV,2)
      fprintf(fid,'%d,',SV(i,j));
   end
   for k = 1 : size(para,2)-1
       fprintf(fid,'%d,',para(i,k));
   end
   fprintf(fid,'%d\n',para(i,size(para,2)));
end

fclose(fid);
