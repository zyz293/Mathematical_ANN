clear;clc;
list = dir('C:\Users\DaTui\Desktop\winter_quarter\research\Simulation_results\real\*.csv');
num = length(list); % get the curve file's sample name  
% the real_curve file, regard the curve sample name as reference


data = csvread('C:\Users\DaTui\Desktop\winter_quarter\research\doing\real\SVs_final.csv',1,1);
DR  = [];
for i = 1 :25  % where can be changed
    DR(:,i) = data(:,i);
end
mi = min(DR);
min = min(mi);
ma = max(DR);
max = max(ma); % get the min and max values of the SV matrix


fid = fopen('SVs_final_normalization.csv','w');
img_list = dir('C:\Users\DaTui\Desktop\winter_quarter\research\test_file\*.mat');
num_img = length(img_list);  % get the .mat file's sample name

for j = 1 : size(DR,1)
    
    ref_sample_prename = list(j).name;
    ref_sample_name = strsplit(ref_sample_prename,'_');
    ref_sample_name_final = ref_sample_name{1};  % get the current curve file's sample name
    
    
    for l = 1 : num_img
        current_file = img_list(l).name;
        prename = strsplit(current_file,'.');
        name = prename{1};  % get the current .mat file's sample name
    
    
        if strcmp(name, ref_sample_name_final) == 1
            fprintf(fid,'%s,',name);
            for k = 1 : size(DR,2) -1
                DRN = 1/(max - min) * DR(l,k) - min / (max - min);
                fprintf(fid,'%d,',DRN);
            end
            DRN = 1/(max - min) * DR(l,10) - min / (max - min);
            fprintf(fid,'%d\n',DRN);
            
        end
    end
end

fclose(fid);