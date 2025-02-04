function y = maf_ZP(x, windowSize)
% This is like a MAF with double window size and zero phase delay
b = (1/windowSize)*ones(1,windowSize);
a = 1;

y = FiltFilt(b,a,x);
