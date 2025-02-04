function y = lpf_ZP_n(x,f_cut, Ts, n)

y = x;

for i=1:n
    y = lpf_ZP(y, f_cut, Ts);    
end
