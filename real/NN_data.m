clear;clc;
data = csvread('C:/Users/DaTui/Desktop/winter_quarter/research/doing/real/combine_input_output.csv',1,0);
data_input = data(1:195,1:25)';
data_output = data(1:195,26:31)';
data_test = data(196,1:25)';
