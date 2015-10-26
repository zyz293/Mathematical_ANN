clear;clc
img_list = dir('C:\Users\DaTui\Desktop\winter_quarter\research\test_file\*.mat');
num_img = length(img_list);
fid = fopen('SVs_final.csv','w');

fprintf(fid,'%s,','sample_name');
for k = 1 : 1429
    fprintf(fid,'%d,',k);
end
fprintf(fid,'%s\n','SV_1430');
for i = 1 : num_img
    current_file = img_list(i).name;
    name = strsplit(current_file,'.');
    fprintf(fid,'%s,',name{1});
    disp(strcat('========',current_file,'========='))
    file_path = strcat('C:\Users\DaTui\Desktop\winter_quarter\research\test_file\',current_file);
    load(file_path)
    [U,S,V] = svd(img_out);
    Z = U * S * V'; % Z = img_out
    %z = img_out - Z;  % it is used to varify if Z is equal to img_out
    for j = 1 : (size(S,2)-1)
        fprintf(fid,'%d,',S(j,j));
    end
    fprintf(fid,'%d\n',S(1430,1430));
end

        











%for i = 1 : size(z,1)
%    for j = 1 : size(z,2)
%       if z(i,j) > 0.000001
%            z(i,j)
%        end
%    end
%end


%A = csvread('characterization.csv',1,2);
%A(136,:) = [];
%A(141,:) = [];
%A = A';


%A = [0,0,1,1,0,0,0,0,0;...
%    0,0,0,0,0,1,0,0,1;...
%    0,1,0,0,0,0,1,0,0;...
%    0,0,0,0,0,0,1,0,1;...
%    1,0,0,0,0,1,0,0,0;...
%    1,1,1,1,1,1,1,1,1;...
%    1,0,1,0,0,0,0,0,0;...
%    0,0,0,0,0,0,1,0,1;...
%    0,0,0,0,0,2,0,0,1;...
%    1,0,1,0,0,0,0,1,0;...
%    0,0,0,1,1,0,0,0,0];


%[X,B,Y] = svd(A);
%Z = X * B * Y';
%z = A - X * B * Y';






















