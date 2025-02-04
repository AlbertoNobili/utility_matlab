function y = lpf_ZP(x, f, T)
% This is like a second order LPF with zero phase delay

b0 = pi*f*T/(pi*f*T+1);
b1 = b0;

a0 = 1;
a1 = (pi*f*T-1)/(pi*f*T+1);

a = [a0 a1]; 
b = [b0 b1];

y = FiltFilt(b,a,x);
	
end