function y = hpf(x, f, T)

b0 = 1/(pi*f*T+1);
b1 = -b0;

a0 = 1;
a1 = (pi*f*T-1)/(pi*f*T+1);

a = [a0 a1]; 
b = [b0 b1];

y = filter(b,a,x);
	
end