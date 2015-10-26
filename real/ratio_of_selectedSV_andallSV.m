clear;clc;

data = csvread('C:\Users\DaTui\Desktop\winter_quarter\research\doing\imag\SVs_final.csv',1,1);
data = data(1,:);
ratio = sum(data(1,1:25))/sum(data(:))