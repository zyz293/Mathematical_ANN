clear;clc;
data = csvread('C:/Users/DaTui/Desktop/winter_quarter/research/doing/imag/combine_input_output_poly.csv',1,0);
data_input = data(1:195,1:25)';
data_output = data(1:195,26:33)';
data_test = data(196,1:25)';
