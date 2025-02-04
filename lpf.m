function y = lpf(x, f, T)

b0 = pi*f*T/(pi*f*T+1);
b1 = b0;

a0 = 1;
a1 = (pi*f*T-1)/(pi*f*T+1);

a = [a0 a1]; 
b = [b0 b1];

y0_bar = x(1)-b0*x(1);
y = filter(b,a,x, y0_bar);
	
end