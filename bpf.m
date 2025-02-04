function y = bpf(x, f1, f2, T)

w1 = 2*pi*f1;
w2 = 2*pi*f2;

b0 = 2*T/((w1*T+1)*(T+2/w2));
b1 = 0;
b2 = -b0;

a0 = 1;
a1 = ((w1*T-2)*(T+2/w2)+(w1*T+2)*(T-2/w2))/((w1*T+2)*(T+2/w2));
a2 = ((w1*T-2)*(T-2/w2))/((w1*T+2)*(T+2/w2));

a = [a0 a1 a2]; 
b = [b0 b1 b2];

% y0_bar = x(1)-b0*x(1);
% y = filter(b,a,x, [y0_bar 0]);
y = filter(b,a,x);

end