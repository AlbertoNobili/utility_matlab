function y = lpf_n(x,f_cut, Ts, n)

y = x;

for i=1:n
    y = lpf(y, f_cut, Ts);    
end
